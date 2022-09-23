# Robot Testing - Encoders and Joints limit (manual)
This page shows how to manually run tests on the robot using the icub-tests package and Robot Testing Framework.

## Preliminary actions
In order to use the tests available for icub, it is necessary to compile the robotology-superbuild with the `ROBOT_TESTING_FRAMEWORK` flag enabled. This will create a folder in the source code where you will find the suites to run for testing encoders and joint limits.

## Test Encoders

### Optical Encoders Drift
This test moves each joint for 1000 cycles and prints out the motor encoder sinusoid. It is important to check if the encoder eventually drifts -meaning that the optical disk is dirty and it needs to be cleaned. The drifting can be seen as a slope in the plot:

<center>
<img src ="../img/drift1.png"/>
</center>

A correct example of non-drift is:

<center>
<img src ="../img/drift2.png"/>
</center>

### Motor Encoder Consistency
This test performs a comparison between the joint encoder and the motor encoder parameters. The resulting plots should be overlapped.

Go to the `icub-tests` directory:

    cd robotology-superbuild/src/icub-tests/suites

Open the file `encoders-icub.xml` and test one part at the time by commenting the others. For each part test first the optical_encoders_drift and then MotorEncoderConsistency.

Now, from the previous folder, go into 

    cd contexts/icub

and check the files .ini related to the part that you are testing - this files contain the info about motion range, tolerance and number of cycles.

Now run the command

    robottestingframework-testrunner -v -s encoders-icub.xml

💾 It will automatically save the results in a text file on the same folder where I launched the test. The terminal gives then instructions about how to plot the data with gnuplot (run `sudo apt install gnuplot` if needed). Launch 1 joint at the time ([col=1:1], then [col=2:2] ecc..). For the encoder drift test, the correct plot should show a unique band without any drift. It means that all the encoder readings are correct. For the Motor Consistency test, the resulting plots should be overlapped.

⚠️ There may be some problems with the relative paths of the .ini files, to solve this you can edit the **`encoders-icub.xml`** file as follows:

    <test type="dll" param="--from contexts/icub/optical_encoders_drift_left_arm.ini">  OpticalEncodersDrift </test>
    <test type="dll" param="--from contexts/icub/optical_encoders_drift_right_arm.ini"> OpticalEncodersDrift </test>
    <test type="dll" param="--from contexts/icub/optical_encoders_drift_left_leg.ini">  OpticalEncodersDrift </test>
    <test type="dll" param="--from contexts/icub/optical_encoders_drift_right_leg.ini"> OpticalEncodersDrift </test>
    <test type="dll" param="--from contexts/icub/optical_encoders_drift_torso.ini">     OpticalEncodersDrift </test>

    <test type="dll" param="--from contexts/icub/motorEncoderConsistency_left_arm.ini">  MotorEncodersConsistency </test>
    <test type="dll" param="--from contexts/icub/motorEncoderConsistency_right_arm.ini"> MotorEncodersConsistency </test>
    <test type="dll" param="--from contexts/icub/motorEncoderConsistency_left_leg.ini">  MotorEncodersConsistency </test>
    <test type="dll" param="--from contexts/icub/motorEncoderConsistency_right_leg.ini"> MotorEncodersConsistency </test>
    <test type="dll" param="--from contexts/icub/motorEncoderConsistency_torso.ini">     MotorEncodersConsistency </test>
    <test type="dll" param="--from contexts/icub/motorEncodersConsistency_face.ini">     MotorEncodersConsistency </test> 
    <test type="dll" param="--from contexts/icub/motorEncodersConsistency_head.ini">     MotorEncodersConsistency </test>

⚠️ If the test fails starting, repeat it tuning the tolerance value `tol` but stay below **1.5 deg** (⚠️ error! We should perform a PID test BEFORE!!! and tol should be a smaller number). If the test fails, meaning that the plots are not good, the encoder might need to be cleaned/substituted.

## Joints limit test

Go to the icub-tests directory:

    cd robotology-superbuild/src/icub-tests/suites

Edit with gedit the file `jointsLimits_robotEth.xml` and test one part at the time by commenting the others. 

Now go into 

    cd contexts/icubEth

and check the files .ini related to the part that you are testing - this files contain the info about speed, tolerance and out of bound positions.

Now run the command

    robottestingframework-testrunner -v -s jointsLimits_robotEth.xml -o part_name.txt

💾 It will save the results in a text file on the Desktop. If you run the command without this part `> /home/icub/Desktop/part_name.txt` the results will be automatically saved in the current folder as `result.txt` BUT it will be overwritten every time.

⚠️ There may be some problems with the relative paths of the .ini files, to solve this you can edit the **`jointsLimits_robotEth.xml`** file as follows:

    <test type="dll" param="--from contexts/icubEth/joint_limits_right_arm.ini"> JointLimits </test>
    <test type="dll" param="--from contexts/icubEth/joint_limits_left_arm.ini"> JointLimits </test>
    <test type="dll" param="--from contexts/icubEth/joint_limits_right_leg.ini"> JointLimits </test>
    <test type="dll" param="--from contexts/icubEth/joint_limits_left_leg.ini"> JointLimits </test>
    <test type="dll" param="--from contexts/icubEth/joint_limits_torso.ini"> JointLimits </test>
    <test type="dll" param="--from contexts/icubEth/joint_limits_head.ini"> JointLimits </test> 

⚠️ If the tests fails, repeat it tuning the tolerance value `tol` but stay below **2.5%**.