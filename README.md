# Setup
Watch this [video](https://www.youtube.com/watch?v=73r3JbkCVy0&ab_channel=MyCodeUrCode)

# How a Virtual Machine Works

Virtual machines (VMs) operate like individual computers with their own operating systems and applications. However, VMs remain completely independent of each other and the physical host machine. A piece of software called a **hypervisor** or **virtual machine manager** allows you to run different operating systems on different virtual machines simultaneously. This makes it possible to run Linux VMs, for example, on a Windows OS or run an older version of Windows on a more current Windows OS.

### What is a Hypervisor?

A hypervisor is software that allows you to run multiple virtual machines on a single physical machine. Each virtual machine has its own operating system and applications. The hypervisor allocates the underlying physical resources, such as CPU and memory, to each VM as required.

- **Type 1 Hypervisor**: Sits directly on top of the physical hardware (bare metal) and has direct access to the hardware resources.
- **Type 2 Hypervisor**: Runs as an application on a host operating system.

---

# Why Use Debian?

Debian is highly appreciated for its stability and smooth upgrade processes for both packages and the entire distribution. It is widely used by software and hardware developers due to its ability to run on numerous architectures and devices. Debian also offers a public bug tracker and other development tools.

---

# What is the Difference Between Rocky and Debian?

- **Rocky Linux**:
  - More stable and focused on enterprise applications.
  - Lacks an upgrade path.
  - Features in-built security, including SELinux for protection against cyber-attacks and privilege escalation.
  - Package manager: `DNF`.

- **Debian**:
  - Community-supported and widely used.
  - Offers a large selection of software/packages.
  - Easy-to-use installation package manager: `APT`.

---

# The Purpose of Virtual Machines

- **Cost Savings**: Running multiple virtual machines from one physical server reduces the need for additional hardware, saving on both server maintenance and electricity.
  
- **Agility and Speed**: VMs can be quickly spun up, making it easier to set up dev-test environments.

- **Lowered Downtime**: VMs are portable and easy to move across hypervisors, making them ideal for backup solutions.

- **Scalability**: VMs allow you to add more physical or virtual servers to distribute workloads, increasing app availability and performance.

- **Security Benefits**: VMs can isolate insecure applications by running them in separate guest operating systems, minimizing risks to the host system. They are also useful for safe virus analysis.

---

# The Difference Between `apt` and `aptitude`

- **APT**: A command-line interface for package management in Debian-based systems. It handles package installation, upgrades, and removals.
  
- **Aptitude**: Offers a visual interface in addition to the command line. Aptitude can automatically resolve package conflicts, while `apt` typically requires manual intervention.

---

# What is AppArmor?

AppArmor ("Application Armor") is a Linux kernel security module that enables system administrators to restrict a program's capabilities using profiles. These profiles define what the program can do (e.g., network access, file permissions). AppArmor provides **Mandatory Access Control (MAC)**, supplementing traditional Unix **Discretionary Access Control (DAC)**.
**How AppArmor works**
AppArmor, short for Application Armor, is a kernel security module for Debian-based Linux distributions that allows you to define per-application security profiles. These profiles restrict what system resources an application can access, effectively creating a sandbox around each application.

---
# User Management

- **Creating a User**:
```bash
sudo adduser evaluser
```

- **Creating a Group**:
```bash
sudo groupadd eval
```

- **Adding a User to a Group**:
```bash
sudo adduser evaluser eval
```

- **Check if the User is Added**:
```bash
sudo getent group eval
```

### Advantages of a Strong Password Policy:
- **Improved Security**: Enforcing complex passwords (e.g., minimum length, mixed characters) makes passwords harder to crack.
- **Protection Against Attacks**: Defends against dictionary and password spraying attacks.
- **Reduced Risk of Breaches**: Minimizes the chance of unauthorized access to sensitive systems.

---

# Hostname and Partitions

- **View Partitions**:
```bash
lsblk
```

- **How to change hostname?***
```bash
sudo nano /etc/hostname
```

### How LVM Works

LVM (Logical Volume Management) allows for flexible disk storage management by abstracting physical disks into logical volumes. This enables dynamic resizing, pooling, and snapshotting of volumes.

1. **Physical Volume (PV)**: A physical disk or partition initialized for LVM.
2. **Volume Group (VG)**: A collection of physical volumes that can be managed as a single unit.
3. **Logical Volume (LV)**: A virtualized partition within a volume group.
4. **Physical Extent (PE)**: A fixed-size block of storage in a physical volume.
5. **Logical Extent (LE)**: The corresponding unit in a logical volume.

LVM is ideal for environments that require flexibility, scalability, and efficient storage management, but it may be complex for simpler setups.

---

# Sudo

- **What is `sudo`?**  
`sudo` (short for "superuser do") allows a permitted user to execute commands as another user, typically the superuser (root), on Unix-like operating systems.
- ***Check that the "sudo" program is properly installed***
```bash
dpkg -l | grep sudo
```
-***assigning your new user to the "sudo" group***
```bash
sudo adduser newuser sudo
```
- ***sudo config explain***
  
**passwd_tries** --> The number of tries a user gets to enter his/her password before sudo logs the failure and exits. The default is 3.

**passwd_timeout** --> Number of minutes before the sudo password prompt times out, or 0 for no timeout. The timeout may include a fractional component if minute granularity is insufficient, for example 2.5. The default is 5.

**badpass_message** --> Message that is displayed if a user enters an incorrect password. The default is Sorry, try again. unless insults are enabled.

**iolog_dir** --> The top-level directory to use when constructing the path name for the input/output log directory. Only used if the log_input or log_output options are enabled or when the LOG_INPUT or LOG_OUTPUT tags are present for a command. The session sequence number, if any, is stored in the directory. The default is /var/log/sudo-io.

-**secure_path** --> Path used for every command run from sudo. If you don't trust the people running sudo to have a sane PATH environment variable you may want to use this. Another use is if you want to have the ''root path'' be separate from the ''user path''. Users in the group specified by the exempt_group option are not affected by secure_path. This option is not set by default.

**requiretty** --> If set, sudo will only run when the user is logged in to a real tty. When this flag is set, sudo can only be run from a login session and not via other means such as cron or cgi-bin scripts. This flag is off by default.

**log_input** --> If set, sudo will run the command in a pseudo tty and log all user input. If the standard input is not connected to the user's tty, due to I/O redirection or because the command is part of a pipeline, that input is also captured and stored in a separate log file.
Input is logged to the directory specified by the iolog_dir option (
/var/log/sudo-io by default) using a unique session ID that is included in the normal sudo log line, prefixed with ''TSID=''. The iolog_file option may be used to control the format of the session ID.
Note that user input may contain sensitive information such as passwords (even if they are not echoed to the screen), which will be stored in the log file unencrypted. In most cases, logging the command output via log_output is all that is required.

**logfile** --> Path to the sudo log file (not the syslog log file). Setting a path turns on logging to a file; negating this option turns it off. By default, sudo logs via syslog.

**log_output** --> If set, sudo will run the command in a pseudo tty and log all output that is sent to the screen, similar to the script(1) command. If the standard output or standard error is not connected to the user's tty, due to I/O redirection or because the command is part of a pipeline, that output is also captured and stored in separate log files.
Output is logged to the directory specified by the iolog_dir option (
/var/log/sudo-io by default) using a unique session ID that is included in the normal sudo log line, prefixed with ''TSID=''. The iolog_file option may be used to control the format of the session ID.
Output logs may be viewed with the sudoreplay(8) utility, which can also be used to list or search the available logs.


- ***Where is sudo logs in /var/log/sudo?***
```bash
cd /var/log/sudo/00/00 && ls #in this dir u will see a lot of output of the sudo commands, like /S1 /ZX...
```


You will see a lot of directories with names like 01 2B 9S 4D etc. They contain the logs we need.

- ***how to see the input and output log***
```bash
cat input.log          #Input log this file is stored in /var/log/sudo/input.log
sudoreplay /S1         #Output log this  "S1" is stored on /var/log/sudo/00/00
```

- ***What is sudo replay***

sudoreplay plays back or lists the output logs created by sudo. When replaying, sudoreplay can play the session back in real-time, or the playback speed may be adjusted (faster or slower) based on the command line options.

---

# Password Policies :
- **chage command**
The chage (change age) command changes the number of days between password changes and the date of the last password change.
This information is used by the system to determine when a user must change their password.


- **login.defs file**
The /etc/login.defs file defines the site-specific configuration for the shadow password suite. This file is required. Absence of this file will not prevent system operation, but will probably result in undesirable operation.
```bash
# vim /etc/login.defs
# Password aging controls:
#
#	PASS_MAX_DAYS	Maximum number of days a password may be used.
#	PASS_MIN_DAYS	Minimum number of days allowed between password changes.
#	PASS_WARN_AGE	Number of days warning given before a password expires.
#
PASS_MAX_DAYS	30 # Your password has to expire every 30 days
PASS_MIN_DAYS	2  # The minimum number of days allowed before the modification of a password will be set to 2.
PASS_WARN_AGE	7  # The user has to receive a warning message 7 days before their password expires.
```

- **PAM**
  Linux Pluggable Authentication Modules (PAM) is a suite of libraries that allow a Linux system administrator to configure methods to authenticate users.

- **pam_pwquality**
  PAM module to perform password quality checking, The first action is to prompt for a single password, check its strength and then, if it is considered strong, prompt for the password a second time (to verify that it was typed correctly on the first occasion). All being well, the password is passed on to subsequent modules to be installed as the new authentication token.

  To see all [OPTIONS](https://manpages.debian.org/testing/libpam-pwquality/pam_pwquality.8.en.html#OPTIONS)

  to use this options :

  ```bash
  # vim /etc/pam.d/common-password << u must install the "pam_pwquality" >>
  # edite this line
  # password	requisite			pam_pwquality.so <here u can add the options>
  password	requisite			pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 dcredit=-1 maxrepeat=3 reject_username enforce_for_root difok=7
  ```
  - minlen=N :  (N >= 0) This is the maximum credit for having upper case letters in the new password. If you have less than or N upper case letters, each upper case letter will count +1 towards meeting the current minlen value. The default for ucredit is 0 which means there is no bonus for upper case letters in password.

  - ucredit=N : (N >= 0) This is the maximum credit for having upper case letters in the new password. If you have less than or N upper case letters, each upper case letter will count +1 towards meeting the current minlen value. The default for ucredit is 0 which means there is no bonus for upper case letters in password.
(N < 0) This is the minimum number of upper case letters that must be met for a new password.

  - lcredit=N : (N >= 0) This is the maximum credit for having lower case letters in the new password. If you have less than or N lower case letters, each
    lower case letter will count +1 towards meeting the current minlen value. The default for lcredit is 0 which means there is no bonus for lower case
    letters in password.
    (N < 0) This is the minimum number of lower case letters that must be met for a new password.

  - dcredit=N : (N >= 0) This is the maximum credit for having digits in the new password. If you have less than or N digits, each digit will count +1
    towards meeting the current minlen value. The default for dcredit is 0 which means there is no bonus for digits in password.
    (N < 0) This is the minimum number of digits that must be met for a new password.

  - maxrepeat=N : Reject passwords which contain more than N same consecutive characters. The default is 0 which means that this check is disabled.
 
  - reject_username : Password and username cannot be identical

  - difok=N : This argument will change the default of 1 for the number of changes in the new password from the old password.
    The special value of 0 disables all checks of similarity of the new password with the old password except the new password being exactly the same as the
    old one.
 
  - enforce_for_root : Rules also apply for root, The module will return error on failed check even if the user changing the password is root. This option is
    off by default which means that just the message about the failed check is printed but root can change the password anyway. Note that root is not asked
    for an old password so the checks that compare the old and new password are not performed.
---

# What is UFW?

**Uncomplicated Firewall (UFW)** is a simple program for managing a netfilter firewall on Linux. It provides a straightforward command-line interface for setting up firewall rules, leveraging `iptables` for underlying configuration.


**How to Check if UFW properly installed**
  ```bash
dpkg -l | grep "ufw"
  ```
**How to add and remove port 8080 in UFW **
```bash
sudo ufw status             #list all the rules
sudo ufw allow 8080/tcp     #add a rule
sudo ufw status             #check
# sudo ufw deny 8080        for deny the connection?
sudo ufw delete 3           # 3 the number of the rule 8080
```

---

# What is SSH?

**SSH (Secure Shell)** is a protocol for securely accessing remote computers over an unsecured network. It uses encryption and public key authentication to provide a secure connection between devices.

- **How SSH works**: SSH uses **public key cryptography**, which involves two keys — a public key (shared with others) and a private key (kept secret). Both sides of the connection authenticate using their respective keys, ensuring secure communication.
  
- **TCP/IP**: SSH runs on top of the TCP/IP protocol, ensuring the secure delivery of data packets between devices. While HTTPS verifies the identity of a web server, SSH allows for remote command-line access.

-***check the status***
```bash
sudo service ssh status
```


-***port 4242***
```bash
sudo vim /etc/ssh/sshd_config
```


- **Verify SSH Port**:
```bash
sudo ufw status
```

- **Login to SSH**:
```bash
ssh username@yourip -p 4242
```

- **Login as Root (should be disabled for security)**:
```bash
ssh root@yourip -p 4242
```
---

# Script Monitoring

### What is "cron"?

A **cron job** is a scheduled task on Unix-like systems used to automate repetitive tasks. It allows you to run commands or scripts at specific intervals.<br>
**the diffrence between cron and cronjob?** cron: The daemon (service) that runs in the background and executes scheduled tasks.<br>
crontab: The file or command used to define, manage, or edit those scheduled tasks.

- ***setup cron to run every minute***
```bash
crontab -e

#edit this line

*/1 * * * *  && /path/to/monitoring.sh
```

---

# Bonus

### What is WordPress?

WordPress is an open-source content management system (CMS) used to create and manage websites and blogs. It's the most popular CMS, powering over 40% of websites globally. WordPress is known for its ease of use, flexibility, and extensive community support.

![WordPress](https://s.w.org/style/images/about/WordPress-logotype-alternative.png)

### What is Lighttpd?

Lighttpd is a lightweight, high-performance web server optimized for serving static content. It is designed for scalability and efficient handling of numerous simultaneous connections with minimal resource usage. Lighttpd is ideal for static-heavy websites or reverse proxy setups.

### What is MariaDB?

MariaDB is an open-source relational database management system (RDBMS) and a drop-in replacement for MySQL. It is widely used for managing structured data, powering everything from small websites to large enterprise applications.



