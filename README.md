# How a virtual machine works?
While virtual machines run like individual computers with individual operating systems and applications,
they have the advantage of remaining completely independent of one another and the physical host machine.
A piece of software called a hypervisor, or virtual machine manager, lets you run different operating systems on different virtual machines at the same time.
This makes it possible to run Linux VMs, for example, on a Windows OS, or to run an earlier version of Windows on more current Windows OS.
- what is hypervisor?
  A hypervisor is a software that you can use to run multiple virtual machines on a single physical machine.
  Every virtual machine has its own operating system and applications.
  The hypervisor allocates the underlying physical computing resources such as CPU and memory to individual virtual machines as required
- type of hypervisor?
  The type 1 hypervisor sits on top of the bare metal server and has direct access to the hardware resources.
  the type 2 hypervisor is an application installed on the host operating system

# Why do you use debian?
Most users appreciate the stability, and the smooth upgrade processes of both packages and the entire distribution.
Debian is also widely used by software and hardware developers because it runs on numerous architectures and devices,
offers a public bug tracker and other tools for developers.

# What is the difference between Rocky and Debain?
- Rocky
  Rocky is more stable than Debian and supports enterprise applications.
  Does not have an upgrade path.
  It comes with many security in-built features that help protect from cyber-attacks using SELinux.
  It helps to reduce the vulnerabilities of privilege escalation attacks. >> "package manager (DNF)"
- Debian
  Released and supported by the community
  Debian has more software/packages available.
  Debian community members still maintain it.
  It comes with an easy installation package(apt).

# What is The purpose of virtual machines?
- Cost savings
  running multiple virtual environments from one piece of infrastructure means that you can drastically reduce your physical infrastructure footprint.
  This boosts your bottom line—decreasing the need to maintain nearly as many servers and saving on maintenance costs and electricity.
- Agility and speed
  Spinning up a VM is relatively easy and quick and is much simpler than provisioning an entire new environment for your developers.
  Virtualization makes the process of running dev-test scenarios a lot quicker.
- Lowered downtime
  VMs are so portable and easy to move from one hypervisor to another on a different machine—this means that they are a great solution for backup,
  in the event the host goes down unexpectedly.
- Scalability
  VMs allow you to more easily scale your apps by adding more physical or virtual servers to distribute the workload across multiple VMs.
  As a result you can increase the availability and performance of your apps.
- Security benefits
  Because virtual machines run in multiple operating systems,
  using a guest operating system on a VM allows you to run apps of questionable security and protects your host operating system.
  VMs also allow for better security forensics, and are often used to safely study computer viruses,
  isolating the viruses to avoid risking their host computer.

![Alt text](https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/what-is-a-virtual-machine_overview-img?resMode=sharp2&op_usm=1.5,0.65,15,0&wid=2560&hei=862&qlt=95)
