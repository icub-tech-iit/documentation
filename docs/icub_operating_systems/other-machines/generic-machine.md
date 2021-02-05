# Introduction

This page contains instructions on how to prepare a machine to work in the iCub Subnet environment. This is a basic setup, useful as a starting point to prepare any kind of machine of the iCub ecosystem.

# Operating System

You can choose both a Debian or Ubuntu Linux, the currently suggested OS is [Ubuntu 20.04 (Focal Fossa)](http://releases.ubuntu.com/20.04/).

# User account

## Users and Passwords

The default user account is

**Username** : `icub`
**Password** : `icub`

If you want to change the default password simply execute (*this works only if you are using persistence*)

`passwd icub`

**NOTE**: As in any Ubuntu installation, the root user has no password, this means that the direct login (i.e. *ssh root\@icub-head*) is disabled, but you can always do

`sudo su - `

## Creation of the icub user

You need to create the icub user. For nfs (see later) to work this user has to have the uid 1000 and guid 1000. In LINUX starting procedure, is asks to create the first user. By default uid is set at 1000. To make sure it is done do :

```
id -u icub
id -g icub
```

Add the icub user to the sudoers group, as follows

`sudo usermod -aG sudo icub`

# Required and useful Packages

Please install the following packages (names are correct for Ubuntu 18.04, please check the corresponding package in your distribution):

` nfs-common python-tk libopencv-dev ntpdate ssh cmake-curses-gui`

Also install (optional, but very useful) the following packages:

`vim iperf`

# Debian Software repository

**NOTE** : this step is required only for a Debian machine.

Enable the **non-free** and **contrib** sources, by editing the file `/etc/apt/sources.list`

# iCub software repository and common packages

**NOTE** : skip this step in case of icub server

Configure the iCub software repository, by creating the file `/etc/apt/sources.list.d/icub.list` as following example

-   for a Debian 10 (Buster) machine :

`deb http://www.icub.org/debian buster contrib/science`

-   for a Ubuntu 20.04 LTS (Focal) machine :

`deb http://www.icub.org/ubuntu focal contrib/science`

Download the packages signature

`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 57A5ACB6110576A6`

After adding a new source, remember to update the packages list:

`apt-get update`

Install the following packages from icub repository

` icub-common`

# Network configuration

You have two options:

- Static IP address (this option is **mandatory**  if there is no DHCP in your subnet - like in the case of [the iCub server laptop](icub-server-laptop.md) - or if your machine is the DHCP server - this is the case of  [the "real" iCub server](icub-server-from-image.md) )
- Dynamic DHCP IP address

## Configuration methods
Usually, if you have a Desktop installed on your machine it's better to use the default desktop network tool (eg. in Ubuntu 20.04 the tool is [Network Manager](https://help.ubuntu.com/community/NetworkManager) ).

Otherwise, you can configure the network interfaces usign the commmand line configuration files (eg. in Ubuntu 20.40 you have to deal with [NETPLAN](https://netplan.io/) )

## the HOSTS file
Please check that the file `/etc/hosts` looks asfollows:

```
127.0.0.1       localhost
127.0.1.1       MACHINE_HOSTNAME.icub.local       MACHINE_HOSTNAME
```

where **MACHINE_HOSTNAME** is the hostname of you machine, that should match the file `/etc/hostname`

## Mount remote NFS shares

**NOTE** : skip this step in case of [iCub server LAPTOP](icub-server-laptop.md) or [iCub server](icub-server-from-image.md)

To mount the remote NFS shares, edit `/etc/fstab`, by adding the folowing lines

```
NFS_SERVER_IP:/exports/code /usr/local/src/robot nfs soft,retry=1,timeo=60,_netdev,auto  0 0
NFS_SERVER_IP:/exports/local_yarp    /home/icub/.local/share/yarp nfs soft,retry=1,timeo=60,_netdev,auto 0 0
```
and replace **NFS_SERVER_IP** with the appropriate value for your network. As example, in case of a machine in an environment with the icub server the above configuration will be

` 10.0.0.1:/exports/code /usr/local/src/robot nfs soft,retry=1,timeo=60,_netdev,auto  0 0`\
` 10.0.0.1:/exports/local_yarp    /home/icub/.local/share/yarp nfs soft,retry=1,timeo=60,_netdev,auto 0 0`

Then create the two above mountpoints as follows

` mkdir -p /home/icub/.local/share/yarp`

` mkdir -p /usr/local/src/robot`

# NTP configuration

**NOTE** : skip this step in case of icub server (both "real" and "laptop" versions)

Edit the file `/etc/ntp.conf` by adding the following line

```
server NTP_SERVER_IP
```

and replace **NTP_SERVER_IP** with the appropriate value for your network. As example, in case of a machine in an environment with the icub server the above configuration will be

```
server 10.0.0.1
```

# iCub user environment variables

**NOTE** : skip this step in case of [iCub server](icub-server-from-image.md)

Please see [this section](../icubos/user-env.md)

## iCub bashrc customization

There are several customization you need to apply to the file `.bashrc\_iCub`:

- The YARP_ROBOT_NAME - you must insert your robot name, in the    following line and remove comment

`#export YARP_ROBOT_NAME=`

- The build path - the folder name where you object are created by cmake, in the following line

`#export OBJ_SUBDIR="build" `

# _Optional_ - Configure remote desktop

If you want to setup a VNC remote desktop, execute from a graphical session the following command

` vino-preferences`

If you get this error _The authentication mechanism requested can not be provided by the computer_ please launch the following command, from a shell terminal

` gsettings set org.gnome.Vino enabled true`

# _Optional_ - Disable the screen power off

Using the gnome3 control panel, it is not possible to avoid the system has to be idle for the monitor to be turned off, the maximum time is "1 hour", "never" is not possible. From the command line execute the following commands

`gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 0`

`gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 0`

`gsettings set org.gnome.desktop.session idle-delay 0`

# _Optional_ - install nVidia video drivers

1. Check if you have nvidia hardware

`sudo ubuntu-drivers devices`

and check the command output. In case of nvidia hardare you should see somthing like the following example

```
== /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0 ==

vendor   : NVIDIA Corporation
modalias : pci:v000010DEd00000DDAsv000017AAsd000021D1bc03sc00i00
model    : GF106GLM [Quadro 2000M]
driver   : xserver-xorg-video-nouveau - distro free builtin
driver   : nvidia-304-updates - distro non-free
driver   : nvidia-304 - distro non-free
driver   : nvidia-331 - distro non-free recommended
driver   : nvidia-331-updates - distro non-free
```

The above example is showing that there are several different nVidia driver versions available, you should chose the **recommended** one (the `nvidia-331` in above example )

2. Install the appropriate nvidia driver, as follows (for the example above)

`sudo apt install nvidia-331`

3. Reboot

For further details, please read [thi guide](https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia)

# _Optional_ - Fix the the .local domains resolution problems

**NOTE**: only on clients, NOT on icub server.

Edit `/etc/nsswitch` replacing the following line

` hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4`

with

` hosts:          files dns`

# _Optional_ - how to fix ssh lag on connect

In case of lag in SSH connections, disable DNS lookup on ssh server, edit the file `/etc/ssh/sshd_config` adding the following line

`UseDNS no`

# _Optional_ - how to fix the \"nobody:nobody\" NFS mount issue

If the NFS mounts shows NOBODY as UID and GUID, this mean that the client and the server are not in the same domain, check the file

` /etc/idmap.conf`

Usually it is derived from the domain name mentioned in

` /etc/resolv.conf`

so both, server and client must match.

# Special computers

In case of special machines (such as the cuda workstation or icub laptop) you must follow further steps in order to complete the installation:

-   [The iCub server](icub-server-from-image.md)
-   [The iCub server laptop](icub-server-laptop.md)
-   [The nVidia CUDA workstation](cuda-workstation.md)
