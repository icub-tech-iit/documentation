## Motor temperature Data Flow

Generally, the data flow related to the whole pipeline of the sensing of the motor temperature is quite simple and a brief summary is proposed here below, whose main purpose is to make the reader aware of how the temperature data is retrieved from the motor resistance thermometer and printed out to a YARP port. 

In brief, as reported in the [introductory section](../general/overview.md#temperature-sensors), most of the `ergoCub` motors are currently provided with a `PT100`, which is a particular resistor able to correlate a value of temperature to a value of resistance in `Ohm`. The resistor is connected to a board called **Temperature Detection Board (TDB)**.
The TBD reads the `Ohm` value from the `PT100` (or `PT1000` for different types of motors) and streams out the raw data using the `I2C` protocol. This raw data is then received by the `2FOC` board at a frequency of `10 Hz` and, immediately after, handed over to the `EMS` board via the `CAN` bus. The `EMS` stores the temperature values in memory and sends them to `embObjMotionControl` together with all the other motor information.
Upon reception of the motor temperature, `embObjMotionControl` converts the values from raw to Celsius and checks if the `warningTemperatureLimit` is overcome. In that case, it prints out a warning on the yarprobotinterface log. No other actions are taken.


### Main Flow of Information

Here's a small yet exhaustive sequence diagram showing the whole dataflow as summarized above. It is possible to observe how the different actors that take part in the pipeline interact with each other, starting from the lower level up to the higher level.

<p align="center">
    <img  src="../img/MotorTemperature-Feature.png" width="700">
</p>


### Error handling
The error management is mainly performed by the `2FOC`.
It performs some checks while reading the temperature from the `I2C` and specific negative values (defined in the code) are set to notify the user. The TDB sends 3 bytes on the I2C bus: the temperature value (2 bytes) and its configuration (1 byte). The `2FOC` performs the check mainly on the configuration byte.


The possible errors currently managed are the following:

- `-90` : the `2FOC` cannot read from the `I2C`, meaning that the `ACK` is not received from the `TDB`.
- `-70` : the reading cannot be done for 10 consecutive seconds. An overheating fault is triggered.
- `-50` : the TDB loses the given configuration and uses the default one. In this case, the 2FOC restores the desired configuration.
- `-30` : the `TDB` sets any configuration value different from both the desired and the default one.


The `2FOC` triggers the `Overheating` error, so the motor is set in Hardware fault, when:

1. it cannot read from the I2C bus longer than 10 seconds
2. it reads a temperature value beyond the `hardwareTemperatureLimits` longer than 10 seconds.

The `embObjMotionControl` converts the received raw values to Celsius degrees and checks that the result is not beyond the `warningTemperatureLimit`, otherwise it prints a warning log until the temperature drops. 