!!! NOTE "SUM UP"
    Updating the forearm in V2 had had for consequences the following changes compared to the wiring of the V1 - Please refer to this manual to compel with the new attributes.

# 1	WRIST

## 1.1  WRIST TENDONS LENGTH

Here is the list of the 10 tendons needed to build the wrist movements.

<center>
<img src= "/../img/HAND_WRIST_V2/ICUB_Tendon_Left_Right.png">



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

## 1.2 Wrist motor tendons
### 1.2.1	Location and Identification
From the pictures below you will be able to locate and identify the 8 tendons inside the **Right Forearm** building the active part of the wrist tendons.

<center>
    <img src="/../img/HAND_WRIST_V2/R_4RM_A.png" width = 110%>
	<img src= "/../img/HAND_WRIST_V2/R_4RM_B.png" width = 130%>
</center>

From the pictures below you will be able to locate and identify the 8 tendons inside the **Left Forearm** building the active part of the wrist tendons.

<center><img src="/../img/HAND_WRIST_V2/L_4RM_A.png" width = 120%></center>

<center><img src= "/../img/HAND_WRIST_V2/L_4RM_B.png" width = 130%></center>

### 1.2.2	Cabling

In the case you found out 1 of the 8 first cables of the wrist broken, here the sequence  you need to follow to restore the it.

| pictures | step by step guide|
| --- | --- |
| <img src="/../img/HAND_WRIST_V2/R_4RM_A.png" width = 110%><img src= "/../img/HAND_WRIST_V2/R_4RM_B.png" width = 150%> | <u>FIRST THING FIRST:</u> </br>which side of the wrist is broken?<br/> the internal (refer to cables 1 to 4) or the external <br/>one (refers to cables 5 to 8)? </br>Can you see the differences?</br>YOU may have guessed on your own but the answer<br/> is only that the external one is beneath<br/> the 3 proximal motors which makes it more <br/>complicated to reach and repair apart from<br/> that it is **exactly identical** - so to proceed <br/>we will first see how to move the proximal <br/>motor if you need to repair the external wrist motor<br/> and follow up with the explanation <br/>of the tendon in a more generical way <br/>as both motor are wired the same way.</br>**If you need to repair tendons from 1 to 4 <br/>please just proceed to STEP 2** |
| <img src= "/../img/HAND_WRIST_V2/Prox_screws1.png" width = 130%> | <u>STEP 1:</u> <br/> remove the 6 screws M1.6x5 and flip over the 3 motors to be able to access visually the motor beneath them. |
| <img src= "/../img/HAND_WRIST_V2/wrist_int_screws.png" width = 130%> | <u>STEP 2:</u> <br/> remove the 2 screws M2.5x10 holding the motor<br/>from now on you can work freely |
| <img src= "/../img/HAND_WRIST_V2/Tensioner_description.png" width = 130%> | <u>STEP 3:</u> <br/>remove the broken part of the cable still inside the tensioner <br/> !!!WARNING!!! <br/>once remove, either you put back the brand new cable inside or else just simply gather the part removed from the tensioner assembly and re-screw it back in until further notice in order to DO NOT LOSE PIECES!!! |
| <img src= "/../img/HAND_WRIST_V2/wrist_crimp_removal.png" width = 130%><br/><img src= "/../img/HAND_WRIST_V2/wrist_AEA_stand.png" width = 130%> | <u>STEP4:</u> <br/>At the level of the wrist pulley, just remove the broken cable and replace it : <br/>EASY for cable 5 and 6 BUT LESS EASY for cable 1 and 2, <br/>you need to remove the mechanical part <br/>preventing you from inserting and removing the head crimp. <br/> To do so, just remove the 2 screws M2x6 <br/>and slide the block to retrieve and replace the head crimp<br/>Once done, put back on place the block and the 2 screws |
| | We can now start wiring!!! |
| <img src= "/../img/HAND_WRIST_V2/W_pulley_Ft.png" width = 130%><br/><img src= "/../img/HAND_WRIST_V2/W_pulley_Bk.png" width = 130%> | <u>STEP 5:</u><br/>Let's begin with the motor pulley, here is the way to wire  them both (as they are perfectly identical). |
| <img src= "/../img/HAND_WRIST_V2/Wrist_cables_left.png" width = 130%><br/> | <u>**LEFT ARM**</u><br/><br/>The **BLUE** cables for the Left Forearm are: <br/> <center>**4** and **7**</center><br/><br/><br/>The **RED** cables for the Left Forearm are:<br> <center>**3** and **8**</center><br/> |
| <img src= "/../img/HAND_WRIST_V2/Wrist_cables_right.png" width = 130%><br/> | <u>**RIGHT ARM**</u><br/><br/>The **BLUE** cables for the Left Forearm are:<br><center>**3** and **8**</center><br/><br/><br/>The **RED** cables for the Left Forearm are:<br/><center>**4** and **7**</center><br/> |
| put a picture showing that | <u>STEP 6:</u> <br/>put a 2 tie wraps one for each side (or cable) in order to prevent them from getting untwisted. |
| picture motor almost closed on support | <u>STEP 7:</u><br/>Put back in place the motor with its 2 screws M2.5x10. Leave 1mm in between the motor and the support. We will cover this aspect later |
| <img src= "/../img/HAND_WRIST_V2/W_pulley_top.png" width = 130%><br/><img src= "/../img/HAND_WRIST_V2/W_pulley_Ext.png" width = 130%><br/><img src= "/../img/HAND_WRIST_V2/W_pulley_Int.png" width = 130%> | <u>STEP 8:</u><br/>let's wire the wrist pulleys (either for 1,2 or 5,6)<br/>Here is the detail wiring for the left arm, please mirror it for the right arm<br/>The wiring is quite simple |
|  | We are Finally getting to an end. Now that you know how to rewire every single one of the wrist cable you need to insert the tensioners. <br/>Let's make the example of the 4 cables 1 to 4. |
| <img src= "/../img/HAND_WRIST_V2/cable_IN1.png" width = 130%><br/><img src= "/../img/HAND_WRIST_V2/cable_IN2.png" width = 130%><br/> | <u>STEP 9:</u><br/>Remove the tie wrap at the level of the motor wrist,<br/>for let's say cable 3. Open one side of the tensioner <br/>and start putting the ring, then the threaded piece ,<br/>of the tensioner, finish by screwing the ring onto <br/>the threaded piece. Do the exact same for the cable 1. |
| <img src= "/../img/HAND_WRIST_V2/cable_IN3.png" width = 130%><br/> | <u>STEP 10:</u><br/>Screw both pieces into the main tensioner part - Let's say just 2 threads on both side, just to make it hold until we tense. |
|  | <u>STEP 11:</u><br/>Repeat STEP 9 and STEP 10 with cables 2 and 4. |
| photo from reality | <u>STEP 12:</u><br/>Use 2 pliers to hold on the tips of the threaded<br/> pieces' tensioner and start any tool fitting the hole<br/> inside the main part of the tensionner <br/>AND finally screw <br/>!!! depending on how you are facing the cables<br/> just screw CW or CCW for half a turn to<br/> understand if the 2 threaded pieces are going inside the main piece or if they get out - THEY NEED TO GET IN. |
| | Repeat the above step on both tensioners until you get a quite nice tensing (but not super tense, this will be done, right next). |
| <img src= "/../img/HAND_WRIST_V2/wrist_int_screws.png" width = 130%> | <u>FINAL STEP:</u><br/>Tense the 2 screws that we left a bit opened on STEP 7. |



## 1.3  Wrist - Passive tendons

### 1.3.1	Location and Identification

From the pictures below you will be able to locate and identify the 2 tendons inside both the **Right Wrist** and **Left Wrist** building the passive part of the wrist movements.

| RIGHT WRIST                                             | LEFT WRIST                                              |
| ------------------------------------------------------- | ------------------------------------------------------- |
| <img src="/../img/HAND_WRIST_V2/R_wrist_label.png" >    | <img src='/../img/HAND_WRIST_V2/L_wrist_label.png' >    |
| <img src="/../img/HAND_WRIST_V2/R_cabling_wrist1.png" > | <img src="/../img/HAND_WRIST_V2/L_cabling_wrist1.png" > |
| <img src="/../img/HAND_WRIST_V2/R_cabling_wrist2.png" > | <img src="/../img/HAND_WRIST_V2/L_cabling_wrist2.png" > |
| <img src="/../img/HAND_WRIST_V2/R_cabling_wrist3.png" > | <img src="/../img/HAND_WRIST_V2/L_cabling_wrist3.png" > |

### 1.3.2	Cabling

Here the sequence  you need to follow to restore the 2 little cables from the base of the wrist - we will write down the procedure using the left arm as base pictures but used the previous pictures above to mirror the explanations.

|pictures|step by step procedure|
| --- | --- |
|<img src="/../img/HAND_WRIST_V2/wrist_tensionner.png" ></br><img src="/../img/HAND_WRIST_V2/wrist_screws.png" > </br>|!!!KEEP IN MIND - whenever you need to replace one of the 2 cables you **FIRST** need to release the tensionners </br> <u>CABLE 10:</u> </br> it is really straight forward - just put one side of the crimp of cable 10 inside the tensionner (blue cirle) and put the other side inside the holding tooth|
|<img src="/../img/HAND_WRIST_V2/crimp_screw.png" >| <u>cable 9: </u> </br> it is just a tiny whinny more complicated because you need to first remove the screw to be able to lodge the crimp inside the tensionner and reput back in place the tensionner in the throat and insert the screw|
|<img src="/../img/HAND_WRIST_V2/up_down.png" >| Once done: </br>3. tighten the screws of both tensionner until you reach a strict tensing on the cables|



# 2	Hand Wiring

## 2.1 Location

<center>
	<img src= "../img/HAND_WRIST_V2/hand_motors.png" width = 130%>
</center>



## 2.2  Thumb Oppose

As usual, you will find here after the instructions for rewiring the Thump oppose joint at base of the Left Hand

| pictures | step by step guide|
| --- | --- |
| <img src="/../img/HAND_WRIST_V2/L_hand_w_palm.png" width = 110%><br/>| <u>STEP 1:</u> </br>The only way to start correctly this wiring is to remove the palm.<br/> Please remove the 3 srews M2x6 inside the palm (circled in red) and the 2 screws M2x4 at base of the wrist<br/>|
|<img src="/../img/HAND_WRIST_V2/L_Hand_wo_palm.png" width = 110%><br/><img src="/../img/HAND_WRIST_V2/L_T_opp_1.png" width = 100%><br/>|<u>STEP 2</u><br/>we will now focus on the wiring along the pulley.<br/>Cut 50 to 60cm of ITTCODE 1815.<br/>Move with a screwdriver the pulley in order to have the hole flat horizontally.<br/>Insert the cable, equilibrate evenly the cable on both side of the pulley|
|<img src="/../img/HAND_WRIST_V2/L_T_opp_2.png" width = 100%><br/>| <u>STEP 3:</u><br/>Make <br/>1 turn around the pulley CCW to go into S2<br/>ballbearing side<br/> 2 turns around the pulley CW to reach S0<br/>motor side<br/>!!!TIP: You may find convenient to remove the plate to round the cable around the pulley more easily|
|<img src="/../img/HAND_WRIST_V2/Opposite_palm-view.png" width="700"><br/><img src="/../img/HAND_WRIST_V2/L_Th_holes.png">|<u>STEP 4: </u><br/>Insert both side of the cable inside S2 and S0 until they sprout out from the palm side|
| picture on real icub  | !!!!TIP: once both side of the cables are out at the base of the palm, you may find convenient to verify the turns around the pulley ( you could use 2 pieces of foam hear plugs to prevent the cable from unwired itself) - Make sure the plate is screwed back into normal state |
|<img src="/../img/HAND_WRIST_V2/Thumb2.png"><br/><img src="/../img/HAND_WRIST_V2/Thumb3.png">|<u>STEP 5: </u><br/>The cable from S0 goes directly into hole T1<br/>the cable from S2 makes **1 FULL TURN** around the pulley before going into T2|
| <img src="/../img/HAND_WRIST_V2/L_Th_set_screws1.png"><br/><img src="/../img/HAND_WRIST_V2/L_Th_set_screws2.png">|<u>STEP 6: </u><br/>Use a 0.7mm hexagonal key (or screwdriver) to block the cables|
||!!!TIP: you may find useful to first block one side and afterwards use a plier to exert a strong pulling of the wire to tense this other side of the cable and block it. Repeat the the same process on the other side.<br/>!!!!CONGRATULATIONS YOU ARE DONE!!!|



## 2.3	Finger's Abduction