# Introduction

This page contains guidelines for installation of the iCub server laptop so that it matches the requirements of the Linux on the pc104 (open call configuration).
We assume you have installed a working Debian or Ubuntu on the laptop.
You can freely decide to install 32 bit or 64 bit, the code compiles on both architectures. Be aware that if you plan to share the repository with other machines, all machines need to have the same architecture (32 versus 64 bits, same versions of the libraries). A possibility would be to share the same code directory and different builds.

# *Prerequisite* : basic system setup for a iCub machine

Please follow the instructions on page [Generic iCub machine installation instructions](generic-machine.md), in order to prepare a generic machine for the iCub network.

**NOTE** : set user as "*icub*" and hostname as "*icubsrv*" (not mandatory, but suggested)

Then follow the below steps to customize it as the iCub Laptop

# The host file

Add following lines in the file `/etc/hosts`

```
10.0.0.2        icub-head icub-head.icub.local pc104 pc104.icub.local
```

# NFS Server

The laptop hosts two directories and export them using nfs. Both of the are mounted by the other machines on the network, by the PC104 and by the laptop iteself :

-   `/exports/code` - this contains the robot software sources such as
    YARP, iCub Software.
-   `/local/yarp` - this contains the YARP configuration files, shared by all the machine in the network.

For this to work you need:

-   install nfs server on the laptop:

```
sudo apt-get install nfs-kernel-server nfs-common portmap
```

-   creates the directories that will be exported:

```
sudo mkdir -p /exports/code
sudo mkdir -p /exports/local_yarp
```

Set appropriate permissions to the icub user:

```
sudo chown icub:icub -R /exports/code
sudo chown icub:icub -R /exports/local_yarp
```

-   Now configure the nfs-kernel-server:

Add these lines to /etc/exports:

```
/exports/code 10.0.0.0/255.255.255.0(rw,sync,no_root_squash,no_subtree_check)
/exports/local_yarp 10.0.0.0/255.255.255.0(rw,sync,no_root_squash,no_subtree_check)
```

You might need to restart the nfs server.

```
sudo /etc/init.d/nfs-kernel-server restart
```

Or just reboot the machine.

# Software repositories

Create a symbolic link to the code export path as follows (as root)

```
sudo ln -s /exports/code /usr/local/src/robot
```

Then clone the icub software repositories into `/exports/code`, as follows

```
cd /exports/code
git clone https://github.com/robotology/yarp.git
git clone https://github.com/robotology/icub-main.git
git clone https://github.com/robotology/icub-firmware-shared
git clone https://github.com/robotology/icub-firmware
git clone https://github.com/robotology/icub-firmware-build
```

# YARP local path

Create a symbolic link to the local yarp export path as follows (as
root)

```
mkdir -p /home/icub/.local/share
ln -s /exports/local_yarp /home/icub/.local/share/yarp
```

# Install the ssh keys for password-less login on PC104

Log in as icub and create an ssh key.

```
ssh-keygen -t rsa
```

Leave all choises to default just by pressing return button\
Upload this key file to pc104

```
ssh-copy-id -i /home/icub/.ssh/id_rsa.pub icub@pc104
```

## Other configurations

## IP forwarding and NAT

Enable NAT and port forwarding so that the pc104 (and other machines on the network) have internet access (using wlan0 as external network
interface)

- Enable IP forwarding : edit the file `/etc/sysctl.conf` by modifying the below line as follows

```
net.ipv4.ip_forward = 1
```

- Setup Network Address Translation : add the following file `/etc/network/if-up.d/natting` as follows

```
#!/bin/sh -e
iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
iptables --append FORWARD --in-interface eth0 -j ACCEPT
```

### Note about natting

Please check that:

1.  The name of your network interfaces are correct (in the above script
    *wlan0* is the EXTERNAL interface - connecting to the external
    world - and *eth0* is the INTERNAL interfaceg - connection to the
    PC104)
2.  The above script must be executable, otherwise you can made it
    executuable by
```
chmod a+x /etc/network/if-up.d/natting
```

### Netplan and ifup scripts

The netplan (installed starting from Ubuntu 18.04) is not compatible with IF-UP scripts (see this (link)[https://askubuntu.com/questions/1117960/how-to-use-netplan-to-do-the-same-as-was-being-done-using-iptables] ), so a workaroun  is to use networkd-dispatcher. This (FAQ)[https://netplan.io/faq#use-pre-up-post-up-etc-hook-scripts] gives an example on how to do it: using networkd-dispatcher to run existing ifup hooks via a script installed in /etc/networkd-dispatcher/routable.d/50-ifup-hooks

```
#!/bin/sh

for d in up post-up; do
    hookdir=/etc/network/if-${d}.d
    [ -e $hookdir ] && /bin/run-parts $hookdir
done
exit 0
```

## Fix IP and DNS

Use the following configuration for the network

```
# The primary network interface
 auto eth0
 allow-hotplug eth0
 iface eth0 inet static
  address 10.0.0.1
  netmask 255.255.255.0
  network 10.0.0.0
  broadcast 10.0.0.255
  dns-search icub.local
```

## Clock synchronization

Download the ntp package
```
sudo apt-get install ntp
```

Your Laptop has to be the clock of the connection with the pc104 in case of no internet access so replace those lines from the file /etc/ntp.conf
```
server 0.ubuntu.pool.ntp.org
server 1.ubuntu.pool.ntp.org
server 2.ubuntu.pool.ntp.org
server 3.ubuntu.pool.ntp.org
```

or comment them by adding a # in front each lines and add those lines instead

```
# the folllowing lines make the server a master server
server          127.127.1.0 # local clock
fudge           127.127.1.0 stratum 10
broadcastdelay  0.008
```

The internal clock of the pc104 resets every time the pc104 is restarted. It is important you configure your local network so that the pc104 has the correct time. In general it is a good idea if all the machines on the iCub network have synchronized clock via NTP
