# Generic iCub environment machines

This page contains instructions on how to prepare a machine to work in the iCub Subnet environment. This basic setup is useful as a starting point for preparing any machine in the iCub ecosystem.

## Operating System

You can choose both a Debian or Ubuntu Linux, the currently suggested OS is [Ubuntu 22.04 (Jammy Jellyfish)](http://releases.ubuntu.com/22.04/).

## User account

### Users and Passwords

The default user account is

**Username** : `icub`
**Password** : `icub`

If you want to change the default password simply execute (*this works only if you are using persistence*)

`passwd icub`

!!! note "root login"
    As in any Ubuntu installation, the root user has no password, this means that the direct login (i.e. *ssh root\@icub-head*) is disabled, but you can always do

`sudo su - `


Add the icub user to the sudoers group, as follows

`sudo usermod -aG sudo icub`

## Required and useful Packages

Please install the following packages (names are correct for Ubuntu 20.04, please check the corresponding package in your distribution):

` nfs-common python-tk libopencv-dev ntpdate ssh cmake-curses-gui`

Also install (optional, but very useful) the following packages:

`vim iperf`

## Debian Software repository

!!! warning "for Debian systems"
    this step is required only for a Debian machine.

Enable the **non-free** and **contrib** sources, by editing the file `/etc/apt/sources.list`

## Network configuration

You have two options:

- Static IP address (this option is **mandatory**  if there is no DHCP in your subnet - like in the case of the [iCub Console Server](icub-server-laptop.md) - or if your machine is the DHCP server - this is the case of  the [iCub Dedicated Server](icub-server-from-scratch.md) )
- Dynamic DHCP IP address

### Configuration methods
Usually, if you have a Desktop installed on your machine it's better to use the default desktop network tool (e.g., in Ubuntu 22.04 the tool is [Network Manager](https://ubuntu.com/core/docs/networkmanager)) or its CLI `nmtui`, which is very powerful and easy to use even when connected via `ssh`.

Otherwise, you can configure the network interfaces using the command line configuration files (eg. in Ubuntu 22.04 you have to deal with [NETPLAN](https://netplan.io/) )

### the HOSTS file
Please check that the file `/etc/hosts` looks as follows:

```
127.0.0.1       localhost
127.0.1.1       MACHINE_HOSTNAME.icub.local       MACHINE_HOSTNAME
```

where **MACHINE_HOSTNAME** is the hostname of your machine, which should match the file `/etc/hostname`


## NTP configuration

!!! warning "in case of iCub server"
    Skip this step in case of [iCub Console Server](icub-server-laptop.md) or [iCub Dedicated Server](icub-server-from-scratch.md)

You should configure this machine as an NTP client and then configure the NTP service to point to `icub-srv` as an NTP server.

You can use several different packages to install an NTP client, but we recommend using `systemd-timesyncd` and removing the package `ntp`, if present.

To configure `timesyncd` the only thing needed is to edit the file `/etc/systemd/timesyncd.conf` by adding the line `NTP=10.0.0.1` or your current NTP server IP address.

Not mandatory but recommended, add also in the same file the line `FallbackNTP=ntp.ubuntu.com` this will be our backup NTP server.

Finally, restart `timesyncd`service

`sudo systemctl restart systemd-timesyncd`

## iCub user environment variables

!!! warning "in case of iCub dedicated server"
    Skip this step in case of [iCub Dedicated Server](icub-server-from-scratch.md)

see [_User Environment_](../icubos/user-env.md) chapter

## Customize the system

What now you need to do is to customize the installation with your hardware and environment (see [_User Environment_](../icubos/user-env.md) chapter)

## Special computers

In the case of special machines (such as the CUDA workstation or icub laptop) you must follow further steps in order to complete the installation:

-   [iCub Dedicated Server](icub-server-from-scratch.md)
-   [iCub Console Server](icub-server-laptop.md)
-   [The nVidia CUDA workstation](cuda-workstation.md)
