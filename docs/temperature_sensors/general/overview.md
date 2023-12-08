## Motor temperature Sensors

The Motor Temperature Sensors are simple sensors made of a specific type of resistor (PT100 or PT1000) and of a small board defined as Temperature Detection Board (TDB), which has the goal of decoding the value read by the resistor giving out a raw output code, which can be then translated to Celsius Degree so that it can be easily understood by the end-user.
In a nutshell, most of the `ergoCub` motors are provided with an internal resistance temperature detector, which is then connected to a TDB board. This one is then linked to a `FOC` board, which elaborates that data coming from the `I2C` and send them via `CAN` to an `EMS` board. Finally, this one streams the raw temperature values via `ETH` to `embObjMotionControl` that updates and stores all of these data, ready to be requested by an user external module.


### How to update the configuration files

To correctly enable the use of the temperature sensors inside the configuration files ([templates](https://github.com/robotology/robots-configuration/tree/devel/iCubTemplates/iCubTemplateV6_0) are available), it is necessary to fill in the following fields:

- under `hardware/motorControl/body_part--ebX-jA_B-mc.xml` you need to add the two parameters `hardwareTemperatureLimits` and `warningTemperatureLimits` in the `LIMITS` group.
- under `hardware/mechanicals/body_part-ebX-jA_B-mec.xml` you need to add the parameter `TemperatureSensorType` in the `2FOC` group, and remove the soon deprecated `HasTempSensor` parameter in the same area.

That being done, it should be possible to use the features of the temperature sensors.

### How to read the motor temperature
The user needs to update the robot configuration files accordingly, as described in the [configuration section](#how-to-update-the-configuration-files), after ensuring that the sensor has been mounted on the desired motors.
The correct configuration ensures that the motor temperature is read and forwarded to yarprobotinterface, but currently this measure in not published on the yarp `stateExt` port. Therefore the user needs to develop a module application similar to [this one](https://github.com/MSECode/motionControlModule), in order to read the temperature.

In addition, the user module can retrieve the `warningTemperatureLimits` and check if the temperature exceeds that limit to put the motor in a safer state with lower current consumption.
Is it important to notice that the firmware puts the motor in fault when the temperature goes beyond the `hardwareTemperatureLimits`.
More details on the temperature flow are available in the section [data flow](../software/dataflow.md).
