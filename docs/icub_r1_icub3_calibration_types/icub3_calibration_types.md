# Calibration types available on iCub 3
The table below aims to provide expert users with some technical information about calibration types on `iCub 3` robot.

<table>
  <tbody>
    <tr>
      <td>Calibration name</td>
      <td>Description</td>
      <td>Procedure</td>
      <td>Notes</td>
    </tr>
    <tr>
      <td>Rotor-stator autocalibration</td>
      <td>Automatic procedure to find the offset between the index position in the motor and the position that corresponds to zero electrical degrees in the stator</td>
      <td>&nbsp;</td>
      <td>To be executed after the first mechanical assembly and every time for some reason the stator needs to be unmounted from its housing</td>
    </tr>
    <tr>
      <td>Rotor index calibration</td>
      <td>At every startup of the robot, the motor moves in order to find the index of the reflective encoder</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Joint zero calibration</td>
      <td>TBD</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>AMO calibration</td>
      <td>The AMO sensor needs to be calibrated with an external device. The calibration parameters are stored on an EEPROM that is in the AMO board</td>
      <td>&nbsp;</td>
      <td>Every time the magnetic target or the AMO board are moved a bit from their position (the calibration takes into account the position between the target and the sensor mounted on the board)</td>
    </tr>
    <tr>
      <td>Joint Limits and Zero calibration</td>
      <td>Put the robot in the zero position and acquire the value of the AMO sensor</td>
      <td>&nbsp;</td>
      <td>Only once</td>
    </tr>
    <tr>
      <td>Joint startup calibration</td>
      <td>The joint moves to a specific position</td>
      <td>&nbsp;</td>
      <td>At every startup after rotor index calibration</td>
    </tr>
  </tbody>
</table>
