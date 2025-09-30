## Motor temperature Data Flow

Generally, the data flow related to the whole pipeline of the sensing of the motor temperature is quite simple and a brief summary is proposed here below, whose main purpose is to make the reader aware of how the temperature data is retrieved from the motor resistance thermometer and printed out to a YARP port. 

In brief, as reported in the [introductory section](../general/overview.md#motor-temperature-sensors), most of the `ergoCub` motors are currently provided with a `PT100`, which is a particular resistor able to correlate a value of temperature to a value of resistance in `Ohm`. The resistor is connected to a board called **Temperature Detection Board (TDB)**.
The TBD reads the `Ohm` value from the `PT100` (or `PT1000` for different types of motors) and streams out the raw data using the `I2C` protocol. This raw data is then received by the `2FOC` board at a frequency of `10 Hz` and, immediately after, handed over to the `EMS` board via the `CAN` bus. The `EMS` stores the temperature values in memory and sends them to `embObjMotionControl` together with all the other motor information.
Upon reception of the motor temperature, `embObjMotionControl` converts the values from raw to Celsius and checks if the `warningTemperatureLimit` is overcome. In that case, it prints out a warning on the yarprobotinterface log. No other actions are taken.


### Main Flow of Information

Here's a small yet exhaustive sequence diagram showing the whole dataflow as summarized above. It is possible to observe how the different actors that take part in the pipeline interact with each other, starting from the lower level up to the higher level.

<p align="center">
    <img  src="../img/MotorTemperature-Feature.png" width="700">
</p>


### Error handling
The error management is mainly performed by the `2FOC`.

The `2FOC` performs some checks while reading the temperature from the `I2C` and makes use of specific negative values (defined in the code) to notify the user of certain events.

The TDB board sends 3 bytes on the `I2C` bus: the temperature value (2 bytes) and its configuration (1 byte). The `2FOC` verifies mainly the configuration byte.


The **possible errors** currently managed are the following:

- `-90` : the `2FOC` cannot read from the `I2C`, meaning that the `ACK` is not received from the `TDB`.
- `-70` : the reading cannot be done for 10 consecutive seconds, meaning that the `TDB` can be configured but there are `I2C` communication problems between `2FOC` and `TDB`
- `-50` : the TDB loses the given configuration and uses the default one. In this case, the 2FOC restores the desired configuration.
- `-30` : the `TDB` sets any configuration value different from both the desired and the default one.



In the **logfile**, the `yarprobotinterface` prints the raw value instead the  degree Celsius. You can use the following table to understand the error. 

| **Degree Celsius**  | **Raw value for PT100**  |  **Raw value for PT1000** |
|:-----:|:-------:|:-------:|
| `-90` | `-1141` | `-8541` |
| `-70` | `-886`  | `-6549` |
| `-50` | `-631 ` | `-4613` |
| `-30` | `-378`  | `-2729` |



The `2FOC` triggers the `Overheating Error`, so the motor is set in Hardware fault, when:

- it reads a temperature value beyond the `hardwareTemperatureLimits` longer than 10 seconds.

Instead, the `2FOC` triggers the `I2C Communication Error`, so the motor is set in Hardware fault when:

- it cannot communicate over the `I2C bus` for more than 10 seconds (no data is transmitted even though the `TDB` is correctly configured).

The `embObjMotionControl` converts the received raw values to Celsius degrees and checks that the result is not beyond the `warningTemperatureLimit`, otherwise it prints a warning log until the temperature drops. 