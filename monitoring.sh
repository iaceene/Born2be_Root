#!/bin/sh  # This indicates that the script should be run using the 'sh' shell

# Wait for a calculated amount of time based on the system uptime (in minutes)
# The uptime command returns the system start time, and we extract the minutes and seconds
# Then, we calculate the sleep time by taking the remainder of minutes divided by 10, converting that into seconds.
sleep $(uptime -s | awk -F ":" '{print $2 % 10 * 60 + $3}')

# Get the CPU load by parsing the output of the 'top' command
# It calculates the sum of the user space and system space CPU usage percentages
cpu_load=$(top -bn1 | grep '%Cpu' | awk {'printf("%.1f%%", $2 + $4)'})

# Get the IP address of the system
# We use 'hostname -I' to get the IP address and format the output
IP=$(hostname -I | awk '{printf "IP %s\n", $1}')

# Get the MAC address by parsing the output of the 'ip addr' command
# We filter the line containing the 'link/ether' field, then format the output
Mac=$(ip addr | grep link/ether | awk '{printf "%s", $2}')

# Get the total disk space (in GB) by summing up the disk space of all file systems
# We exclude the first line (header) and divide the result by 1048576 to convert bytes to gigabytes
Total_disk=$(df | awk 'NR > 1 {sum += $2} END {printf "%d", sum / 1048576}')

# Get the disk usage (in MB) and calculate the total used disk space in MB
Usage_disk=$(df | awk 'NR > 1 {sum += $3} END {printf "%d", sum / 1024}')

# Get the number of CPU cores on the system
# This parses the output of 'lscpu' to extract the number of cores
Cores=$(lscpu | grep "Core(s)" | awk '{printf $4}')

# Use 'wall' to send a system message (the output will be displayed to all logged-in users)
wall "
    #Architecture: $(uname -a)  # Output the full system architecture info using 'uname'
    #CPU physical: $(lscpu | grep "CPU(s):" | awk '{print $2}' | head -n 1)  # Number of physical CPUs
    #vCPU: $(nproc)  # Number of virtual CPUs (logical cores)
    #Memory Usage: $(free -m | cat | grep Mem | awk '{printf "%s/%sMB (%.2f%%)\n", $3, $2, $3 / $2 * 100}')  # Memory usage in MB and percentage
    #Disk Usage: $Usage_disk/$Total_disk"Gb" $(printf "(%s%%)" $(echo \($Usage_disk*1024\)/\($Total_disk*1048576\)*100 | bc -l | awk -F "." '{printf $1}'))  # Disk usage in GB with percentage
    #CPU load: $cpu_load  # CPU load percentage
    #Last boot: $(who -b | awk '{printf "%s %s", $3, $4}')  # Display the last boot date and time
    #LVM use: $(cat /etc/fstab | grep "mapper" | wc -l | awk '{if($1 >= "1") {printf("yes\n")} else {printf("no\n")}}')  # Check if LVM is being used
    #Connections TCP: $(ss -Ht | wc -l | awk '{ if($1 >= 1){printf("%d ESTABLISHED", $1)}}')  # Display number of established TCP connections
    #User log: $(users | tr ' ' '\n' | uniq | wc -l)  # Count the number of unique logged-in users
    #Network: $IP ($Mac)  # Display the IP and MAC address
    #Sudo: $(journalctl -q _COMM=sudo | grep COMMAND  | wc -l) cmd  # Display the number of sudo commands executed
"
