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


- ***Where is sudo logs in /var/log/sudo?***
```bash
cd /var/log/sudo/00/00 && ls
```


You will see a lot of directories with names like 01 2B 9S 4D etc. They contain the logs we need.

- ***how to see the input and output log***
```bash
cat log          #Input log
cat ttyout       #Output log
```
---

# What is UFW?

**Uncomplicated Firewall (UFW)** is a simple program for managing a netfilter firewall on Linux. It provides a straightforward command-line interface for setting up firewall rules, leveraging `iptables` for underlying configuration.

**How to add and remove port 8080 in UFW?**
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

*/1 * * * * sleep 30s && /path/to/monitoring.sh
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
