# The OS on icub-head - Installation from scratch

Since iCubOS is based on Ubuntu server, we will install Ubuntu server from the default installer and the we manually costimize it

# Latest versions

Latest version is based on Ubuntu Server 20.04.1

# Create the USB installer

The first step is to download the [official Ubuntu 20.04 LTS Server install media](https://releases.ubuntu.com/focal/ubuntu-20.04.1-live-server-amd64.iso) from the [release page](https://releases.ubuntu.com/focal)

Then please create the USB installer using an USB memory and a tool like [Balena Etcher](https://www.balena.io/etcher/).

On Ubuntu website, you can find further informations about creating a bootable USB stick on [Windows](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows?_ga=2.181742695.1184983981.1588944309-600352565.1586438290), [Ubuntu](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu?_ga=2.181742695.1184983981.1588944309-600352565.1586438290) or [macOS](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-macos?_ga=2.236980288.1184983981.1588944309-600352565.1586438290)

# Install Ubuntu

Follow the below steps to install Ubuntu server on icub-head.

Please note that the installation procedure can be slight different in each release, you can see the [Ubuntu server official install guide](https://ubuntu.com/tutorials/tutorial-install-ubuntu-server)

**WARNING** : the installation procedure will overwrite the disk of your icub-head, so all data will be deleted.

## Ubuntu Installer configuration

Install the system by choosing the default options, except the follow steps:

### Keyboard and language

- **Layout** : `US`
- **Variant** : `US`

### Storage configuration

- _**Disable** the following option_ : `Setup this disk as an LVM group`

### Identity

- **Your name** : `icub`
- **Your Server's name** : `icub-head'
- **Pick a username** : `icub`
- **Choose a password** : `icub`

### SSH

- _**Enable** the following option_ : `Install SSH server`


# Required Packages

Install the following packages
```
nfs-common python-tk libopencv-dev ntpdate vim ssh cmake-curses-gui iperf libportaudio2 portaudio19-dev linux-sound-base alsa-base alsa-utils gdb meld bmon libi2c-dev expect libgfortran10-dev qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings
```

## Low Latency kernel

Install the following packages
```
linux-image-lowlatency linux-headers-lowlatency
```

## Disable X server at startup

The x server is started automatically at startup by GDM, so please disable GDM
```
sudo systemctl disable gdm
```

## iCub repository and package

1. Add the file
  ```
  /etc/apt/sources.list.d/icub.list
  ```

2. Edit as follows
  ```
  deb http://www.icub.org/ubuntu focal contrib/science
  ```
  Where you can substitute `focal` with the codename of the distribution that you are using. 

3. Import the icub SSH key
  ```
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 57A5ACB6110576A6
  ```

4. Install the package
  ```
  icub-common
  ```

# Configuration steps

## SSH configuration

1. Configure passwordless ssh: see this [link](https://askubuntu.com/questions/46930/how-can-i-set-up-password-less-ssh-login)
2. Disable reverse DNS lookup in SSH server: add the following line to the file `/etc/ssh/sshd_config`
  ```
  UseDNS no
  ```

## Network performances tweaks

1. Install the following packages :
  ```
  sudo apt install linux-image-lowlatency linux-headers-lowlatency
  ```

2. Modify the real time priority of process, add the file  `/etc/security/limits.d/icub.conf ` as follows
  ```
  icub    soft    rtprio    99
  icub    hard    rtprio    99
  ```

3. Set the max OS receive buffer size for all types of connections, by adding the file `/etc/sysctl.d/20-net-rbuffer.conf` as follows
  ```
  # This sets the max OS receive buffer size for all types of connections
  net.core.rmem_max=8388608
  ```

## NTP

Edit the file `/etc/default/ntpdate` by changing the following lines
```
NTPDATE_USE_NTP_CONF="no"
...
NTPSERVERS="10.0.0.1 ntp.ubuntu.com"
```

## IMU Bosch

### Installation

To use the IMU Bosch BNO055 through the i2c bus these additional steps are required:

1. Install libraries for i2c:
 `sudo apt install libi2c-dev i2c-tools`

2. Unzip [kempld-drivers.30.tar.gz](https://github.com/icub-tech-iit/icub-os-files/blob/master/drivers/imu-bosch/kempld-drivers.30.tar.gz)

3. Compile the custom kernel modules:
 ```
 cd kempld-drivers.30/kempld-modules-{ver}
 make
 sudo make install
 ```
 {ver} is the linux version (see uname -r). Ignore ssl errors during installation.

4. Load the required kernel module(the best should be add them at the startup):
 ```
 sudo insmod kempld-core.ko
 sudo insmod i2c-kempld.ko
 ```

5. Finally add `icub` user to `i2c` group:
 ```
 usermod -a -G i2c icub
 ```

### Test the configuration of i2c and BNO055

To test the installation with the [python script BNO055](https://github.com/icub-tech-iit/icub-os-files/blob/master/drivers/imu-bosch/BNO055.zip):
```
python BNO055.py
```

Note that to make it work you might change script at line 195:
```
# Open I2C bus
self._bus = smbus.SMBus(1)
```

specifing the right number instead of 1 the correct number that can be found throught:

```
i2cdetect -l
```
Another possible troubleshooting could be change in the script BNO055.py (line 187) the default address from 0x28 to 0x29

## fixed USB resources names

In order to get a fixed device name for some USB resources such as IMU and USB2SERIAL, you have to create the following UDEV rules

- IMU BOSCH : adde the file `/etc/udev/rules.d/88-bosch-i2c-imu.rules` as follows
  ```
  # iCub Bosch i2c IMU
  SUBSYSTEM=="i2c-dev", ATTRS{name}=="i2c-kempld", SYMLINK+="bosch-i2c-imu", MODE="0660", GROUP="i2c"
  ```

- USB to Serial interface : add the file `/etc/udev/rules.d/99-usb-serial.rules` as follows
  ```
  # tty Xsens
  SUBSYSTEM=="tty", ATTRS{idVendor}=="2639", SYMLINK+="ttyXsens", MODE="0660", GROUP="tty"
    ```

Further installation steps and configuration

# Tweaks

## Mount via SSH

On the icub-head, graphics-based tools have not been installed (except the ones required for firmware interfaces) and it is better not to install them. Anyway, to use graphic tools (like editors, files managers, etc..) is very useful and sometimes essential. Instead of running remotely a tool and displaying it locally (like we did in old PC104), we can mount locally via SSH the icub-head filesystem and run locally all the tools we need.
In order to mount locally the icub-head filesystem on your client:

1. install the sshfs package
  ```
  sudo apt-get install sshfs
  ```

2. create a mount point for the remote filesystem (eg.) `mkdir /home/icub/icub-head_fs`
3. mount the remote `/usr/local/src/robot` via SSH
  ```
  sudo sshfs -o allow_other icub@10.0.0.2:/usr/local/src/robot/ /home/icub/icub-head_fs
  ```

If you already setup the passwordless SSH login, you can skip the password:
```
sudo sshfs -o allow_other,IdentityFile=/home/icub/.ssh/id_rsa icub@10.0.0.2:/usr/local/src/robot/ /home/icub/icub-head_fs
```

# Customize the system

What now you need to do is to customize the installation with your hardware and enviroment (see the "_Required configuration_" paragraph in [_Networking_](networking.md), [_Bluetooth_](bluetooth.md), [_User Environment_](user-env.md) chapters as well as [_Further Tasks_ chapter](further-tasks.md) )
