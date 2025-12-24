# Tactile Data Flow

## Main Flow of Information
This picture below depicts the flow of the tactile data, starting from the [physical sensors](../hardware/physical_sensors.md) and moving up to the user applications and the GUIs.

<p align="center">
    <img  src="../img/skin-yarp-network.png" width="700">
</p>

The tactile sensor data are sent on YARP ports with names `/icub/skin/part_name` ("data ports" in the figure).

There is also one "rpc port" for each skin "data port", which is used to send a reset command to the skin microcontrollers. The skin data port can then be read either directly, or through the [**`IAnalogSensor`**](https://yarp.it/latest/classyarp_1_1dev_1_1IAnalogSensor.html) YARP interface.

The [**`skinManager`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__skinManager.html) reads the raw tactile data and creates another set of YARP ports with names `/icub/skin/part_name_comp`, which stream the filtered data (after thermal drift compensation and high frequency noise filtering).

Moreover, the `skinManager` also creates one "event port" that outputs a [**`skinContactList`**](https://robotology.github.io/robotology-documentation/doc/html/classiCub_1_1skinDynLib_1_1skinContactList.html), that is a high-level representation of the contacts detected by the skin (i.e., it abstracts from the specific sensor configuration and it provides information such as contact center of pressure, contact force, contact link).

The [**`iCubSkinGui`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__iCubSkinGui.html) is typically connected to the ports outputting the filtered tactile data.

Also, the `skinManager` has its own GUI, which allows the user to adjust the filtering parameters, to switch the visualization from continuous to binary (i.e., contact/noncontact), and to monitor the sensor state.

## Applications
The picture below illustrates a scheme of a possible application that uses the tactile data.

<p align="center">
    <img  src="../img/skin-dataflow.png" width="700">
</p>

In particular, the depicted application is the autonomous skin calibration, which is composed of two main modules:

- **Parallel Control**: module controlling the robot to let it interact with the environment.
- **Skin Calibrator**: module estimating online the 3D positions of the tactile sensors.

Note how the tactile data are displayed by both the [**`iCubSkinGui`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__iCubSkinGui.html) and the [**`iCubGui`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__gui.html).
