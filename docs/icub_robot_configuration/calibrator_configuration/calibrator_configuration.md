# Configuration of calibrator module
The calibrator module for Ethernet robots is `parametricCalibratorEth`; it uses the parameters written in `body_part-calib.xml` file. Please follow the link to get the meaning of each parameter.

Here is reported a brief description of calibrator module and the role of some parameters are involved in calibration and parking procedures.

The calibrator in the startup phase launches the calibration procedure: after a motor control devices has been configured, it tries to calibrate its joints. The calibration procedure is composed by three steps:

 1. Sets a safe pwm limit: uses value of parameter `startupMaxPwm`, like the maximum pwm applicable to the motor;
 2. If the parameter `skipCalibration` in `general.xml` is false, it sends the calibrate command to each joint with the parameters written in the calibration file, else skips following steps leaving joints in not configured state and exits. If you are interested in details information about calibration and its parameter see here. (The link will be available asap, sorry for the incovenience).
 3. If the joint completes the calibration sucessfully, then it tries to move it to the `startupPosition` using `startupVelocity` specified in calibration file. If an error occurred in calibration phase, the joint is in fault error.
 4. If the `startupPosition` is reached, then the joint is ready, else is in fault error.

When the user shuts down Yarprobotinterface, the calibrator moves all joints to the park position, that is the position specified in `positionHome` parameter using `velocityHome`.

## Maintenance features

Relatively to the calibration procedure, users might configure an optional group in the `general.xml` file. Specifically, the group is termed `MAINTENANCE` and contains at the moment just the `skipRecalibration` parameter.
To enable it, add the following within `general.xml`:

```xml
<group name="MAINTENANCE">
    <param extern-name="skipRecalibration" name="skipRecalibration"> false </param>
</group>
```

Notice how the parameter can be defined with the property `extern-name`, meaning that you can overwrite its value when running the `yarprobotinterface` command:

```sh
  yarprobotinterface --skipRecalibration true
```

Regarding the specifics of this parameter it can be described as follows:

- `skipRecalibration`, it can be set to `true` or `false` (default value). If set to `true` the robot will **skip** the calibration procedure when the `yarprobotinterface` is restarted while the boards are not switched off. Regarding this feature it is necessary to add some notes:
    1. The first time that the control board devices are started through the `yarprobotinterface` the calibration procedure runs normally, independently of having set the parameter to `true` or `false`
    2. For all of the subsequent times if the `yarprobotinterface` gets restarted keeping the boards powered on the whole robot will skip the calibration procedure on all joints and they will be set to `IDLE`.
    3. Since the group and the parameter are not mandatory for running the robot one can omit it from the `general.xml` file and the software will set it to `false` by default, therefore the robot subparts will calibrate each time the devices are restarted as it normally happens.
    4. If some joints won't calibrate at the first start of the robot they won't skip the calibration procedure on the following runs for just those joints. Thus they will normally calibrate while all the others will be set to `IDLE`
    5. If the parameter is set to `true` but the boards are restarted, the first time the robot devices are run the calibration procedure will execute normally.
    6. As defined above, since the parameter is configured using an `extern-name`, its value can be overwritten when running the `yarprobotinterface` without modifying the configuration files.

!!! warning
    `skipRecalibration` is a feature thought to be used by expert users and it should be used with caution. Specifically, as detailed at `point d`, in the unlikely case that a joint won't calibrate during the first `yarprobotinterface` run, if this feature is enabled, it will calibrate during the subsequent run. Thus, since all the other joints will be set to `IDLE`, it might happen that the calibrating joint will collide with the others.
    Therefore, when this feature is enabled, it is assumed that one is fully aware of how the joints move during the calibration, the calibration order of the subparts and which might be possible collisions if the case described at `point d` takes place.
    Moreover, since at the restart all joints are set to `IDLE`, one should keep this in mind if the robot is started with a certain configuration that necessitate to have the joints controlled. 
    Then, after the robot starts in `IDLE`, one can move all the joint in `POSITION` or other control mode and use it normally.
