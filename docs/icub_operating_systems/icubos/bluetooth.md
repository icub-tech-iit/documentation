# Configure the Bluetooth

## Introduction

The Bluetooth connection is used on icub-head to communicate with the battery pack (so we can check the battery in our software); it can be also used to connect a joypad to the robot.
The icub-head board has an onboard BT controller and antenna, so no external dongle is required.

The BT configuration relies on hardware address, so it is to be done on each robot after you installed iCubOS.

## Required configuration
This procedure shows how to pair the bluetooth on icub-head with the battery module. It can be used also to pair and connect to a joypad, usign the joypad address instead of the _RNBT_ one.

1. Install the following packages
  ```
  bluetooth bluez bluez-tools
  ```

2. Scan for available devices and search for the battery device
  ```
  hcitool scan | grep RNBT
  ```

3. After a while, you should see the BT address of the battery (it look very similar to a MAC address), please take note of it

4. Open Bluetooth control and search for the Battery device
  ```
  bluetoothctl
    scan on
  ```

5. Wait that the RNBT address shows (see point 3.) then stop scanning
  ```
  scan off
  ```

6. Pair the battery device usign the RNBT address (replace _RNBT_ADDRESS_ with the addres you noted on point 3. )
  ```
  pair RNBT_ADDRESS
  ```

7. Check status
  ```
  devices
  ```

7. If everything is ok, the above command shows the battery device as _PAIRED AND CONNECTED_, then quit Bluetooth control
  ```
  quit
  ```

The configuration is now saved into the system and the battery will be connected automatically every time the iCUbOS boots.
