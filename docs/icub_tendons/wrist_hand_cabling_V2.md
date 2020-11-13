## 1	WRIST

### 			1.1	Wrist tendons' Lengths

Here is the list of the 10 tendons needed to build the wrist movements.

<center>
<img src= "../img/HAND_WRIST_V2/ICUB_Tendon_Left_Right.png">


|Tendon   |IITCODE   |Length   |Alias   |
|---|---|---|---|
| 1 | 6400 | 72 mm | RC_IIT_019_G_019 |
| 2 | 6402 | 84 mm | RC_IIT_019_G_020 |
| 3 | 6404 | 101 mm | RC_IIT_019_G_021 |
| 4 | 6413 | 124 mm | RC_IIT_019_G_022 |
| 5 | 6414 | 107 mm | RC_IIT_019_G_023 |
| 6 | 6415 | 113 mm | RC_IIT_019_G_024 |
| 7 | 6416 | 112 mm | RC_IIT_019_G_025 |
| 8 | 6417 | 107mm | RC_IIT_019_G_026 |
| 9 | 6418 | 51 mm | RC_IIT_019_G_027 |
| 10 | 6419 | 43 mm | RC_IIT_019_G_028 |

</center>

### 			1.2	WRIST MOTOR TENDONS
#### 						1.2.1	Location and Identification
From the pictures below you will be able to locate and identify the 8 tendons inside the **Right Forearm** building the active part of the wrist tendons.

<center>
    <img src="../img/HAND_WRIST_V2/R_4RM_A.png" width = 110%>
	<img src= "../img/HAND_WRIST_V2/R_4RM_B.png" width = 130%>
</center>


From the pictures below you will be able to locate and identify the 8 tendons inside the **Left Forearm** building the active part of the wrist tendons.

<center><img src="../img/HAND_WRIST_V2/L_4RM_A.png" width = 120%></center>

<center><img src= "../img/HAND_WRIST_V2/L_4RM_B.png" width = 130%></center>

#### 						1.2.2	Cabling

In the case you found out 1 of the 8 first cables of the wrist broken, here is the sequence you need to follow to restore it.

| Pictures | step by step guide|
| --- | --- |
| <img src="../img/HAND_WRIST_V2/R_4RM_A.png" width = 110%><img src= "../img/HAND_WRIST_V2/R_4RM_B.png" width = 150%> | <u>FIRST THING FIRST:</u> <br>Which side of the wrist is broken?<br>The internal (refers to cables 1 to 4) or the external one (refers to cables 5 to 8)? <br>Can you see some visual differences?<br>YOU may have guessed on your own, but the answer is only that the external motor is beneath the 3 proximal motors, which makes it more complicated to reach and repair. <br> Apart from that, it is **exactly identical** - so to proceed we will first see how to move the proximal motors and follow up with the explanation of the tendon repair in a more generical way. <br>**If you need to repair tendons from 1 to 4 <br>please just proceed to <u>STEP</u> 2** |
| <img src= "../img/HAND_WRIST_V2/Prox_screws1.png" width = 130%> | <u>STEP 1:</u> <br/>Remove the 6 screws M1.6x5 and flip over the 3 motors to be able to access visually the motor beneath them. |
| <img src= "../img/HAND_WRIST_V2/wrist_int_screws.png" width = 130%> | <u>STEP 2:</u> <br/>Remove the 2 screws M2.5x10 holding the motor.<br/>From now on, you can work freely. |
| <img src= "../img/HAND_WRIST_V2/Tensioner_description.png" width = 130%> | <u>STEP 3:</u> <br/>Remove the broken part of the cable still inside the tensioner. <br/> !!!WARNING!!! <br/>It is the utmost importance that you<br/>DO NOT MIX the 3 parts of the tensioner.<br/>ALWAYS KEEP THEM TOGETHER <br/>the main part and its 2 screwing side <br/> |
| <img src= "../img/HAND_WRIST_V2/wrist_crimp_removal.png" width = 130%><br/><img src= "../img/HAND_WRIST_V2/wrist_AEA_stand.png" width = 130%> | <u>STEP 4:</u> <br>At the level of the wrist pulley, just remove the broken cable and replace it : <br//>EASY for cable 5 and 6<br/>BUT LESS EASY for cable 1 and 2, <br/>because you need to remove the mechanical part <br/>preventing you from inserting and removing the head crimp. <br/>To do so, just remove the 2 screws M2x6 <br/>and slide the block to retrieve and replace the head crimp.<br/>Once done, put back on place the block and the 2 screws. |
| | We can now start wiring!!! |
| <img src= "../img/HAND_WRIST_V2/W_pulley_Ft.png" width = 130%><br/><img src= "../img/HAND_WRIST_V2/W_pulley_Bk.png" width = 130%> | <u>STEP 5:</u><br/>Let's begin with the motor pulley, here is the way to wire them both (as they are perfectly identical). |
| <img src= "../img/HAND_WRIST_V2/Wrist_cables_left.png" width = 130%><br/> | <u>**LEFT ARM**</u><br/><br/>The **BLUE** cables for the Left Forearm are: <br/> <center>**4** and **7**</center><br/><br/><br/>The **RED** cables for the Left Forearm are:<br> <center>**3** and **8**</center><br/> |
| <img src= "../img/HAND_WRIST_V2/Wrist_cables_right.png" width = 130%><br/> | <u>**RIGHT ARM**</u><br/><br/>The **BLUE** cables for the Right Forearm are:<br><center>**3** and **8**</center><br/><br/><br/>The **RED** cables for the Right Forearm are:<br/><center>**4** and **7**</center><br/> |
|  | <u>STEP 6:</u> <br/>Put a 2 tie wraps one for each side (or cable) in order to prevent them from getting untwisted. |
| picture motor almost closed on support | <u>STEP 7:</u><br/>Put back in place the motor with its 2 screws M2.5x10. Leave 1mm in between the motor and the support. We will cover this aspect later. |
| <img src= "../img/HAND_WRIST_V2/W_pulley_Top.png" width = 130%><br/><img src= "../img/HAND_WRIST_V2/W_pulley_Ext.png" width = 130%><br/><img src= "../img/HAND_WRIST_V2/W_pulley_Int.png" width = 130%> | <u>STEP 8:</u><br/>Let's wire the wrist pulleys (either for 1,2 or 5,6)<br/>Here is the detailed wiring for the left arm, please mirror it for the right arm.<br/>The wiring is quite simple. |
|  | We are finally getting to an end. Now that you know how to rewire every single one of the wrist cables you need to insert the tensioners. <br/>Let's make the example of the 4 cables 1 to 4. |
| <img src= "../img/HAND_WRIST_V2/cable_IN1.png" width = 130%><br/><img src= "../img/HAND_WRIST_V2/cable_IN2.png" width = 130%><br/> | <u>STEP 9:</u><br/>Remove the tie wrap at the level of the motor wrist,<br/>for let's say cable 3. Open one side of the tensioner <br/>and start putting the ring, then the threaded piece<br/>of the tensioner, finish by screwing the ring onto <br/>the threaded piece. Do the exact same for the cable 1. |
| <img src= "../img/HAND_WRIST_V2/cable_IN3.png" width = 130%><br/> | <u>STEP 10:</u><br/>Screw both pieces into the main tensioner part - Let's say just 2 threads on both sides, just to make it hold until we tense it. |
|  | <u>STEP 11:</u><br/>Repeat STEP 9 and STEP 10 with cables 2 and 4. |
| <img src= "../img/HAND_WRIST_V2/tensioner_pliers.png" width = 130%> | <u>STEP 12:</u><br/>Use 2 pliers to hold on the tips of the threaded pieces' tensioner and use with any tool<br/>fitting the hole inside the main part of the tensioner AND finally screw them.<br/>!!! TIP !!!<br/>depending on how you are facing the cables<br/>just screw CW or CCW for half a turn to<br/>understand if the 2 threaded pieces are going inside the main piece or if they get out - THEY NEED TO GET IN OBVIOUSLY. |
| | Repeat the above step on both tensioners until you get a quite nice tensing (but not super tense, this will be done right next). |
| <img src= "../img/HAND_WRIST_V2/wrist_int_screws.png" width = 130%> | <u>FINAL STEP:</u><br/>Tense the 2 screws that we left a bit opened on STEP 7. |



### 			1.3	WRIST - PASSIVE TENDONS

#### 						1.3.1	Location and Identification

From the pictures below you will be able to locate and identify the 2 tendons inside both the **Right Wrist** and **Left Wrist** building the passive part of the wrist movements.

| RIGHT WRIST                                                  | LEFT WRIST                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="../img/HAND_WRIST_V2/R_wrist_label.png" width = 300> | <img src='../img/HAND_WRIST_V2/L_wrist_label.png' width = 300> |
| <img src="../img/HAND_WRIST_V2/R_cabling_wrist1.png" width = 300> | <img src="../img/HAND_WRIST_V2/L_cabling_wrist1.png" width = 300> |
| <img src="../img/HAND_WRIST_V2/R_cabling_wrist2.png" width = 300> | <img src="../img/HAND_WRIST_V2/L_cabling_wrist2.png" width = 300> |
| <img src="../img/HAND_WRIST_V2/R_cabling_wrist3.png" width = 300> | <img src="../img/HAND_WRIST_V2/L_cabling_wrist3.png" width = 300> |

#### 						1.3.2	Cabling

Here the sequence  you need to follow to restore the 2 little cables from the base of the wrist - we will write down the procedure using the left arm as base pictures but use the previous pictures above to mirror the explanations.

|Pictures|step by step procedure|
| --- | --- |
|<img src="../img/HAND_WRIST_V2/wrist_tensionner.png" width = 250></br><img src="../img/HAND_WRIST_V2/wrist_screws.png" width = 250 > </br>|!!!KEEP IN MIND!!!<br/>whenever you need to replace one of the 2 cables<br/>you **FIRST** need to release the tensioners .<br/></br> <u>CABLE 10:</u> </br> it is really straight forward - just put one side of the crimp <br/>of cable 10 inside the tensioner (blue circle) <br/>and put the other side inside the holding tooth.|
|<img src="../img/HAND_WRIST_V2/crimp_screw.png" width = 250>| <u>CABLE 9:</u> </br> it is just a bit more complicated because <br/>you need to first remove the screw to be able to lodge<br/> the crimp inside the tensioner and put back in place<br/> the tensioner in the throat and insert the screw. |
|<img src="../img/HAND_WRIST_V2/up_down.png" width = 250>| Once done: </br>tighten the screws of both tensioners<br/>until you reach a strict tensing on the cables. |



## 2	HAND

### 			2.1	Location

<center>
	<img src= "../img/HAND_WRIST_V2/hand_motors.png" width = 130%>
</center>
The minimum requirement to start re-cabling those 2 joints is:

| IITCODE | Alias    | Description                                                  |
| ------- | -------- | ------------------------------------------------------------ |
| 1815    | CG077063 | Stainless steel micro-cable, cable construction 7x7mm, nom. diameter  0,63mm, not coated, AISI 316 |



### 			2.2  THUMB OPPOSE

As usual, you will find here after the instructions for rewiring the Thump oppose joint at base of the Left Hand.

| Pictures | step by step guide|
| --- | --- |
| <img src="../img/HAND_WRIST_V2/L_Hand_w_palm.png" width = "500px"><br/> | <u>STEP 1:</u> </br>The only way to start correctly this wiring<br/>is to remove the palm.<br/>Please remove the 3 screws M2x6 (circled in red) inside the palm </br> and the 2 screws M2x4 (circled in blue) at the base of the wrist. |
|<img src="../img/HAND_WRIST_V2/L_Hand_wo_palm.png" width = 500><br/><img src="../img/HAND_WRIST_V2/L_T_opp_1.png" width = 350><br/>|<u>STEP 2</u>:<br/>We will now focus on the wiring along the pulley.<br/>Cut 50 to 60cm of ITTCODE 1815.<br/>Move with a screwdriver the pulley in order to have the hole flat horizontally.<br/>Insert the cable, divide equally the cable from part to part of the pulley.|
|<img src="../img/HAND_WRIST_V2/L_T_opp_2.png" width = 350><br/>| <u>STEP 3:</u><br/>DO <br/>1 turn around the pulley CCW to go into S2<br/>ball-bearing side<br/> 2 turns around the pulley CW to reach S0<br/>motor side<br/>!!!TIP: You may find convenient to remove<br/> the plate to round the cable around the pulley more easily. |
|<img src="../img/HAND_WRIST_V2/Opposite_palm-view.png" width="400"><img src="../img/HAND_WRIST_V2/R_Th-opp-d-view.png" width="400"><br/><img src="../img/HAND_WRIST_V2/L_Th_holes_S.png" width="300">|<u>STEP 4: </u><br/>Insert both sides of the cable inside S2 and S0 <br/>until they sprout out from the palm side. Remember that S0 is the shorter sheath and S1 is the longer one. BE CAREFUL! The right hand is not symmetrical.|
| <img src="../img/HAND_WRIST_V2/S0S1.png" width="300"> | !!!!TIP: once both sides of the cables are out at the base<br/>of the palm, you may find convenient to verify the turns<br/> around the pulley ( you could use 2 pieces<br/> of foam hear plugs to prevent the cable from unwired itself)<br/> - Make sure the plate is screwed back into normal state. |
|<img src="../img/HAND_WRIST_V2/L_Th_holes.png" width="300">|<u>STEP 5: </u><br/>The cable from S0 goes directly into hole T1.<br/>The cable from S2 makes **1 FULL TURN** around<br/>the pulley before going into T2.|
| <img src="../img/HAND_WRIST_V2/L_Th_set_screws1.png" width="300"><br/><img src="../img/HAND_WRIST_V2/L_Th_set_screws2.png" width="300"> |<u>STEP 6: </u><br/>Use a 0.7mm hexagonal key (or screwdriver)<br/> to block the cables.|
||!!!TIP: you may find useful to first block one side <br/>and afterwards use a plier to exert a strong <br/>pulling of the wire to tense this other side <br/>of the cable and block it. Repeat the the same process on the other side.<br/> <br/> **FINAL CHECK: If the cabling is correct, when rotating the motor CW the finger should open (hand wide open)** |
| |!!!!CONGRATULATIONS YOU ARE DONE!!!|



### 			2.3	FINGERS ABDUCTION

<u>PREFACE:</u> This cable is THE most complicated to replace - rewire, mainly because you need to unmount a lot of parts BUT on the other hand it is also the most reliable - You may never need to replace it.



| Pictures                                                     | step by step guide                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="../img/HAND_WRIST_V2/remove-dorso.png" width = 400><br/> | <u>STEP 1:</u><br/>remove the screw M2x6 holding the dorsum cover<br/>and turn upside down the cover from the external part. The dorsum cover should get removed. |
| <img src="../img/HAND_WRIST_V2/L_Hand_w_palm.png" width = 400><br/> | <u>STEP 2:</u></br>The only way to start correctly this wiring is to remove the palm.<br/>Please remove the 3 screws M2x6 inside the palm (circled in red) and the 2 screws M2x4 (circled in blue) at base of the wrist.<br/> |
| <img src="../img/HAND_WRIST_V2/set-screws-f-abd.png" width = 250><br/><img src="../img/HAND_WRIST_V2/zoom-set-screws-f-abd.png" width = 250> | <u>STEP 3:</u><br/>remove the overall set screws.<br/>Use a 0.7mm hexagonal - screwdriver or key. |
|                                                              | <u>STEP 4:</u><br/>remove the overall remaining pieces of the broken cable before starting to restore it.<br/>Inspect inside the cage - remove the 2 screws M1.6x5.<br/>Let's get to business and Let's start wiring! |
| <img src="../img/HAND_WRIST_V2/L-f-abd-wiring.png" width = 250><br/><img src="../img/HAND_WRIST_V2/L-f-abd-wiring1.png" width = 250> | <u>STEP 5:</u><br/>start wiring:<br/>2 Full Turns (blue) CCW around the pulley and it gets out <br/>into tube T2<br/>1 Full Turn (red) CW around the pulley and it gets out into tube T0. |
|                                                              | !!!TIP!!! It could be a good idea to block the wiring around the pulley thx to some foam earplug or some paper. |
| <img src="../img/HAND_WRIST_V2/L_hand_f_abd_new.png" width = 250> | Here is a picture of the overall path of the cable inside the 3 tubes constituting the path of the cable. |
| <img src="../img/HAND_WRIST_V2/Unmount-board1.png" width = 110%> | <u>STEP 6:</u><br/>remove every single board above the knuckle. |
| <img src="../img/HAND_WRIST_V2/Unmount-board2.png" width = 250> | <u>STEP 6a:</u><br/>remove the screw and flip over the board with the little chipsets. |
| <img src="../img/HAND_WRIST_V2/Unmount-board3.png" width = 250><br/><img src="../img/HAND_WRIST_V2/Unmount-board4.png" width = 250> | <u>STEP 6b:</u><br/>1. Unplug every single chipset from the main board<br/>!!!TIP: Please write down with a marker the initial of the finger chipset you unplug - it sometimes a bit messy when remounting everything to find out which chipset is for which finger.<br/>2. remove the power connector<br/>3. remove the 3 screws (2 M1x5 and 1 M1.6x6)<br />4. With caution please remove the MAIS Board - on the bottom side of the board there is an inductor that sometimes got broken when removed carelessly. |
| <img src="../img/HAND_WRIST_V2/Unmount-board5.png" width = 250> | <u>STEP 6c:</u><br/>remove the 2 screws M1.6x6<br/>          |
|                                                              | Let's start with wiring the cable from T2                    |
| <img src="../img/HAND_WRIST_V2/L-f-abd-wiring2.png" width = 250><br/> | <u>STEP 7:</u><br/>Here is the picture of the routing of the cable you need to realize.<br/>To do that, it is necessary to allow the pulleys to rotate around their pin. |
| <img src="../img/HAND_WRIST_V2/R_P_pins.png" width = 250><br/><img src="../img/HAND_WRIST_V2/P_R_axes_screws.png" width = 250> | <u>STEP 7a:</u><br/>**PINKIE FINGER**<br/>1. you need to untighten ENTIRELY the axes screws <br/>on both sides of the finger (on the palm side it can be removed<br/> - pay attention that the ball bearing may fall as well, <br/> just remember to replace it when remounting - <br/> BUT REFRAIN TO REMOVE on top side <br/>- or else you will lose the center of the finger) <br/>2. try to move the pulley along its pin until you succeed<br/> to insert the cable into it.<br/>3. Put back on the axes screws and retighten them. |
|                                                              | <u>STEP 7b:</u><br/>**RING FINGER**<br/>Same 3 first steps as the Pinkie finger.<br/>4. Finally insert the cable into the hole leading to T4. |
| <img src="../img/HAND_WRIST_V2/P_set_screw.png" width = 110%> | <u>STEP 8:</u> <br/>Before starting to wire the base of the index finger<br/>it is really important to block the cable <br/>at the base of the pinkie finger - in this way we wont unintentionally untwine the wiring<br/>at the level of the motor pulley.<br/>1. Insert the set-screw onto the pinkie finger and tighten it.. |
|                                                              | Let's start wiring the index base pulley                     |
| <img src="../img/HAND_WRIST_V2/Th_exit1.png" width = 110%>   | <u>STEP 9:</u><br/>As for pinkie and ring fingers: <br/>1. untighten the 2 axes screws in order to be able to move the pink (color) pulley sideways around its **PIN**<br/>2. Pass the cable coming from T4 (red) inside the pulley hole. |
| <img src="../img/HAND_WRIST_V2/Th_exit2.png" width = 110%>   | <u>STEP 10:</u><br/>1. wire the cable from T0 (blue)<br/>2. re-center the pinky pulley<br/>3. put the axes screw back on. |
|                                                              | Let's start tensing the cable                                |
| <img src="../img/HAND_WRIST_V2/P_set_screw2.png" width = 110%> | <u>STEP 11:</u><br/>1. take one plier - pinch at the exit of the cable from the pinky pulley and twist it to retrieve the excess <br/>of cable which will have for consequence to tense this part of the cable - the overall fingers should get closer to each other<br/>2. put the set-screw A and B<br/>3. Tense the other side of the cable (blue part) the same way<br/>4. put the set-screw C |
| <img src="../img/HAND_WRIST_V2/check.png" width = 110%>      | <u>STEP 12:</u><br/>Final test:<br/>1. remove the 2 blocks (foam ear plug or paper jamming) from the pulley motor<br/>2. use the head screw from the pulley motor to check if the fingers get opened-closed whenever you turn it CW or CCW. |
|                                                              | IF YES -YOU ARE DONE - USE every unmounting step to put back in place every part of the hand |

