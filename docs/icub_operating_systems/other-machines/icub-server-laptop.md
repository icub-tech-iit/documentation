# The iCub Console Server

This page contains guidelines for installation of the iCub Console Server, a laptop used both as console and as network server, so that it matches the requirements of the Linux on the icub-head.

# *Prerequisite* : basic system setup for a iCub machine

Please follow the instructions on page [Generic iCub machine installation instructions](generic-machine.md), in order to prepare a generic machine for the iCub network.

## NOTE 1 - about Network configuration
Usually, the laptop network conection are used as follows

- **Cabled connection (internal)** - Connection to the robot; this port is used to connect to the icub-head, both directly (a network cable connect the robot and the laptop) or through a switch
- **Wireless connection (external)** - Connection to the ouside world, to reach internet; this connection is used also by the robot as _Gateway_ (see "IP forwarding and NAT below)

The above network connection can be configured using the Network Manager GUI with the following parameters:

### Cabled (internal) Network parameters
- **IP Address** : 10.0.0.1
- **Netmash** : 255.255.255.0

### Wireles (external) Network parameters
This configuration depends on your network, but usually it uses **DHCP**

_Of course, this configuration is not mandatory, but this guide assumes that you are usign it._

## NOTE 2 - about username and hostname
Set user as "*icub*" and hostname as "*icubsrv*" (not mandatory, but suggested)


# Customization

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
/exports/code 10.0.0.0/255.255.255.0(rw,sync,no_subtree_check)
/exports/local_yarp 10.0.0.0/255.255.255.0(rw,sync,no_subtree_check)
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

You can then follow the [instructions to clone the robotology-superbuild](../../sw_installation/linux_from_sources_superbuild.md)
repository into `/exports/code` and build the ecosystem.

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

### Enable IP forwarding
Edit the file `/etc/sysctl.conf` by modifying the below line as follows

```
net.ipv4.ip_forward = 1
```

### Setup Network Address Translation
First take note of the names of you network connections by checking the output f the following command:

```
ip addr
```

Let's now assume that
- the cabled (internal) network connection is `eth0`
- the cabled (internal) network connection is `wlan0`

#### 1. Add the IPTABLES rules
```
sudo iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
sudo iptables --append FORWARD --in-interface eth0 -j ACCEPT
```

####  2. Make the above rules persistent
Installing the `iptables-persistent` package
```
sudo apt install iptables-persistent
```
Oce you installed the package `iptables-persistent` it will asks you to save the current ipv4 and ipv6 iptables rules, answer yes to save it. Otherwise you can save it later witrh the command
```
sudo iptables-save > /etc/iptables/rules.v4
```

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
This section explains how to change the network card used to connect the laptop to the robot, eg. if you need to replace the internal one with an ETH2USB adapter.

The instruction below can be easily adapted if you need to change the External (Wireless) network connection.

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
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
```

then add the new ethernet card, issue the command `ip link` and check the differences, eg:

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
3: enx3c8cf8fba684: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 3c:8c:f8:fb:a6:84 brd ff:ff:ff:ff:ff:ff
```

In the above example, the new ethernet card name is **enx3c8cf8fba684**

### 2. Update the IP Table rules
Edit the file `/etc/iptables/rules.v4` by replacing the old internal network name (in this example `eth0`) with the new one (in this example `enx3c8cf8fba684`). It can be a good idea to _comment the old lines and add new ones with updated parameters_, eg:
```
# Generated by iptables-save v1.6.1 on Mon Nov 11 13:58:02 2019
*filter
:INPUT ACCEPT [48:2917]
:FORWARD ACCEPT [8:455]
:OUTPUT ACCEPT [45:6652]
#-A FORWARD -i wlan0 -o eth0 -j ACCEPT
-A FORWARD -i wlan0 -o enx3c8cf8fba684 -j ACCEPT
COMMIT
# Completed on Mon Nov 11 13:58:02 2019
# Generated by iptables-save v1.6.1 on Mon Nov 11 13:58:02 2019
*nat
:PREROUTING ACCEPT [4:540]
:INPUT ACCEPT [3:449]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
#-A POSTROUTING -o eth0 -j MASQUERADE
-A POSTROUTING -o enx3c8cf8fba684 -j MASQUERADE
COMMIT
# Completed on Mon Nov 11 13:58:02 2019
```

### 3. Reboot the laptop
