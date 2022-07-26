# Test Demo Red Ball

📚 Additional  info [here](http://mediawiki.isr.ist.utl.pt/wiki/3D_ball_tracker).

- First run the module `CalibCameras`
- Load "Red-Ball_Demo"application

![image](https://user-images.githubusercontent.com/61685519/83749876-b44b5e00-a664-11ea-8321-d2202131c1ce.png)

- First ensure that the dimensions of the ball are correctly inserted in the file `config.ini` (usually 31mm or 36mm depending on the ball). Depending on the ball you are using, you will need to create a specific file by using a MATLAB script (come si fa?)
- Manually calibrate the reaching and grasping by modifying the offset along the 3 axes
- Now you will need to launch and prepare the robot. Go back to the tab 1/iCubStartUp and run only the 2 iKinCartesian (for arms) and iKinGazeCtrl

![image](https://user-images.githubusercontent.com/61685519/83756444-596b3400-a66f-11ea-99aa-b7c0883b7756.png)

- Run both wholeBodyDynamics and gravityCompensator modules

![image](https://user-images.githubusercontent.com/61685519/83756466-612ad880-a66f-11ea-95db-7525e725605f.png)

- Go back to the RedBallDemo tab. Run both `pf3dTracker` and `yarpview` modules. Now you should modify the camera parameters in order to obtain a neutral background without glowing effects and also increase the saturation until the robot recognizes the red ball. 

![image](https://user-images.githubusercontent.com/61685519/83756934-0940a180-a670-11ea-8226-45c4b7d2f950.png)

You should see the yellow circle in the video turning green when showing the ball to the robot.
- At this point you can run the demo. Move the ball around, the robot should follow it with his eyes and reach it with his arms, eventually grasping it.