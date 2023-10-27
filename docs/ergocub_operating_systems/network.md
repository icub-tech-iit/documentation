# ergoCub network

The network on ergocub can be divided in two parts:

- **internal network (10.0.1.0/24)**: it connects `ergocub-torso` to all the motor controller boards on the robot, it is a segregated network (there is no connection from the nodes on its subnet and the ouside world) and it is used to send motor commands from ergocub-torso to motor control boards;
- **extenal network (10.0.2.0/24)**: it is managed by the ergocub-server and it connects all the ergoCub machines together, handling the internet connection too. This connection can be _wired_ or _wireless_;
- **backup network (10.0.0.0/24)**: this is a backup/troubleshoot network for connecting directly to the robot in case of not reaching the external network.


## ergoCub network interfaces

- `ergocub-torso`

    On ergocub-torso, one of the two ethernet interfaces is connected to the internal network. The other one, instead, is directly connected to ergocub-head via backup network.

- `ergocub-head`

    On ergocub-head, the ethernet interfaces are bridged together on the backup network.

Both head and torso are connected to the external network via WiFi.

## IP addresses and other network configurations

Below you can find the default network parameters of the ergoCub networks.

### Internal network configurations

This configuration depends deeply on the motor control board firmware and thus it can't be changed.

- **IP address** : 10.0.1.104 - _STATIC_
- **Netmask** : 255.255.255.0

since this is a segregated network, there is no default gateway.

### External network configurations

Usually, it is a static configuration, but it works also in DHCP mode. This configuration _can be changed_ but it is not recommended.

For `ergocub-torso`:

- **WiFi IP address** : 10.0.2.2
- **Netmask** : 255.255.255.0
- **Default Gateway** : 10.0.2.1
- **DNS server** : 10.0.2.1

For `ergocub-head`:

- **WiFi IP address** : 10.0.2.3
- **Netmask** : 255.255.255.0
- **Default Gateway** : 10.0.2.1
- **DNS server** : 10.0.2.1

### Backup network configurations

For `ergocub-torso`:

- **IP address** : 10.0.0.2
- **Netmask** : 255.255.255.0

For `ergocub-head`:

- **IP address** : 10.0.0.3
- **Netmask** : 255.255.255.0

