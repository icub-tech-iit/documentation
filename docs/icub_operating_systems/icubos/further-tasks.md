# Introduction

Once you configured the iCubOS there are other task to complete in order to prepare the robot to run your software.

# Remove Cloud Init package

Uninstall the cloud init packages as follows
```
sudo apt purge cloud-guest-utils cloud-init cloud-initramfs-copymods cloud-initramfs-dyn-netconf
```

# Disable unattended-upgrades

In order to avoid automatic system updates you can edit the file `/etc/apt/apt.conf.d/20auto-upgrades by` changing the following lines
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "0";
```

_Alternatively_ you can uninstall the package `unattended-upgrades` as follows
```
sudo apt remove unattended-upgrades
```

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
