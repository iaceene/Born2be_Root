# How a virtual machine works?
While virtual machines run like individual computers with individual operating systems and applications,
they have the advantage of remaining completely independent of one another and the physical host machine.
A piece of software called a hypervisor, or virtual machine manager, lets you run different operating systems on different virtual machines at the same time.
This makes it possible to run Linux VMs, for example, on a Windows OS, or to run an earlier version of Windows on more current Windows OS.
- what is hypervisor?
A hypervisor is a software that you can use to run multiple virtual machines on a single physical machine.
Every virtual machine has its own operating system and applications.
The hypervisor allocates the underlying physical computing resources such as CPU and memory to individual virtual machines as required
- The type 1 hypervisor sits on top of the bare metal server and has direct access to the hardware resources.
- the type 2 hypervisor is an application installed on the host operating system.

![Alt text](https://www.stackscale.com/wp-content/uploads/2023/02/Hypervisors-stackscale.jpg)

# Why do you use debian?
Most users appreciate the stability, and the smooth upgrade processes of both packages and the entire distribution.
Debian is also widely used by software and hardware developers because it runs on numerous architectures and devices,
offers a public bug tracker and other tools for developers.
![Alt text](https://blog.desdelinux.net/wp-content/uploads/2018/06/Debian-10-830x472.jpg)

# What is the difference between Rocky and Debain?
  - Rocky is more stable than Debian and supports enterprise applications.
  Does not have an upgrade path.
  It comes with many security in-built features that help protect from cyber-attacks using SELinux.
  It helps to reduce the vulnerabilities of privilege escalation attacks. >> "package manager (DNF)"
- Debian Released and supported by the community
  Debian has more software/packages available.
  Debian community members still maintain it.
  It comes with an easy installation package(apt).
  
![Alt text](https://hackaday.com/wp-content/uploads/2021/06/rocky-linux-featured.jpg)

# What is The purpose of virtual machines?
- Cost savings : 
  running multiple virtual environments from one piece of infrastructure means that you can drastically reduce your physical infrastructure footprint.
  This boosts your bottom line—decreasing the need to maintain nearly as many servers and saving on maintenance costs and electricity.
- Agility and speed : 
  Spinning up a VM is relatively easy and quick and is much simpler than provisioning an entire new environment for your developers.
  Virtualization makes the process of running dev-test scenarios a lot quicker.
- Lowered downtime : 
  VMs are so portable and easy to move from one hypervisor to another on a different machine—this means that they are a great solution for backup,
  in the event the host goes down unexpectedly.
- Scalability : 
  VMs allow you to more easily scale your apps by adding more physical or virtual servers to distribute the workload across multiple VMs.
  As a result you can increase the availability and performance of your apps.
- Security benefits : 
  Because virtual machines run in multiple operating systems,
  using a guest operating system on a VM allows you to run apps of questionable security and protects your host operating system.
  VMs also allow for better security forensics, and are often used to safely study computer viruses,
  isolating the viruses to avoid risking their host computer.

![Alt text](https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/what-is-a-virtual-machine_overview-img?resMode=sharp2&op_usm=1.5,0.65,15,0&wid=2560&hei=862&qlt=95)

# The difference between aptitude and apt?
- Apt offers a command-line interface, while aptitude offers a visual interface. When facing a package conflict, `apt` will not fix the issue while `aptitude` will suggest a resolution that can do the job.
- aptitude can interactively retrieve and displays the Debian changelog of all available official packages

# What APPArmor is?
AppArmor ("Application Armor") is a Linux kernel security module that allows the system administrator to restrict programs' capabilities with per-program profiles. Profiles can allow capabilities like network access, raw socket access, and the permission to read, write, or execute files on matching paths. AppArmor supplements the traditional Unix discretionary access control (DAC) model by providing mandatory access control (MAC).

![Alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/AppArmor_logo.svg/440px-AppArmor_logo.svg.png)

# What is UFW?
Uncomplicated Firewall (UFW) is a program for managing a netfilter firewall designed to be easy to use. It uses a command-line interface consisting of a small number of simple commands, and uses iptables for configuration.

![Alt text](https://docs.vultr.com/public/doc-assets/1783/1f939acc6b9bb99c.webp)

# What is SSH?
The Secure Shell (SSH) protocol is a method for securely sending commands to a computer over an unsecured network. SSH uses cryptography to authenticate and encrypt connections between devices.
- SSH runs on top of the TCP/IP protocol suite — which much of the Internet relies upon. TCP stands for Transmission Control Protocol and IP stands for Internet Protocol. TCP/IP pairs those two protocols in order to format, route, and deliver packets. IP indicates, among other information, which IP address a packet should go to (think of a mailing address), while TCP indicates which port a packet should go to at each IP address (think of the floor of a building or an apartment number).
TCP is a transport layer protocol: it is concerned with the transportation and delivery of data packets. Usually, additional protocols are used on top of TCP/IP in order to put the transmitted data in a form that applications can use. SSH is one such protocol. (Other examples include HTTP, FTP, and SMTP.)
- SSH is "secure" because it incorporates encryption and authentication via a process called public key cryptography. Public key cryptography is a way to encrypt data, or sign data, with two different keys. One of the keys, the public key, is available for anyone to use. The other key, the private key, is kept secret by its owner. Because the two keys correspond to each other, establishing the key owner's identity requires possession of the private key that goes with the public key.
These "asymmetric" keys — so called because they have different values — also make it possible for the two sides of the connection to negotiate identical, shared symmetric keys for further encryption over the channel. Once this negotiation is complete, the two sides use the symmetric keys to encrypt the data they exchange.
In an SSH connection, both sides have a public/private key pair, and each side authenticates the other using these keys. This differentiates SSH from HTTPS, which in most implementations only verifies the identity of the web server in a client-server connection. (Other differences include that HTTPS usually does not allow the client to access the server's command line, and that firewalls sometimes block SSH but almost never block HTTPS.)

![Alt text](https://miro.medium.com/v2/resize:fit:1024/0*tgrMTzwM0nO7DDjQ.png)

# User
- creating a user
```bash
  sudo adduser evaluser
```
- creating a group
```bash
  sudo groupadd eval
```
- adding the user to eval group
```bash
  sudo adduser evaluser eval
```
- check the user if it added or not
```bash
  sudo getent group eval
```

- Advantages of a Strong Password Policy:
- Improved Security: Stronger Passwords: By enforcing complexity (e.g., minimum length, combinations of upper and lower case letters, numbers, and symbols), the policy helps ensure passwords are harder for attackers to guess or crack using brute-force methods.
Protection Against Common Attacks: It helps defend against attacks such as dictionary attacks or password spraying, which rely on simple, predictable passwords.
Reduced Risk of Data Breaches:
Strong passwords significantly reduce the likelihood of unauthorized access to sensitive systems. By requiring frequent password changes and prohibiting reused or weak passwords, the policy limits the impact of compromised credentials.
-Advantages of Implementing a Password Policy:
Standardization Across the Organization:
Having a policy ensures that all users follow the same guidelines, which simplifies training and monitoring efforts. It's easier to ensure consistent security across teams and departments.


#Hostname and partitions

- how to view the partitions for this virtual machine
```bash
lsblk
```
- how LVM works and what it is all about ?<br>
  LVM (Logical Volume Management) is a flexible and dynamic system for managing disk storage in Linux/UNIX systems. It allows administrators to manage disk
  partitions more efficiently by abstracting physical disks into logical volumes (LVs), making it easier to resize, combine, and manage storage.
  
1. Physical Volume (PV):
A storage device (hard drive, SSD, or partition) initialized for use with LVM. It forms the foundation of the storage pool.
Volume Group (VG):
A collection of physical volumes (PVs) that is treated as a single unit. It abstracts the underlying physical hardware and allows for more flexible storage management.
2. Logical Volume (LV):
A virtualized partition created within a volume group. LVs are where data is stored and are presented as if they were physical partitions, but they can be resized or moved more easily.
3. Physical Extent (PE):
A small, fixed-size block of storage in a physical volume. Logical volumes are made up of multiple physical extents.
4. Logical Extent (LE):
The corresponding unit of storage in a logical volume, which maps to physical extents in the volume group.

















