# Robot Testing
This section will show how to use the iCubTest application to run the main testing suites for iCub encoders and devices.

# Where to get the application
The application is freely downloadable from the [RobotBazaar](https://robot-bazaar.iit.it/applications) website. In the applications section you will be able to start the wizard to set up the deployment and download the script that will install everything you need.

<img src ="../img/robot-bazaar.png" height = 500px>

Pressing start will start the setup wizard where the images to be used (icub-console and icub-head) and any additions will be defined. You will need to run all of the given commands in order to install the necessary packages for Linux or Mac.

# Setup procedure
Below is an example on how to set up your cluster in a situation where the robot is directly connected to the laptop in a peer-to-peer configuration:

<img src ="../img/clusters.png" height = 500px>

Then select the name of your robot and let's set up in detail the docker images to be used:

<img src ="../img/docker_images.png" height = 500px>

Let's define the machines within our network:

<img src ="../img/clusters_machines.png" height = 500px>

And finally you will be able to download the script and execute the given commands in a new terminal window.

# How to use the application
The application is provided with a simple GUI in which it will be possible to select a standard suite from the one provided by the icub-tests package, upload a custom one in xml format, and decide where to save the results of the tests performed.

<img src ="../img/GUI.png" height = 500px>

Once an option is selected from those available and the START button is pressed, the deployment procedure will also begin on the icub-head and a new yarprobotinterface should launch on the robot (if not already present). Once the suite is finished (e.g. encoders-icub.xml) the results will be saved in the directory indicated in the CUSTOM_PATH field or in the default directory `/tmp/icub-test_results`.

# How to properly stop the application
In order to properly clean the various nodes in the cluster, it will be necessary to perform the application shutdown in this order:

1. Wait for the end of the tests
2. Press the STOP button and wait for all nodes in the docker swarm to be cleaned/deleted
3. Close the application GUI from the X present in the window

**IMPORTANT: For any emergency or safety STOP, always keep the FAULT button handy and press it to switch off power to the motors.**






