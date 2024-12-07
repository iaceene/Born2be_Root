#!/bin/sh

sleep $(uptime -s | awk -F ":" '{print $2 % 10 * 60 + $3}')

cpu_load=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')
IP=$(hostname -I | awk '{printf "IP %s\n", $1}')
Mac=$(ip addr | grep link/ether | awk '{printf "%s", $2}')
Total_disk=$(df | awk 'NR > 1 {sum += $2} END {printf "%d", sum / 1048576}')
Usage_disk=$(df | awk 'NR > 1 {sum += $3} END {printf "%d", sum / 1024}')
Cores=$(lscpu | grep "Core(s)" | awk '{printf $4}')
Threads=$(lscpu | grep "Thread(s)" | awk '{printf $4}')

wall "
    "#Architecture :" $(uname -a)
    "#CPU physical :" $(lscpu | grep "CPU(s):" | awk '{print $2}' | head -n 1)
    "#vCPU :" $(printf %d $(echo $Threads*$Cores | bc))
    "#Memory Usage:" $(free -m | cat | grep Mem | awk '{printf "%s/%sMB (%.2f%%)\n", $3, $2, $3 / $2 * 100}')
    "#Disk Usage:" $Usage_disk/$Total_disk"Gb" $(printf "(%s%%)" $(echo \($Usage_disk*1024\)/\($Total_disk*1048576\)*100 | bc -l | awk -F "." '{printf $1}'))
    "#CPU load:" $cpu_load
    "#Last boot:" $(who -b | awk '{printf "%s %s", $3, $4}')
    "#LVM use:" $(cat /etc/fstab | grep "mapper" | wc -l | awk '{if($1 >= "1") {printf("yes\n")} else {printf("no\n")}}')
    "#Connections TCP :" $(ss -Ht | wc -l | awk '{ if($1 >= 1){printf("%d ESTABLISHED", $1)}}')
    "#User log:" $(users | wc -l)
    "#Network:" $IP ($Mac)
    "#Sudo :" $(journalctl -q _COMM=sudo | grep COMMAND  | wc -l) cmd
"
