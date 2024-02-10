## Motor temperature Sensors

The Motor Temperature Sensors are simple sensors made of a specific type of resistor (PT100 or PT1000) and of a small board defined as the **Temperature Detection Board (TDB)**, which has the goal of decoding the value read by the resistor giving out a raw output code, which can be then translated to Celsius Degree so that it can be easily understood by the end-user.
In a nutshell, most of the `ergoCub` motors are provided with an internal resistance temperature detector, which is then connected to a TDB board. The TDB board is then linked to a `2FOC` board, which elaborates the data acquired via `I2C` bus and sends it via the `CAN` bus to an `EMS` board. Finally, the EMS board streams the raw temperature values via the `ETH` bus to `embObjMotionControl`, which in turn updates and stores these acquisitions that the user can readily request from an external module.


### How to update the configuration files

To correctly enable the use of the temperature sensors inside the configuration files ([templates](https://github.com/robotology/robots-configuration/tree/devel/iCubTemplates/iCubTemplateV6_0) are available), it is necessary to fill in the following fields:

- under `hardware/motorControl/body_part--ebX-jA_B-mc.xml` you need to add the two parameters `hardwareTemperatureLimits` and `warningTemperatureLimits` in the `LIMITS` group.
- under `hardware/mechanicals/body_part-ebX-jA_B-mec.xml` you need to add the parameter `TemperatureSensorType` in the `2FOC` group, and remove the soon deprecated `HasTempSensor` parameter in the same area.

That being done, it should be possible to use the features of the temperature sensors.

### How to read the motor temperature
First off, the user ought to make sure that the sensor is mounted on the desired motors, and then needs to update the robot configuration files accordingly, as described in the [configuration section](#how-to-update-the-configuration-files). 
The correct configuration allows reading and sending the motor temperature values to the `yarprobotinterface`. However, these measurements are not currently published on the YARP `stateExt` port. Therefore, the user needs to devise a module application, similar to [this one](https://github.com/MSECode/motionControlModule), to read the temperature.

In addition, the user module can retrieve the `warningTemperatureLimits` and check if the temperature exceeds that limit to put the motor in a safer state with lower current consumption.
!!! warning "HW Fault due to overheating"

    Is it important to notice that the firmware puts the motor in HW Fault when the temperature 
    goes beyond the `hardwareTemperatureLimits` for longer than 10 seconds.

More details on the temperature flow and **error managmanagement** are available in the section [data flow](../software/dataflow.md).

