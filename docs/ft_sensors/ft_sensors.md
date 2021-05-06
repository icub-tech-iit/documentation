# F/T Sensors
The F/T sensor (6-dof) has also been specially designed to fit the iCub. However, the size of the sensor has been made compatible with an existing commercial product. On the other hand the signal conditioning electronics has been made to fit the sensor itself, consequently reducing the space required. The F/T sensor is based on a classical [Wheatstone bridge](http://en.wikipedia.org/wiki/Wheatstone_bridge) design employing 12 semiconductor strain gauges arranged in a 6 half-bridges configuration.ed robots

<center>
  <figure>
    <img src="../img/ft-sensor.png"/>
  </figure>
</center>

## **Mechanical specifications**

### Physical specifications
----
The physical specifications of the sensor are reported in Table 1:

|          |                                                               |
|----------|---------------------------------------------------------------|
| Weight   | 0.122\[kg\] |
| Diameter | 45\[mm\] |
| Height   | 18.4\[mm\] |
Table 1: Physical specifications of the sensor

### Measurement frame specifications
----

<center>
  <figure>
    <img src="../img/ft-frame.png"/>
    <figcaption><b>The F/T sensor reference frame</b></figcaption>
  </figure>
</center>

Please notice that key elements to localize the reference frame on the sensor are two:
1. the hole where the CAN exits the sensor;
2. the thick VS the thin sensor cover.

The sensor is calibrated to measure the Force/Torque applied by the upper (blue) part of the sensor on the lower (red) part of sensor, and express it on the F/T sensor reference frame.

### Calibration specifications
---
The sensors are calibrated in order to obtain high resolution in typical operating regions. Typical values of the range and resolution for a sensor after the calibration procedure are reported in Table 2. The resolution is typical for most applications and can be improved with filtering. Resolutions quoted are the effective resolution after dropping three counts of noise.

|                | Fx, Fy \[N\] | Fz \[N\] | Tx, Ty \[Nm\] | Tz \[Nm\]                                                   |
|----------------|--------------|----------|---------------|-------------------------------------------------------------|
| **Range**      | 1500         | 2000     | 35            | 25                                                          |
| **Resolution** | 0.25         | 0.25     | 0.005         | 0.004                                                       |
Table 2: typical values after sensor calibration

### Creo CAD model
---
The CAD model of FTSens is available in the hardware [repository](https://github.com/icub-tech-iit/cad-mechanics-public/tree/master/projects/common/ic_008_ft45_M4) of the `icub-tech-iit` organization on `GitHub`.

In particular the FT sensor assembly name is `ic_008_a_001.asm.1`.

### Additional info
---
Additional specification are reported in this [document](./assets/FTSens.pdf).

For more info on how to flash the firmware and the calibration matrix on a FT sensor, check the documentation page on [Firmware](../icub_firmware/firmware/firmware.md).

### Electronics
---
There are three versions of the electronic board of the iCub's FT sensor: STRAIN (also known as STRAIN1), STRAIN1.5 or STRAIN2. All this electronic boards sample the analog strain gauges voltages, and expose the measurements over a CAN interface.

Low-level documentation and materials about the `STRAIN2` board is available [here](https://github.com/icub-tech-iit/electronics-boards-public/tree/master/sensor-boards/strain2) .

Firmware source code:

- [STRAIN](https://github.com/robotology/icub-firmware/tree/master/sensorReaderDspic30f4013/strain)
- [STRAIN2](https://github.com/robotology/icub-firmware/tree/devel/emBODY/eBcode/arch-arm/board/strain2)

### FT45 and FT58 Assembly Variants (Mechanics + Electronics)
---

|             |                     |         |                                                                                                                               |                                                                                     |
|-------------|:-------------------:|---------|-------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| **IITCODE** |      **ALIAS**      | **REV** | **Description**                                                                                                               | Note                                                                                |
| **12487**   | 12487 (da cambiare) | \-      | FT45 M4 cod.**12191 - IC\_008\_A\_001** +**STRAIN2** cod.**11996.B** + **Wiring materials** cod. **12478.0.0**                | <span style="color:#ff0000;">Strain-gauge code missing</span>                       |
| **12491**   |    FT45\_M1\_E2     | \-      | FT45 M1 cod. <span style="color:#ff0000;">**?**</span> - **STRAIN2** cod.**11996.B** + **Wiring materials** cod.**12478.0.0** | <span style="color:#ff0000;">Mech. assembly (with strain-gauge code) missing</span> |
| **12031**   |   FT45\_M1\_E1.5    | \-      | **iCub, assembly - Force/Torque sensor (5x gain), with mechanical parts, strain-gauge, strain board and cabling**             |                                                                                     |
| **12621**   |    FT58\_M2\_E2     | \-      | FT58 M2 cod.**12176.A1 - IC\_005\_A\_001** + **STRAIN2** cod.**11996.B** + **Wiring materials** cod.**12478.0.0**             |                                                                             
<center>
  <figure>
    <img src="../img/assemby-variants.png"/>
  </figure>
</center>

### FT45 Mechanical variants
---
|                                |             |                                 |                 |                 |
|--------------------------------|-------------|---------------------------------|-----------------|-----------------|
|                                | FTSENSOR45A | IC\_001\_A\_001\_ftsensor45     | IC\_007\_A\_001 | IC\_008\_A\_001 |
| informal name                  | FT45        | FT45 v.2 (a.ka. Diego's sensor) | \-              | \-              |
| variant id                     | FT45\_M1    | FT45\_M2                        | FT45\_M3        | FT45\_M4        |
| first mechanical structure     | YES         | NO                              | YES             | NO              |
| second mechanical structure \* | NO          | YES                             | NO              | YES             |
| central through hole \*\*      | NO          | NO                              | YES             | YES             |
| obsolete                       | YES         | YES                             | YES             | NO              |

\* no countersunk screw, with pin assembly

\*\* requires STRAIN2 board

### FT58 variants
---

|                           |                                |                 |
|---------------------------|--------------------------------|-----------------|
|                           | ICUB3\_005\_A\_001\_ftsensor58 | IC\_005\_A\_001 |
| informal name             | FT58\_M1                       | FT58\_M2        |
| variant id                | FT58\_M1                       | FT58\_M2        |
| central through hole \*\* | NO                             | YES             |

\*\* requires STRAIN2 board

### FT58 assembly
---

<p>The FT58 sensor is assembled as described hereafter.</p>

<p>The assembly of the sensor is a 6 step process:</p>

<ol>
	<li>the top part, the sensor part and the bottom part are screwed together</li>
	<li>the pin holes are enalrged with the proper bore tool</li>
	<li>the sensor part is gaged</li>
	<li>the sensor is assembled and wired with the electronic board</li>
	<li>the three sensor parts are screwed together: the sensor is closed</li>
	<li>if needed pins are added with the proper strain relieving tool</li>
</ol>


For further details on the assembly refer to the component drawing in the repository [folder](https://github.com/icub-tech-iit/cad-mechanics-public/tree/master/projects/common/ic_005_ft58).
The drawing code is depends on the sensor to be assebled (refer to the table in the above section for the code).

The top interface is fixed with 6 M4x10 UNI 5931 counterbore hex. screws (cod. V4-10--_-_U5931_GC).
The recommended tightening torque is 2.8Nm.

<center>
  <figure>
    <img src="../img/img-1.png"/>
  </figure>
</center>

The bottom interface is fixed with 6 M4x10 UNI 5931 counterbore hex. screws (cod. V4-10--_-_U5931_GC).
The recommended tightening torque is 2.8Nm.

<center>
  <figure>
    <img src="../img/img-2.png"/>
  </figure>
</center>

### FT58 assembly on iCub3
---

The FT58 sensor is assembled on iCub3 as represented in th following pictures.
The top interface is fixed with 6 M4x12 UNI 5933 countersunk hex. screws (cod. V4-12--_-_U5933_C).
The recommended tightening torque is 2Nm.

<center>
  <figure>
    <img src="../img/img-3.jpeg"/>
  </figure>
</center>

The bottom interface is fixed with 6 M4x12 UNI 5933 countersunk hex. screws (cod. V4-12--_-_U5933_C).
The recommended tightening torque is 2Nm.

<center>
  <figure>
    <img src="../img/img-4.png"/>
  </figure>
</center>

## FT Sensor Electronics Variants
---

There are three cards for reading six axis F/T Sensors:

<table border="1" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<th scope="col">Name</th>
			<th scope="col">IIT Code and .Revision</th>
			<th scope="col">Description</th>
			<th scope="col">Status</th>
			<th scope="col">Compatible with Mechanical variant </th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>STRAIN1 </td>
			<td>832.B</td>
			<td><strong>STRAIN_01F, IIT - Electronic board, 6-axial strain gauges amplification card with enhanced noise capability</strong></td>
			<td style="background-color:#ff9933;"><strong>end of life</strong></td>
			<td>FT45_M1,FT45_M2,FT58_M1</td>
		</tr>
		<tr>
			<td>STRAIN1.5</td>
			<td>832.F</td>
			<td><strong>STRAIN_01F, IIT - Electronic board, 6-axial strain gauges amplification card with enhanced noise capability, 5X gain</strong></td>
			<td style="background-color:#ff9933;"><strong>end of life </strong></td>
			<td>FT45_M1,FT45_M2,FT58_M1</td>
		</tr>
		<tr>
			<td>STRAIN2</td>
			<td>11996.B</td>
			<td><strong>STRAIN2, IIT - Electronic board, 6 channels strain gauges variable gain interface board with CAN/UART, Temperature sensor, IMU, STM32L4</strong></td>
			<td style="background-color:#33cc00;"><strong>in production</strong></td>
			<td>
			<p>FT45_M1*,FT45_M2*,FT58_M1*</p>

			<p>FT45_M3**,FT45_M4**,FT58_M2**</p>
			</td>
		</tr>
	</tbody>
</table>

\* if breaking the legs

\*\* if removing the central ring 

<center>
  <figure>
    <img src="../img/img-5.png"/>
    <img src="../img/img-6.png"/>
  </figure>
</center>

## Cable connections
---
### STRAIN

<center>
  <figure>
    <img src="../img/cabling-strain.png"/>
  </figure>
</center>

### STRAIN2

<center>
  <figure>
    <img src="../img/cabling-strain2.png"/>
  </figure>
</center>

## Summarized usable codes
---

<table border="1" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<th scope="row">short description</th>
			<th scope="row">Asm. cod.</th>
			<th scope="row">Wingst</th>
			<th scope="row">Rev.</th>
			<th scope="col">Dwg. Micron Istrumnents code</th>
			<th scope="col">status</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">FTSensor 45 - Strain 1 (mech 1)</th>
			<th scope="row">FTSENSOR45A</th>
			<th scope="row">3407</th>
			<th scope="row">A2</th>
			<td>150923</td>
			<td>only maintenance</td>
		</tr>
		<tr>
			<th scope="row">FTSensor 45 - Strain 1 (mech 2)</th>
			<th scope="row">IC_001_A_001_ftsensor45</th>
			<th scope="row">not present</th>
			<th scope="row">0</th>
			<td>150923</td>
			<td>OBSOLETE</td>
		</tr>
		<tr>
			<th scope="row">FTSensor 45 - Strain 2 (mech 3)</th>
			<th scope="row">IC_007_A_001</th>
			<th scope="row">12183</th>
			<th scope="row">A2</th>
			<td>151245</td>
			<td>OBSOLETE</td>
		</tr>
		<tr>
			<th scope="row">FTSensor 45 - Strain 2 (mech 4)</th>
			<th scope="row">IC_008_A_001</th>
			<th scope="row">12191</th>
			<th scope="row">A1</th>
			<td>151245</td>
			<td>ACTIVE</td>
		</tr>
		<tr>
			<th scope="row">FTSensor 58 - Strain 1 </th>
			<th scope="row">ICUB3_005_A_001_ftsensor58</th>
			<th scope="row">10308</th>
			<th scope="row">A1</th>
			<td>151351</td>
			<td>OBSOLETE</td>
		</tr>
		<tr>
			<th scope="row">FTSensor 58 - Strain 2 </th>
			<th scope="row">IC_005_A_001</th>
			<th scope="row">12176</th>
			<th scope="row">A1</th>
			<td>151351</td>
			<td>ACTIVE</td>
		</tr>
	</tbody>
</table>

## Additional material

- [FT45 - without Temp. Compensation](./assets/FT45%20-%20without%20Temp.%20Compensation.pdf)
- [FT45 - Temp. Compensation included](./assets/FT45%20-%20Temp.%20Compensation%20included.pdf)
- [FT45 - Temp. Compensation included 2](./assets/FT45%20-%20Temp.%20Compensation%20included-2.pdf)
- [FT58 - without Temp. Compensation](./assets/FT58%20-%20without%20Temp.%20Compensation.pdf)
- [FT58 - Temp. Compensation included](./assets/FT58%20-%20Temp.%20Compensation%20included.pdf)

## More information
---
- F/T sensors are mounted by [Micron Instruments](http://www.microninstruments.com/)
