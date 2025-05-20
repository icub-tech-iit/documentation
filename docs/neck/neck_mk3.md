# Neck Mk3

## Introduction

This documentation page describes the new ergoCub/iCub `Neck Mk3`. Thereby, you will find here information on its features.
It is possible to find the epic that encompasses the entire development here: https://github.com/icub-tech-iit/study-icub-headedge/issues/5

The adopted solution was designed and developed to address the issues related to the use of tendons in the previous version of the neck. This mechanism, in fact, is not only compact but also does not require the use of tendons.

The neck is compatible with both the ergoCub and iCub heads, with only minimal differences in the assembly.
<center>
  <figure>
    <img src="../img/ecub_icub_head.png"/>
  </figure>
</center>

## General description

<center>
  <figure>
    <img src="../img/ecub_neck.png"/>
  </figure>
</center>

Neck Mk3 follows a 'SERIAL' configuration of joints in this order from bottom to top: `pitch`, `roll`, `yaw`. The interfaces with the head and the chest have been adapted to match the previous ones.

The selected motors for the joints are:

- `FAULHABER_3216W024BXTH` for pitch and roll
<center>
  <figure>
    <img src="../img/faulhaber_3216W024BTXH_spec.png"/>
  </figure>
</center>

- `FAULHABER_2214S024BXTH` for yaw
<center>
  <figure>
    <img src="../img/faulhaber_2214S024BXTH_spec.png"/>
  </figure>
</center>

Compared to the previous neck version, the Mk3 neck designed for ergoCub has an overall height that is 10 mm greater, measured from the pitch joint axis as in figure.
<center>
  <figure>
    <img src="../img/quote_diff.png"/>
  </figure>
</center>

The differences between the neck designed for iCub and the one for ErgoCub concern only two parts:

| Alias in ergoCub | Alias in iCub | Description  |   Images      |
|----------------------|--------|---------------|------------|
|     IC_033_P_044         |    IC_034_P_038    | This component features hardstops along the edge for the `pitch` joint. The difference between ErgoCub and iCub lies in the allowed range of motion to prevent interference: for ergoCub -45 to +22 degrees; for iCub -30 to +22 degrees | Figure A   |
|       IC_033_P_041       |    IC_034_P_033    | This part differs between the necks designed for ErgoCub and iCub in several aspects, including the overall height (the ErgoCub version is 10 mm taller) and the shape. In fact, in the version designed for iCub, it was necessary to carve out a space to allow the head frame to pass during yaw movement, which would otherwise cause interference  |  Figure B

<center>
  <figure>
    <img src="../img/link_roll.png"/>
  </figure>
</center>

<center>
  <figure>
    <img src="../img/link_yaw.png"/>
  </figure>
</center>

## Range of movement

# ergoCub

| Joint | Range of movement (deg)
|----------------------|------|
|    PITCH       |   -45; +22   |
|       ROLL      |    -50; +50   |
|       YAW      |    -45; +45   |

# iCub

| Joint | Range of movement (deg) |
|----------------------|------|
|    PITCH       |   -30; +22   |
|       ROLL     |    -50; +50  |
|       YAW      |    -45; +45  |
