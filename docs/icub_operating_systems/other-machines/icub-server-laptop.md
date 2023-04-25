# The iCub Console Server

This page contains guidelines for the installation of the iCub Console Server, a laptop used both as console and as network server, so that it matches the requirements of the Linux on the icub-head.

## *Prerequisites* : basic system setup for an iCub machine

Please follow the instructions on page [Generic iCub machine installation instructions](generic-machine.md), in order to prepare a generic machine for the iCub network.

## Network configuration

!!! note
    _Of course, this suggested configuration is not mandatory, but this guide assumes that you are using it._

Usually, the laptop network connections are used as follows

- **Cabled connection (internal)** - Connection to the robot; this port is used to connect to the icub-head, both directly (a network cable connect the robot and the laptop) or through a switch
- **Wireless connection (external)** - Connection to the ouside world, to reach internet; this connection is used also by the robot as _Gateway_ (see "IP forwarding and NAT below)

The above network connection can be configured using the Network Manager GUI with the following parameters:

### Cabled (internal) Network parameters
- **IP Address** : 10.0.0.1
- **Netmash** : 255.255.255.0

### Wireless (external) Network parameters
This configuration depends on your network, but usually it uses **DHCP**

## Username and hostname

!!! note
    _Of course, this suggested configuration is not mandatory, but this guide assumes that you are using it._

**Username :** `icub`
**Hostname :** `icubsrv`

## The host file

Add following lines in the file `/etc/hosts`

```
10.0.0.2        icub-head icub-head.icub.local pc104 pc104.icub.local
```

## NFS Server

The laptop hosts two directories and export them using nfs. Both of them are mounted by the other machines on the network, by the icub-head and by the laptop itself :

-   `/exports/code` - this contains the robot software sources such as
    YARP, iCub Software.
-   `/local/yarp` - this contains the YARP configuration files, shared by all the machine in the network.

For this to work you need to:

-   install nfs server on the laptop:

```
sudo apt-get install nfs-kernel-server nfs-common portmap
```

-   create the directories that will be exported:

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

## Software repositories

Create a symbolic link to the code export path as follows (as root)

```
sudo ln -s /exports/code /usr/local/src/robot
```

You can then follow the [instructions to clone the robotology-superbuild](../../sw_installation/linux_from_sources_superbuild.md)
repository into `/exports/code` and build the ecosystem.

## YARP local path

Create a symbolic link to the local yarp export path as follows (as
root)

```
mkdir -p /home/icub/.local/share
ln -s /exports/local_yarp /home/icub/.local/share/yarp
```

## How to configure the `yarpserver` in the iCub setup

The iCub Console Server is generally the unit of the iCub setup devoted to hosting the `yarpserver`.
Therefore, on the iCub Console Server, one needs to properly set up the YARP namespace, to then launch
the server:

```
yarp namespace /icub
yarpserver
```

The namespace needs to be set up only once; the default namespace is `/root`, but `/icub` (or similar names)
tends to be a better choice as it enforces a policy for connecting to the robot network.

Analogously, on all the other machines connected to the iCub network running the YARP infrastructure,
one needs to do the following:

```
yarp namespace /icub
yarp detect --write
```

The commands above allow a machine to talk to the YARP server.

If `yarp detect` fails to detect the server, the following command should narrow down the search:

```
yarp conf ip socketport
```

where `ip` is the IP address of the iCub Console Server and `socketport` is the port retained by the YARP server (usually, `10000`).

To find out more on the YARP CLI, refer to the [YARP official documentation](http://yarp.it/latest/yarp.html).

## Install the ssh keys for password-less login on icub-head

1. Log in as icub and create an ssh key.
```
ssh-keygen -t rsa
```

2. Leave all choices to default just by pressing return button
3. Upload this key file to icub-head
```
ssh-copy-id -i /home/icub/.ssh/id_rsa.pub icub@icub-head
```

4.You have to create a ssh connection also between icubsrv and icubsrv itself in order to let yarp run as server automatically through yarpmanager:
```
ssh-copy-id -i /home/icub/.ssh/id_rsa.pub icub@icubsrv
```

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

1. Add the IPTABLES rules
```
sudo iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
sudo iptables --append FORWARD --in-interface eth0 -j ACCEPT
```

2. Make the above rules persistent
Installing the `iptables-persistent` package
```
sudo apt install iptables-persistent
```
Once you installed the package `iptables-persistent` it will asks you to save the current ipv4 and ipv6 iptables rules, answer yes to save it. Otherwise you can save it later witrh the command
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
 # the following lines make the server a master server
server          127.127.1.0 # local clock
 fudge           127.127.1.0 stratum 10
 broadcastdelay  0.008
```

In general it is a good idea if all the machines on the iCub network have synchronized clock via NTP

## Tweaks

### How to change the network card used to connect to the robot (aka INTERNAL network)
This section explains how to change the network card used to connect the laptop to the robot, eg. if you need to replace the internal one with an ETH2USB adapter.

!!! warning
    If you are replacing the network card with an ETH2USB adapter this procedure must be executed any time you use a new adapter, in other words if you replace the adapter with a different one, this procedure must be executed again.

1. Take note of the new network interface name
The first thing is to know which is the name that the system has assigned to the new interface.
Before adding the new interface, please issue this command:

`ip link`

This will return a line each ethernet connection available, eg:

```
 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
 3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq master main-bond state DOWN mode DORMANT group default qlen 1000
    link/ether 6a:7f:5b:a6:7e:5e brd ff:ff:ff:ff:ff:ff
```

2. Add the new ethernet card, issue the command `ip link` and check the differences, eg:
```
 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
 3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq master main-bond state DOWN mode DORMANT group default qlen 1000
    link/ether 6a:7f:5b:a6:7e:5e brd ff:ff:ff:ff:ff:ff
 4: enx3c8cf8fba684: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 3c:8c:f8:fb:a6:84 brd ff:ff:ff:ff:ff:ff
```

In the above example, the new ethernet card name is **enx3c8cf8fba684** and the one to replace is **eth0**

3. Update the IP Table rules
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
  -A POSTROUTING -o enx3c8cf8fba684 -j MASQUERADE
 COMMIT
 # Completed on Mon Nov 11 13:58:02 2019
```

4. Reboot the laptop

## How to change the network card used to connect to internet (aka EXTERNAL network)
This section explains how to change the network card used to connect the laptop to the external word (_internet_), usually a wifi, eg. if you need to replace the wifi with an ETH2USB adapter (cabled).

!!! warning
    If you are replacing the network connection with an ETH2USB adapter this procedure must be executed any time you use a new adapter, in other words if you replace the adapter with a different one, this procedure must be executed again.

1. Take note of the new network interface name
The first thing is to know which is the name that the system has assigne to the new interface.
Before adding the new interface, please issue this command:

`ip link`

This will return a line each ethernet connection available, eg:

```
 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
 3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq master main-bond state DOWN mode DORMANT group default qlen 1000
    link/ether 6a:7f:5b:a6:7e:5e brd ff:ff:ff:ff:ff:ff
```

2. Add the new ethernet card, issue the command `ip link` and check the differences, eg:
```
 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether d8:9e:f3:0d:3b:af brd ff:ff:ff:ff:ff:ff
 3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq master main-bond state DOWN mode DORMANT group default qlen 1000
    link/ether 6a:7f:5b:a6:7e:5e brd ff:ff:ff:ff:ff:ff
 4: enx3c8cf8fba684: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 3c:8c:f8:fb:a6:84 brd ff:ff:ff:ff:ff:ff
```

In the above example, the new ethernet card name is **enx3c8cf8fba684** and the one to replace is **wlan0**

3. Update the IP Table rules
Edit the file `/etc/iptables/rules.v4` by replacing the wifi network name (in this example `wlan0`) with the new one (in this example `enx3c8cf8fba684`). It can be a good idea to _comment the old lines and add new ones with updated parameters_, eg:
```
 # Generated by iptables-save v1.6.1 on Mon Nov 11 13:58:02 2019
 *filter
 :INPUT ACCEPT [48:2917]
 :FORWARD ACCEPT [8:455]
 #-A FORWARD -i wlan0 -o eth0 -j ACCEPT
 -A FORWARD -i enx3c8cf8fba684 -o eth0 -j ACCEPT
 # Completed on Mon Nov 11 13:58:02 2019
 # Generated by iptables-save v1.6.1 on Mon Nov 11 13:58:02 2019
 *nat
 :PREROUTING ACCEPT [4:540]
 :INPUT ACCEPT [3:449]
 :OUTPUT ACCEPT [0:0]
 :POSTROUTING ACCEPT [0:0]
 -A POSTROUTING -o eth0 -j MASQUERADE
 COMMIT
 # Completed on Mon Nov 11 13:58:02 2019
```

4. Reboot the laptop
