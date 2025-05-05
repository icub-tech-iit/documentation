# The OS on icub-head - Installation from scratch

Since iCubOS is based on the Ubuntu server, we will install the latter from the default installer and then manually customize it.

## Latest versions

The latest version is based on Ubuntu Server 22.04

## Create the USB installer

The first step is to download the **official Ubuntu 22.04 LTS Server install media** from the [release page](https://releases.ubuntu.com/jammy). Search for `ubuntu-22.04.x-live-server-amd64.iso`.

Then, please create the USB installer using a USB memory and a tool like [Balena Etcher](https://www.balena.io/etcher/).

Find further information about creating a bootable USB stick on [Windows](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview), [Ubuntu](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview) or [macOS](https://support.apple.com/en-us/101578).

## Install Ubuntu

Follow the below steps to install the Ubuntu server on icub-head.

Please, note that the installation procedure can be slightly different in each release, you can see the [Ubuntu server official install guide](https://ubuntu.com/tutorials/tutorial-install-ubuntu-server)

!!! warning

    The installation procedure will overwrite the disk of your icub-head, so all data will be deleted.

### Ubuntu Installer configuration

Install the system by choosing the default options, except for the following steps:

#### Keyboard and language

- **Layout** : `US`
- **Variant** : `US`

#### Storage configuration

- _**Disable** the following option_ : `Setup this disk as an LVM group`

#### Identity

- **Your name** : `icub`
- **Your Server's name** : `icub-head`
- **Pick a username** : `icub`
- **Choose a password** : `icub`

#### SSH

- _**Enable** the following option_ : `Install SSH server`

## Required Packages

Install the following packages
```
nfs-common python-tk libopencv-dev ntpdate vim ssh cmake-curses-gui iperf libportaudio2 portaudio19-dev linux-sound-base alsa-base alsa-utils gdb meld bmon libi2c-dev expect libgfortran-10-dev qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings
```

### Low Latency kernel

Install the following packages
```
linux-image-lowlatency linux-headers-lowlatency
```

### Disable X server at startup

The x server is started automatically at startup by GDM, so please disable GDM
```
sudo systemctl disable gdm
```

## Configuration steps

### SSH configuration

1. Configure passwordless ssh: peruse these [instructions](https://askubuntu.com/a/46935).
2. Disable reverse DNS lookup in SSH server: add the following line to the file `/etc/ssh/sshd_config`
  ```
  UseDNS no
  ```

### Network performances tweaks

1. Install the following packages
  ```
  sudo apt install linux-image-lowlatency linux-headers-lowlatency
  ```

2. Modify the real-time priority of the process, add the file  `/etc/security/limits.d/icub.conf ` as follows
  ```
  icub    soft    rtprio    99
  icub    hard    rtprio    99
  ```

3. Set the max OS receive-buffer size for all types of connections, by adding the file `/etc/sysctl.d/20-net-rbuffer.conf` as follows
  ```
  # This sets the max OS receive-buffer size for all types of connections
  net.core.rmem_max=8388608
  ```

## Customize the system

What now you need to do is to customize the installation with your hardware and environment (see the "_Required configuration_" paragraph in [_Networking_](networking.md), [_Bluetooth_](bluetooth.md), [_User Environment_](user-env.md) chapters as well as [_Further Tasks_ chapter](further-tasks.md) )
