# iCub and Friends sensors interfaces

## YARP network wrapper servers convention

### Introduction

The iCub robot exposes its functionalities (sensors and actuators) via YARP devices called [YARP's Network Wrapper Servers (NWSs)](https://www.yarp.it/latest//group__nws__and__nwc__architecture.html) that publish information over YARP ports. For historical reasons, for each type of functionality such as "controlboards" (i.e measure of joint-related sensors and capability of setting setpoints of low-level control loops), inertial measurement units, force torque sensors, multiple devices are used, one for each iCub's "part".

The "parts" of iCub are:

- `head`
- `left_arm`
- `right_arm`
- `torso`
- `left_leg`
- `right_leg`

Not all iCubs have all their six parts. There are iCub variants that are composed only by the `head`, or iCub variants that are composed only by the legs. In some contexts, even a special part called `alljoints` is defined and used, to represent all the different parts of the robot combined.

To maintain generality, we will use the string `robotPortPrefix`, which can have different values, depending on the robot:

- `icub` for physical iCub robots
- `icubSim` for simulated iCub robots
- `ergoCub` for physical ergoCub robots
- `ergoCubSim` for simulated ergoCub robots

Next, we will list the convention used for each type of functionality. For each part, the `name` string is used. The YARP port will then be composed as: `/<robotPortPrefix>/<partName>/...`. For example, functionalities associated to the iCub head start as `/icub/head`.

### ControlBoards

The `ControlBoard` functionality is exposed via the [`controlBoard_nws_yarp`](https://www.yarp.it/latest/classControlBoard__nws__yarp.html) device. It can be used to get and set input-output quantities associated to the part's joints.

For each part, there will be a `controlBoard_nws_yarp` device that will open the following YARP ports:

- `/<robotPortPrefix>/<partName>/state:o` : Publishes encoders' information for the part

- `/<robotPortPrefix>/<partName>/stateExt:o` : Publishes extended joint-level sensors information for the part (e.g. joint encoders, motor encoders, pwm values), using the structure defined in [robotology/yarp@`master`/src/libYARP_dev/src/idl/stateExt.thrift](https://github.com/robotology/yarp/blob/master/src/libYARP_dev/src/idl/stateExt.thrift?rgh-link-date=2023-05-10T12%3A50%3A28Z)

- `/<robotPortPrefix>/<partName>/rpc:i` : Exposes several information related to the part via a YARP RPC port

- `/<robotPortPrefix>/<partName>/command:i` : Takes in input references for the low-level control loops

**Note: these YARP ports are not meant to be accessed directly, but should be accessed instead via the [`remote_controlboard`](https://www.yarp.it/latest//classRemoteControlBoard.html) device.**

### Inertial Measurements Units (IMUs)

Inertial Measurements Units functionalities are exposed via the [`multipleanalogsensorsserver`](https://www.yarp.it/latest//classMultipleAnalogSensorsServer.html) YARP device. The `inertials` string added to the YARP port name, to identify the functionality: `/<robotPortPrefix>/<partName>/inertials`.

For each part, there will be a `multipleanalogsensorsserver` device that will open the following YARP ports:

- `/<robotPortPrefix>/<partName>/inertials/measures:o` : Publishes sensors information for the part, using the structure defined in [robotology/yarp@`master`/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift?rgh-link-date=2023-05-10T12%3A50%3A28Z)

- `/<robotPortPrefix>/<partName>/inertials/rpc:o` : Exposes several information related to the part via a YARP RPC port

**Note: these YARP ports are not meant to be accessed directly, but should be accessed instead via the [`multipleanalogsensorsclient`](https://www.yarp.it/git-master/classMultipleAnalogSensorsClient.html) device.**

The client device will expose sensors related to the following [Multiple Analog Sensors Interfaces](https://www.yarp.it/latest/group__dev__iface__multiple__analog.html), so they can be easily queried:

- [`yarp::dev::IOrientationSensors`](https://www.yarp.it/latest/classyarp_1_1dev_1_1IOrientationSensors.html)

- [`yarp::dev::IThreeAxisGyroscopes`](https://www.yarp.it/git-master/classyarp_1_1dev_1_1IThreeAxisGyroscopes.html)

- [`yarp::dev::IThreeAxisLinearAccelerometers`](https://www.yarp.it/git-master/classyarp_1_1dev_1_1IThreeAxisLinearAccelerometers.html)

- [`yarp::dev::IThreeAxisMagnetometers`](https://www.yarp.it/git-master/classyarp_1_1dev_1_1IThreeAxisMagnetometers.html)

### Force-Torque Sensors

Force-Torque Sensors functionalities are exposed via the [`multipleanalogsensorsserver`](https://www.yarp.it/latest//classMultipleAnalogSensorsServer.html) YARP device. The `name` parameter passed to this device is: `/<robotPortPrefix>/<partName>/FT`.

This means that for each part there will be a `multipleanalogsensorsserver` device that will open the following YARP ports:

- `/<robotPortPrefix>/<partName>/FT/measures:o` : that publishes sensors information for the part, using the structure defined in [robotology/yarp@`master`/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift](https://github.com/robotology/yarp/blob/master/src/devices/multipleAnalogSensorsMsgs/multipleAnalogSensorsSerializations.thrift?rgh-link-date=2023-05-10T12%3A50%3A28Z)

- `/<robotPortPrefix>/<partName>/FT/rpc:o` : that expose several information related to the part via a YARP RPC port

**Note: these YARP ports are not meant to be accessed directly, but should be accessed instead via the [`multipleanalogsensorsclient`](https://www.yarp.it/git-master/classMultipleAnalogSensorsClient.html) device.**

This device will expose sensors related to the following [Multiple Analog Sensors Interfaces](https://www.yarp.it/latest/group__dev__iface__multiple__analog.html):

- [`yarp::dev::ISixAxisForceTorqueSensors`](https://www.yarp.it/git-master/classyarp_1_1dev_1_1ISixAxisForceTorqueSensors.html)

- [`yarp::dev::ITemperatureSensors`](https://www.yarp.it/git-master/classyarp_1_1dev_1_1ITemperatureSensors.html)

### Cameras
