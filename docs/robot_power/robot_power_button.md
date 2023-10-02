# Power push buttons

The power push buttons on the iCub 2.5 backpack and on the iCub3 back have different meaning depending on their colors. They have LEDs that can be steady or blinking.

| LED | Status | Description | Problem | Action/Note |
|:---:|:---:|:---|:---:|:---|
| :black_circle: | OFF | Power supply / battery off | ? | - check the power supply connection / check the battery charge </br> - switch on power supply / charge the battery |
| :red_circle: | STEADY </br>RED | Power ready | No | push buttons to switch on CPU or motors |
| ![blink_red_l](./assets/blinking_red.gif) | BLINKING </br>RED | Power ready | Yes | - overcurrent occurred </br>- press and hold few seconds to try again and if overcurrent persists contact technical support |
| :green_circle: | STEADY </br>GREEN | Power on | No | correct operation |
| ![blink_green_l](./assets/blinking_green.gif) | BLINKING </br>GREEN | Power on transient | No | start-up phase, max 20s delay to steady state |

| iCub 2.5 | iCub 3 |
|:---:|:---:|
|<img src="../assets/fig-icub2.5-1.png" height="400"> | <img src="../assets/fig-icub3-1.png" height="400"> |
|<img src="../assets/fig-icub2.5-2.png" height="150"> <img src="../assets/fig-icub2.5-3.png" height="150"> | <img src="../assets/fig-icub3-2.png" height="150"> <img src="../assets/fig-icub3-3.png" height="150"> |

On iCub3 and on R1 there is also a display that shows the voltage and current present, even the red/green icon with the same meaning as the push button LEDs (R1 doesn't have the colored buttons).

| iCub 3 | R1 |
|:---:|:---:|
| <img src="../assets/fig-icub3-4.png" height="200"> | <img src="../assets/fig-r1-1.png" height="200"> |


## Display Interface

Lately, we released a new version of the Display UX/UI.
The main screen is described in the image below for both iCub3, ergoCub, and R1:

<img src="../assets/display-screen-131.png" width="500" height="500">


If a fault occurs, the Display will switch to a different mode displaying a string that includes the error type and the last values of voltage and currents acquired at the moment of the fault.

An example is shown below. On the left, the errors are related to CPU line, whereas on the right, we have errors related to BOARDS/MOTORS line.

<img src="../assets/display-fault-screen-131.png" width="500" height="500">
