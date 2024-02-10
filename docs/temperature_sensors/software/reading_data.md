## Reading Raw Temperature Data

Each temperature sensor outputs an integer raw value whose range depends on the type of resistance thermometer mounted on the motor.
Currently, we can configure 2 types of sensors: `PT100` and `PT1000`.
For `PT100`, raw values typically range from `0` to `3500`. Instead, for `PT1000`, the range is between `0` and `8000`.

Although it is very unlikely to read negative temperatures in Celsius degrees during normal working conditions, we do accept negative values as they are specifically employed to notify the user of error conditions.
Finally, we have that the higher the temperature the higher the raw output value.

## Reading compensated motor temperature data

Regarding the correlation between raw temperature data and Celsius degree values here follows a brief description.
First of all, in order to reduce the effort of the end-user and at the same time remain compliant with the rest of the firmware, we have decided to work with values in Celsius degree on `embObjMotionControl` and, instead, use the raw value in the firmware part.
However, the configuration files are always filled with values in Celsius degrees; likewise, the values printed on the YARP port are in the same format.
By contrast, on the board level, we use raw values.
All the applied conversions strictly depend on the physical components involved, including the voltage divider, the resistance thermometer as well as the ADC stage of the TDB board. 
One important note to highlight is that even if we know that the conversion between raw and Celsius degree values is not exactly linear, we have decided to linearize the conversion by accepting an error of around ±1.5 ℃ over 100 ℃. 
Anyways, if you are interested in the specific insight regarding the conversion you can check [this repository](https://github.com/MSECode/temperatureConversionTester), which has been mainly used for two scopes:

- to check the validity of the linearization done and understand the magnitude of the error inside the working conditions, which are typically between 20 and 80 ℃.
- to evaluate the exact raw values needed for setting the defined error values to be used in the firmware, so that we can have an accurate conversion (related to our formula) on the high level. (See [error values](./dataflow.md) for more details).



### Data conversion from raw value to Celsius degree value

For converting a value from raw to Celsius degree the following steps are applied:

```console

Evaluate a first temporary value:
    
    double tmp = temperature * ((_resolution_pga) / (_pga_gain * _vcc * (_resolution_tdb + 1)));

where:
- _resolution_pga: resolution of the Programmable Gain Amplifier (PGA) mounted on the ADC, which is set to 2.048 [V]
- _resolution_tdb: resolution of the TDB ADC, which is set to 32767 since we are working at 16bit and we are saving the value to a signed int
- _vcc: incoming voltage in the voltage divider, which for us is set to 5V
- _pga_gain: gain for the PGA, which we have set to 2
        
The use the calculated temporary value for evaluate the denominator of the final operation:
    
    double den = _ptc_gradient * (_r_2 - _r_2*tmp - _r_3*tmp);

where:
- _ptc_gradient: slope of the PTXXX line
- _r_2: one of the two upper resistors in the voltage divider bridge, which for us is equal to 4700 [Ohm]
- _r_3: lower resistor of the bridge, which it should be set equal to the value, in Ohm, of the PTXXX at zero degree. Therefore, if we are using the PT100 it should be equal to 100

Finally, the last calculation that outputs the value of the got temperature in Celsius Degree is:

    double res = (tmp * (_first_res_coeff) / den) + ((_second_res_coeff) / den);

where:
- _ptc_offset: is the offset of the PTXXX line, thus it is 1000 in the case of PT1000 and 100 in the other case.
- r1: the other of the two upper resistors in the voltage divider bridge, which for us is equal to 4700 [Ohm]
- _first_res_coeff  = _r_1*_r_2 + _r_1*_r_3 + _ptc_offset*_r_2 + _ptc_offset*_r_3
- _second_res_coeff = _r_3*_r_1 - _r_2*_ptc_offset

It should be noted that those offsets are used to have the PTXXX line passes through zero at 0 Celsius Degree.

```

### Data conversion from Celsius degree value to raw value

Similarly, for converting from Celsius degree to raw value:

```console

    double tmp = (( (_ptc_offset + _ptc_gradient * temperature) / ((double)_r_1 + (_ptc_offset + _ptc_gradient * temperature))) - _half_bridge_resistor_coeff) * (double)_vcc;
    double res = (_resolution_tdb + 1) * ((_pga_gain * tmp) / _resolution_pga);

where:
- temperature: temperature value passed in Celsius degree
- _ptc_gradient: slope of the PTXXX line
- _ptc_offset: offset of the PTXXX line, thus it is 1000 in the case of PT1000 and 100 in the other case.
- _half_bridge_resistor_coeff = (double)_r_3 / (double)(_r_2 + _r_3) and it is the coefficient of half of the voltage divider
- vcc: incoming voltage in the voltage divider, which for us is set to 5V
- _resolution_pga: resolution of the PGA on the TDB, which is set to 2.048 [V]
- _resolution_tdb: resolution of the TDB ADC, which is set to 32767 since it works at 16bit and we are saving the value to a signed int


```
