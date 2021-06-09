# Introduction

This section describes how to properly connect (by the network poit of view) and startup all the machines in a iCub setup

# Network configuration and connections

## Network schema

![image.png](https://images.zenhubusercontent.com/5d7f8b9bedbc510001816991/23880cac-d650-45e0-9312-e02c5f43b3a8)

See [iCubOS Networking](./icubos/netwo.md) section for further details

## Network configuration

By the networking point of view, the iCub setup is based on the following components:

- `icub-server` : this machine acts as a _network gateway_ for the whole setup and implements several different network services such as DHCP, DNS, NTP and NFS
- `icub-switch` : this is the ethernet switch that connects all the setup components
- `icub-wifi` : this is the WiFi access point that creates the WiFi infrastructure that can be used (optionally) by the robot.
- `icub-head` : the PC inside the robot's head
- `other machines` : all  other PCs you can add to the setup, where you can run your software (in this case `icub-laptop` and `icub-cuda`)

See also https://icub-tech-iit.github.io/documentation/icub_operating_systems/icubos/networking/

## Network connections

Before turning on the iCub setup, you should setup network connections properly as follows:

1. if you want to provide _internet access_ to the setup, you have to connect a network cable to the Ethernet port marked as **EXT** (_external_) on the `icub-server`
2. connect the Ethernet port marked as **INT** (_internal_) on the `icub-server` to an Ethernet port on the `icub-switch` with an ethernet cable
3. connect an Ethernet port on the `icub-wifi` (**do not** use the port marked as `INTERNET`) to an Ethernet port on the `icub-switch` with an Ethernet cable
4. connect the Ethernet port on the back of the robot to an Ethernet port on the `icub-switch` with an Ethernet cable
5. connect Ethernet ports on the remaining PCs of the setup to Ethernet ports on the `icub-switch` with Ethernet cables

# iCub setup startup procedure

The iCub setup relies on several different network protocols and services, so **it's mandatory to startup the machines with the correct sequence** to allow all machines and services to operate correcly, _if you do not follow it you can face problems and unexpected behaviours_.

## Startup sequence

This is the correct startup procedure to follow every time you need to turn the whole system up:

1. Connect all the network cables as explained above (see **Network connections** above).
2. Connect the all the other needed power cables _except the one from the icub-switch_; _do not turn on any appliance yet_.
3. Connect the power cable of the `icub-switch` so it turns on, then wait for the POST procedure to complete; as the switch powers on, it begins the POST, a series of tests that runs automatically to ensure that the switch functions properly. LEDs can blink during the test. When the switch begins POST, the SYST, STAT, and SPEED LEDs turn green. The SYST LED blinks green, and the other LEDs remain solid green.When the switch completes POST successfully, the SYST LED remains green. The other LEDs turn off and then reflect the switch operating status. If a switch fails POST, the SYST LED turns amber. POST procedure lasts approximately between 3 and 5 minutes.
4. Turn the `icub-server` ON and wait at least 2 minutes while it completes the boot procedure.
5. (_optional_) Switch the `icub-wifi` ON and wait at for the POST procedure to complete, the POWER LED blinks while the POST procedure is on and turns solid white when it's over and the AP is ready. This step takes about 2 minutes to complete.
6. Turn the laptops on and login.
7. _Now you can power the robot CPU ON (the `icub-head` takes about one minute to boot up) and then start playing with your software, have fun!_
8.
