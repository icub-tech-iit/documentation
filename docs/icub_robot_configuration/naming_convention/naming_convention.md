# Naming convention

To help maintenance of configuration files, it is necessary to include the following information in the names of each single file:

 - robot body parts;
 - type of device or type of information contained in the file, like mechanicals or electronic or motor control data;
 - the electronics board number: in case of configuration file of device, it is useful to know which is the electronic board to refer to.
 - number of joints connected to the board.

## **1. Rules for naming devices**
This is the pattern of name of each device and its configuration file: `body_part-ebX-jA_B-type_of_device`. In details, each name is make up of 4 parts:

 - __body_part__: `head`, `face`, `left_arm`, `right_arm`, `torso`, `left_leg`, `right_leg`;
 - __ebX__: where X is the number of electronic board written on schematics document. Usually, but not always, X is also the last number of board’s ip address;
 - __jA_B__: this indicates that the board ebX controls joints from A to B. This information let you know if board is in upper or lower part.
 - __type_of_device__: `skin`, `mais`, `strain`, `mc`, `intertials`.

 For example, the configuration file of motor control device of joint 0 and 1 of head is named `head-eb20-j0_1-mc.xml` and inside it there is the name of device `head-eb20-j0_1-mc`:

 ```
    <devices robot="robotName" build="1">
        <device name="head-eb20-j0_1-mc" type="embObjMotionControl">
            <params ....... />
    	………………………………….
            …………………………….
        </device>
    </devices>
 ```


## **2.Rules for naming wrapper file**
The wrapper name and its configuration files should have the same name and its pattern is : body_part-type_of_device_wrapper.xml. In details, each file name is make up of 2 parts:

 - __body_part__:  `head`, `face`, `left_arm`, `right_arm`, `torso`, `left_leg`, `right_leg`, `left_foot`, `right_foot`;
 - __type_of_device_wrapper__: `skin_wrapper`, `mais_wrapper`, `FT_wrapper`, `VFT_wrapper`, `mc_wrapper`.

## **3.Rules for naming joints**
Each joint has a name that follows the naming convention explained [here](../../icub_kinematics/icub-joints/icub-joints.md).