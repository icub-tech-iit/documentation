# FIRST START WITH ICUB


## Basic recommandations

Make sure you have connected the robot and the laptop server together with an ethernet cable.

Turn both CPU and motors switches from icub at the level of the backpack.

## Laptop commands

!!! note
    the password for icub user is **icub** as simple as that

Please open a terminal from the icon on the launch bar.

Type:

<img src ="../img/clip_image001.png">

A GUI will open

<img src ="../img/clip_image003.png">

- Click on Cluster tab:

- Click on GREEN play button on Nameserver node

<img src ="../img/clip_image005.png">

the tick icon next to icubsrv should become green

<img src ="../img/clip_image007.png">

<u>On nodes :</u> 

- please select both icubsrv and icub-head

<img src ="../img/clip_image009.png">

- click GREEN play button. 

<img src ="../img/clip_image011.png">

Both TV icon should turn from RED to GREEN

<img src ="../img/clip_image013.png">

<u>On Entities tab:</u>

<img src ="../img/clip_image015.png">

<u>On Applications :</u>

- Click on the arrow next to Applications in order to see the pre-installed apps.

<img src ="../img/clip_image017.png">

- double click on 1/iCubStartUp

<img src ="../img/clip_image017.png">

- right click on yarplogger (a side option window will show) and click run.

<img src ="../img/clip_image020.png">

!!! note
    This will create a new window to log messages from every applications that you will run and give us feedback – VERY USEFUL for debugging)

## Robot calibration

Now go back to yarpmanager window:

!!! danger "WATCH OUT"
    We are going to launch the robot, please make sure to have put the robot in a rest position (usual position on which the robot will be when you stop the yarprobotinterface from running) as the picture below.

<center>
<img src ="../img/clip_image023.jpg">
</center>

You may first take a look at the videos on the Deskstop folder YOUR_ROBOT_NAME-Videos and more precisely at “1-yarprobotinterface.gif” in order to see what the robot should do at start.

When you know what you should expect to get, you may start the real robot.

!!! danger
    Make sure the red push button is released (THIS IS THE SECURITY EMERGENCY FAULT BUTTON – IF EVER SOMETHING GOES WRONG PLEASE PUSH IT)

 - right click on yarprobotinterface and click RUN

## Cameras

 - double click on 2/Calib cameras:

 - Double click on cameras application to open a new tab on the right side of the yarpmanager main application window.

<img src ="../img/clip_image025.png">

 - click on the icon RUN ALL on the left side of the yarpmanager GUI 

<img src ="../img/clip_image027.png">

Four windows should pop-up: 2 for the cameras and 2 for settings on the cameras. 

<img src ="../img/clip_image029.png">


 - Click on CONNECT ALL button on the left side of the GUI and at the very moment you should be able to see the images inside the two cameras windows. 

<img src ="../img/clip_image033.png">


## Face Expressions

 - double click on 3/FACE EXPRESSIONS: 

<img src ="../img/clip_image035.png">

 - a new tab should appear into the main application container 

 - click on RUN ALL 

 - click on CONNECT ALL 

The face should turn from picture 1 to picture 2 (all the connections are OK if everything goes as explained) 

|before connection | after connection |
| --- | --- |
|<img src ="../img/clip_image037.jpg">|<img src ="../img/clip_image039.jpg">|

## Skin

 - Double click on Skin_Gui to create the new tab 

<img src ="../img/clip_image041.png">

 - click on RUN ALL

<img src ="../img/clip_image033.png">

!!! note
    This should make pop up 14 windows (13 skin patches and one user interface) for a FULLY SENSORIZED ROBOT, if your robot is less sensorized you may see less windows

<img src ="../img/clip_image045.png">

 - click on CONNECT ALL 

 - click on Binarization Filter button and make it ON, on the QtSkinManagerGui 

You can now start touching the robot everywhere the skin patched are present. 

!!! note "videos-gifs"
    See video test-skin.mp4 (or .gif) for the test made on your robot.

!!! note
    Once done using the robot (to do not over use the CPU for the server side– icubsrv – please close the applications – by clicking on DISCONNECT ALL and STOP ALL for the applications skin)

## Demo Yoga

 - double click on Demo Yoga – it creates a new tab. 

<img src ="../img/clip_image047.png">

!!! note
    Make sure that the robot as some enough room to move before launching it – TAKE A LOOK AT the video 4-Yoga.mp4 (or .gif) to see what the robot should do 

 - Click on RUN 

When finished STOP the application.

## Demo RedBall

(You may try to fetch a spongy red ball of diameter 6cm) 

 - double click on Red Ball Demo – a new tab should be created. 

<img src ="../img/clip_image049.png">

First, you will need to launch and prepare the robot. Go back to the tab 1/iCubStartUp. 

 - RUN only the two iKinCartesian (for both arms) and iKinGazeCtrl. 

<img src ="../img/clip_image051.png">

When the icons next to those three modules turn to green 

 - Click CONNECT ALL 
then:

 - RUN both wholeBodyDynamics and gravityCompensator modules 

<img src ="../img/clip_image053.png">

when they turn to green 

 - Click on CONNECT ALL 

Return to the Demo Red Ball tab 

 - RUN both pf3dTracker and yarpview modules 

<img src ="../img/clip_image055.png">

When the icons turn to GREEN (a new window should pop-up)

 - Click on CONNECT ALL 

!!! note
    the new yarpview window should get connected – and inside the window you should see a yellow circle moving frenetically – the software is looking for a round shape) 


 - Search for the window Grabber Remote GUI for the left camera. 

 - Go to the tab Feature:

<img src ="../img/clip_image057.jpg">

- Move the "Shutter" slider to middle range until the glowing of refracted light on the left image got almost restrained.
- Move "GAIN" slider to ZERO
- Move a tiny bit the BLUE and RED sliders inside the “White Balance” option to get to an almost normal color. (set the one in the picture above) 

Go to the Features (adv) tab: 

<img src ="../img/clip_image059.jpg">

- Put the red ball in front of the robot (the ball should be visible on the left camera viewer). 

Increase the SATURATION slider until the red ball gets recognized (circle turns from RED to GREEN) inside the pf3dtracker viewer. 

When done this process the robot will be able to see the ball and you can launch finally the demo. 

 - RUN demoRedBall

<img src ="../img/clip_image061.png">

 - click on CONNECT ALL 

!!! WARNING
    BEWARE DO NOT PUT THE BALL TOO CLOSE FROM THE BODY/FACE!!!!!
    
!!! WARNING
    THE ROBOT IS NOW MOVING TOWARD THE BALL AND TRY TO GRASP IT
    
    See the video tutorial on how to let the robot grasp the ball - RedBallDemo.mp4 - gif
