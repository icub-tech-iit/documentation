# Introduction

Once you configured the iCubOS there are other task to complete in order to prepare the robot to run your software.

# Source Path

On the latest versions of iCub (the ones  with a COM-Express board) we store robot source code on the icub-head, instead of storing remotely on the icub-server and mounting via nfs.
Usually, all required source code is stored in the following path
```
/usr/local/src/robot
```

You can create it with the following command
```
sudo mkdir -p /usr/local/src/robot
```

Then you must set the ownership of that folder to your default user (normally `icub`) as follows
```
sudo chown icub:icub /usr/local/src/robot
```

Now, you can save here robot source code, compile it and start playing with your iCub.

Have fun!
