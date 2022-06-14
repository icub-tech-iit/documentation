# The iCub Dedicated Server - Installation from scratch
Since iCubOS is based on Ubuntu server, we will install Ubuntu server from the default installer and the we manually costimize it.

# Latest versions
Latest version is based on Ubuntu Server 20.04.2

# Prerequisite
Please check that the BIOS configuration allows to boot from USB drive.

# Create the USB installer
The first step is download the [official Ubuntu 20.04 LTS Server install media](https://releases.ubuntu.com/focal/ubuntu-20.04.1-live-server-amd64.iso) from the [release page](https://releases.ubuntu.com/focal/)

Then please create the USB installer using an USB memory and a tool like [Balena Etcher](https://www.balena.io/etcher/).

On Ubuntu website, you can find further info about creating a bootable USB stick on [Windows](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows?_ga=2.181742695.1184983981.1588944309-600352565.1586438290), [Ubuntu](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu?_ga=2.181742695.1184983981.1588944309-600352565.1586438290) or [macOS](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-macos?_ga=2.236980288.1184983981.1588944309-600352565.1586438290)

# Install system
Use the following details to install Ubuntu server on icub-server.
You can find further details and guides on [the official Ubuntu Server installation guide](https://ubuntu.com/server/docs)

## Basic Info
- **Hostname** : icub-srv
- **IP address** : 10.0.0.1
- **Username** : icub
- **Password** : icub

## Operative System
- **Installed OS** : Ubuntu Server 20.04.2 LTS
- **Language** : english
- **Country** : Italy
- **Locale** : en_US.UTF-8
- **Keyboard** : english (US)
- **Hostname** : icub-srv
- **Kernel version** :  5.4.0-73-generic x86_64
- **Partions** : single - 237Gb EXT4 (plus EFI)

!!! warning
    _Please disable LVM configuration during the partitioning step of installation procedure_

## Network configuration

### external connection
```
enp1s0:
  dhcp4: true
  dhcp6: false
  dhcp-identifier: mac
  optional: true
```

###  internal connection
```
enp2s0:
  dhcp4: false
  dhcp6: false
  addresses: [10.0.0.1/24]
```

!!! note "configuration details"
    See file `/etc/netplan/50-icub-srv.yaml` for configuration details

## Remove Cloud Init package
Remove cloud init package
```
sudo apt purge cloud-guest-utils cloud-init cloud-initramfs-copymods cloud-initramfs-dyn-netconf
```

##IP forwarding
To enable IP forwarding edit the file /etc/sysctl.conf by modifying the below line as follows
```
net.ipv4.ip_forward = 1
```

## Network Address Translation
The following IPTABLES rules enable the NAT
```
sudo iptables --table nat --append POSTROUTING --out-interface enp1s0 -j MASQUERADE
sudo iptables --append FORWARD --in-interface enp2s0 --out-interface enp1s0 -j ACCEPT
```

Install the package iptables-persistent
```
sudo apt install iptables-persistent
```

!!! note "further details"
    See file `/etc/iptables/rules.v4` for persistent rules details

## DNS Server
Install package bind9
```
sudo apt install bind9 bind9utils
```

!!! note "further details"
    See configuration files in `/etc/bind` and `/var/lib/bind` for further details

### Fix logging configuration
create the folder `/var/log/bind/` and set correct ownership
```
mkdir /var/log/bind/
chown bind:bind /var/log/bind/
```

## DHCP Client
Edit the file `/etc/dhcp/dhclient.conf`  adding the following lines
```
supersede domain-name "icub.local";
prepend domain-name-servers 127.0.0.1;
```

## DHCP Server
Install package isc-dhcp-server
```
sudo apt install isc-dhcp-server
```
Edit the file /etc/default/isc-dhcp-server as follows
```
INTERFACESv4="enp2s0"
```

!!! note "further details"
    See configurations files in `/etc/dhcp` for configuration details

### Fix logging configuration
Create the folder `/var/log/dhcpd/` and set correct ownerhip
```
mkdir /var/log/dhcpd/
chown bind:bind /var/log/named/
```

### RNDC fix
To fix the RNDC please use the following commands
```
sudo cp /etc/bind/rndc.key /etc/dhcp/ddns-keys/
sudo chown root:root /etc/dhcp/ddns-keys/rndc.key
sudo chmod 640 /etc/dhcp/ddns-keys/rndc.key
```

## AppArmor profiles update
In order to allow DCHPD and Bind services to read in write their configuration fields and logs, you should add some lines in the _local_ apparmod configuration

 - `/etc/apparmor.d/local/usr.sbin.dhcpd`
 ```
/var/log/dhcpd/** rw,
/var/log/dhcpd/ rw,
 ```
 - `/etc/apparmor.d/local/usr.sbin.named`
 ```
 /var/log/bind/** rw,
 /var/log/bind/ rw,
 ```

 !!! note "further details"
     See configurations files in `/etc/apparmo.d` for configuration details

## Logrotate configuration
You should add the lograte configuration for the log files from DHCPD and Bind service by adding the following files

- `/etc/logrotate.d/dhcpd`
```
/var/log/dhcpd/dhcpd.log {
  rotate 4
  daily
  create
  compress
  missingok
  notifempty
}
```
- `/etc/logrotate.d/named`
```
/var/log/bind/default.log
/var/log/bind/ddns.log
/var/log/bind/query.log
/var/log/bind/query-errors.log {
  rotate 4
  daily
  create
  compress
  missingok
  notifempty
},
```

## Set correct timezone
Change the timezone to Europe/Rome
```
ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
```

## NTP Server
Install the ntp package
```
sudo apt install ntp
```
add the following lines to the file /etc/ntp.conf
```
server 10.255.8.30
server 10.255.8.31
# the following lines make the server a master server
server          127.127.1.0 # local clock
fudge           127.127.1.0 stratum 10
broadcastdelay  0.008
```

## NFS Server
The laptop hosts two directories and export them using nfs. Both of the are mounted by the other machines on the network, by the PC104 and by the laptop itself :

- /exports/code - this contains the robot software sources such as YARP, iCub Software.
- /local/yarp - this contains the YARP configuration files, shared by all the machine in the network

For this to work you need:

Install the package nfs-kernel-server
```
sudo apt install nfs-kernel-server
```
Create the exports target paths and change ownership to _icub_ user
```
sudo mkdir -p /exports/code /exports/local_yarp
sudo chown icub:icub /exports/code
sudo chown icub:icub /exports/local_yarp
```
Edit the exports configuration file /etc/exports as follows
```
/exports/code           10.0.0.0/255.255.255.0(rw,sync,no_subtree_check)
/exports/local_yarp     10.0.0.0/255.255.255.0(rw,sync,no_subtree_check)
```

## Disable unattended-upgrades
In order to avoid automatic system updates you can edit the file `/etc/apt/apt.conf.d/20auto-upgrades by` changing the following lines
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "0";
```

_Alternatively_ you can uninstall the package `unattended-upgrades` as follows
```
sudo apt remove unattended-upgrades
```
## Customize the system

What now you need to do is to customize the installation with your hardware and enviroment
