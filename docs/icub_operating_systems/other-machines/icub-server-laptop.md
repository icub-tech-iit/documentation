# Introduction

This page contains guidelines for installation of the iCub server laptop so that it matches the requirements of the Linux on the icub-head.
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

The laptop hosts two directories and export them using nfs. Both of the are mounted by the other machines on the network, by the icub-head and by the laptop iteself :

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

# Install the ssh keys for password-less login on icub-head

Log in as icub and create an ssh key.

```
ssh-keygen -t rsa
```

Leave all choises to default just by pressing return button\
Upload this key file to icub-head

```
ssh-copy-id -i /home/icub/.ssh/id_rsa.pub icub@icub-head
```

## Other configurations

## IP forwarding and NAT

Enable NAT and port forwarding so that the icub-head (and other machines on the network) have internet access (using wlan0 as external network
interface)

- Enable IP forwarding : edit the file `/etc/sysctl.conf` by modifying the below line as follows

```
net.ipv4.ip_forward = 1
```

- Setup Network Address Translation :

  1. add the IPTABLES rules
  ```
  sudo iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
  sudo iptables --append FORWARD --in-interface eth0 -j ACCEPT
  ```
  2. make the above rules persistent, by installing the `iptables-persistent` package
  ```
  sudo apt install iptables-persistent
  ```
  Oce you installed the package `iptables-persistent` it will asks you to save the current ipv4 and ipv6 iptables rules, answer yes to save it. Otherwise you can save it later witrh the command
  ```
  sudo iptables-save > /etc/iptables/rules.v4
  ```

### Note about natting

Please check that:

1.  The name of your network interfaces are correct (in the above commands
    *wlan0* is the EXTERNAL interface - connecting to the external
    world - and *eth0* is the INTERNAL interface - connection to the
    icub-head)
2.  The above script must be executable, otherwise you can made it
    executuable by
```
chmod a+x /etc/network/if-up.d/natting
```

## Fix IP and DNS

Use the following configuration for the _internal (cabled)_ network in netplan (usually the file `/etc/netplanmn/01-network-manager-all.yaml` )

```
    eth0:
      dhcp4: no
      dhcp6: no
      addresses: [10.0.0.1/24]
      optional: true
```

*NOTES*:
  1. The configuration above assumes that the name of you internal interface is `eth0`, please check the actual name and change the above accordingly
  2. When you setup netplan to manage a network interface, this will prevent the default Network configuration GUI (NetworkManager) to change it. This is an expected behavior and it is correct.

## Clock synchronization

Download the ntp package
```
sudo apt-get install ntp
```

Your Laptop has to be the master server for the icub-head so add those lines at the end of file `/etc/ntp.conf`

```
# the folllowing lines make the server a master server
server          127.127.1.0 # local clock
fudge           127.127.1.0 stratum 10
broadcastdelay  0.008
```

In general it is a good idea if all the machines on the iCub network have synchronized clock via NTP

# Tweaks

## How to change the network card used to connect to the robot
This section explains how to change the network card used to connect the laptop to the robot, eg. if you need to replace the internal one with an ETH2USB adapter

### Note
If you are replacing the network card with an ETH2USB adapter this procedure must be executed any time you use a new adapter, in other words if you replace the adapter with a different one, this procedure must be executed again.

### 1. Take note of the new network interface name
The first thing is to know which is the name that the system has assigne to the new interface.
Before adding the new interface, please issue this command:

`ip link`

This will return a line each ethernet connection available, eg:

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
```

then add the new ethernet card, issue the command `ip link` and check the differences, eg:

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
3: **enx3c8cf8fba684**: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 3c:8c:f8:fb:a6:84 brd ff:ff:ff:ff:ff:ff
```
