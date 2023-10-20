## How to use two real iCub robots on the same network

This page is intended to be used as a practical guide for setting up two real iCub robots together on the same network to run controllers designed for two of them. Ideally, the steps can be extended to multiple robots without any more changes.

The following steps are done using `iCubGenova02` (aka Purple) and `iCubGenova04` (aka Green). The two major modifications are on the **Network** side and **Configuration** side.

---

## Network Side
The first conflict is that both the robots can be accessed by logging into the head using `ssh icub-head` with the same ip (`10.0.0.2`). So, while two robot have to be on the same network this has to be changed.

The robots network configuration is set using [netplan](https://netplan.io/examples). Do `ssh icub-head` and go to `/etc/netplan` directory. The configuration files for netplan are yaml based. The configuration file loaded by default is `50-icub.yaml` and its contents are:

<img src ="../img/icub_head_netplan_interfaces_file.png" width=400>

Now, change the ip address `10.0.0.2` to some other ip address such as `10.0.0.200`. Once the ip address is change do `sudo netplan apply` to load the new network configuration file. At this point you will not be able access icub-head any longer and you need to to `ssh 10.0.0.200` to reach the head of the robot.

!!! note

    Ensure to switch the ip address back to the original default ip value of `10.0.0.2` and do `sudo netplan apply` once the experiments with the robot are finished.

## Robot configurations side
To launch an icub robot multiple [configuration files](https://github.com/robotology/robots-configuration) are launched through `yarprobotinterface`. In general, these files are robot specific (Eg. [iCubGenova02](https://github.com/robotology/robots-configuration/tree/master/iCubGenova02)) and contains parameters tuned for
that particular robot. But the port names used in all these configuration files are usually the same. So, while trying to launch multiple robots on the same network, port address conflict happens. This issue can be solved by using different port prefix names in the configuration files, e.g. changing from `icub` to more robot specific like `icub02` for `iCubGenova02` and `icub04` for `iCubGenova04`. An example can be found in [ami-iit/robots-configuration/icub02-prefix](https://github.com/ami-iit/robots-configuration/tree/icub02-prefix) were the `iCubGenova02` configuration files have been updated in order to run `icub_wbd.xml` application with all the port prefixes changed to `icub02`.

In particular, the following files have to be changed:

- Update robot `yarprobotinterface` port prefix.
- Update interfaces wrapper port prefix.
- Add port prefix to Whole-Body-Dynamics by adding the following line:
  ```xml
  <param name="portPrefix">/<robot-prefix>/wholebodydynamics</param>
  ```
  and adding the prefix to **external wrench port names**, e.g.:
  ```xml
  <param name="/<robot-prefix>/wholeBodyDynamics/left_leg/cartesianEndEffectorWrench:o">(l_foot,l_sole,root_link)</param>
  ```
- Update cartesian controllers port prefix.

As a simple test, you can launch `yarpmotorgui --robot <robot-prefix>` to try to control the robot, and check all the opened ports with `yarp name list`.
