## Temperature Sensors

The Temperature Sensors are simple sensors made of a specific type of resistor (PT100 or PT1000) and of a small board defined as Temperature Detection Board (TDB), which has the goal of decoding the value read by the resistor giving out a raw output code, which can be then translated to Celsius Degree so that it can be easily understood by the end-user.

Regarding our hardware, these sensors are mounted on the `ergoCub` motors that are provided with a resistance thermometer (i.e. PT100 or PT1000).
Therefore, if one desires to read the temperature at the motor and print it to a yarp port, the following should be done.
First of all, the robot configuration files should be updated accordingly as described in the [configuration section](#how-to-update-the-configuration-files).
Finally, since the temperature values in Celsius degrees are not currently printed out on the yarp `stateExt` port, one should develop a module application similar to [this one](https://github.com/MSECode/motionControlModule), in order to output the temperature values for a specific robot body part on a defined yarp port.

In a nutshell, most of the `ergoCub` motors are provided with an internal resistance temperature detector, which is then connected to a TDB board. This one is then linked to a `FOC` board, which elaborates that data coming from the `I2C` and send them via `CAN` to an `EMS` board. Finally, this one streams the raw temperature values via `ETH` to `embObjMotionControl` that updates and stores all of these data, ready to be requested, through an external module, by the end-user, which has the job to output them to a specific yarp port.


### How to update the configuration files

Regarding the robot configuration files, whose templates can be seen at [this link](https://github.com/robotology/robots-configuration/tree/devel/iCubTemplates/iCubTemplateV6_0), in order to enable correctly the use of the temperature sensors it is necessary to fill the following fields:

- under `hardware/motorControl/body_part--ebX-jA_B-mc.xml` you need to add the two parameters `hardwareTemperatureLimits` and `warningTemperatureLimits` in the `LIMITS` group
- under `hardware/mechanicals/body_part-ebX-jA_B-mec.xml` you need to add the parameter `TemperatureSensorType` in the `2FOC` group, and remove the soon deprecated `HasTempSensor` parameter in the same area.

Thus, once that is done, and keeping in mind the points defined at the previous section, it should be possible to use correctly the feature of the temperature sensors.
