In order to use icub robot in gazebo simulation environment one needs to have the repository [icub-gazebo](https://github.com/robotology/icub-gazebo) and have to set GAZEBO_MODEL_PATH to this repository as indicated in the [readme](https://github.com/robotology/icub-gazebo) file. Furthermore, [icub-gazebo-wholebody](https://github.com/robotology/icub-gazebo-wholebody) repository contains complex `gazebo models` and `gazebo worlds`, for example [icub-standup-world](https://github.com/robotology/icub-gazebo-wholebody/blob/master/worlds/icub_standup_world/icub_standup_world). In general, these two repositories can be used as standalone or they can be used as a part of [robotology-superbuild](https://github.com/robotology/robotology-superbuild).

When an iCub model is spawned in gazebo, all the ports that are opened take the name placed in the [gazebo_icub_robotname.ini](https://github.com/robotology/icub-gazebo/blob/master/icub/conf/gazebo_icub_robotname.ini) configuration file as a port prefix. The default name used is `icubSim`:

`gazeboYarpPluginsRobotName icubSim`

The **model name** displayed in gazebo is taken `iCub` from the [icub.sdf](https://github.com/robotology/icub-gazebo/blob/ab22fdc34c0a9faa6f72428c2abdb6afc3145872/icub/icub.sdf#L3) file and the gazebo-yarp-plugin motor control board ports and ports of the other gazebo-yarp-plugins you placed in your iCub model are opened with the portprefix `/icubSim`.

![single icub gazebo](../img/single_icub_gazebo.png)

If you are trying to put another iCub model in the simulation, it will fail due to the port conflict as it will try to open another set of robot ports with the same port prefix as `/icubSim`. So, in order to get around this problem, you have to **comment out** the line `gazeboYarpPluginsRobotName icubSim` of [gazebo_icub_robotname.ini](https://github.com/robotology/icub-gazebo/blob/master/icub/conf/gazebo_icub_robotname.ini) configuration file.



If you are using the two repositories [icub-gazebo](https://github.com/robotology/icub-gazebo) and [icub-gazebo-wholebody](https://github.com/robotology/icub-gazebo-wholebody) as a part of [robotology-superbuild](https://github.com/robotology/robotology-superbuild) you need to build the superbuild and make sure the changes made to [gazebo_icub_robotname.ini](https://github.com/robotology/icub-gazebo/blob/master/icub/conf/gazebo_icub_robotname.ini) configuration file are correctly reflected in the `install` directory.

Now, when a first iCub model is spawned in gazebo it takes the default name of `iCub` and all the ports related to it are prefixed with `/iCub`. Similarly, an additional iCub model spawned next to it will have the default name `iCub_0` and all the ports related to this new model are prefixed with `/iCub_0`. In this way multiple robots can be spawned in gazebo simulation environment without any port conflicts.

![two icubs gazebo](../img/two_icubs_gazebo.png)

Another important detail concerns the use of `wholeBodyDynamics`. In general, `wholeBodyDynamics` is launched with `yarprobotinterface` with a configuration file like launch-wholebodydynamics.xml that uses `/icubSim` port prefix as shown below:

![wholebodydynamics example](../img/wholebodynamics_example.png)

So, in order to use multiple icub robots in gazebo you need to have multiple `wholebodydynamics.xml` configuration files with port prefixes corresponding to the robots spawned in gazebo.
