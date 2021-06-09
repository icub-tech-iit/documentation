# The OS on icub-head - Configure the Bluetooth

## Introduction

The Bluetooth connection is used on icub-head to communicate with the battery pack (so we can check the battery in our software); it can be also used to connect a joypad to the robot.
The icub-head board has an onboard BT controller and antenna, so no external dongle is required.

The BT configuration relies on hardware address, so it is to be done on each robot after you installed iCubOS.

## Generic Bluetooth device configuration
This procedure shows how to pair a bluetooth device on icub-head.

1. Install the following packages
  ```
  bluetooth bluez bluez-tools
  ```

2. Open Bluetooth control and search for the device
  ```
  bluetoothctl
    scan on
  ```

3. Wait that the device address to show up, note it, then stop scanning
  ```
  scan off
  ```

4. Trust the device using its address (replace _ADDRESS_ with the addres you noted on point 3. )
  ```
  trust ADDRESS
  ```

4. Pair the device using its address (replace _ADDRESS_ with the addres you noted on point 3. ). It may prompt to enter ``yes`` to verify that the passcode is correct
  ```
  pair ADDRESS
  ```

5. Connect the device using its address (replace _ADDRESS_ with the addres you noted on point 3. ).
  ```
  connect ADDRESS
  ```

6. Check status
  ```
  devices
  ```

7. If everything is ok, the above command shows the device as _PAIRED AND CONNECTED_, then quit Bluetooth control
  ```
  quit
  ```

The configuration is now saved into the system and the device will be connected automatically.

## Battery device configuration
This procedure shows how to pair the bluetooth on icub-head with the BCB board to retrieve the battery status. The BCB board is not a standard Bluetooth device, so some additional passages are necessary.

1. Scan for available devices and search for the battery device. It should have the prefix ``RNBT``.
  ```
  hcitool scan | grep RNBT
  ```

2. After a while, you should see the BT address of the battery (it look very similar to a MAC address), please take note of it. Usually, the range of these devices is large, hence the BCB board of other robots may also be visible.

3. Follow the instructions from point 2 to 4 of the [above section](#generic-bluetooth-device-configuration). If you attempt also point 5, you will get the following error:
```
Failed to connect: org.bluez.Error.NotAvailable
```
In fact, it is not possible to connect since the board is not compatible with ``BlueZ``.

4. If the pairing went ok, the battery device should be _PAIRED_ but not connected. Quit Bluetooth control
  ```
  quit
  ```

In order to use it as a serial device, it is possible to use [``rfcomm``](https://linux.die.net/man/1/rfcomm). In order to check if the connection to the BCB board works, run the following command:
```
sudo rfcomm -r connect 0 RNBT_ADDRESS
```
This connects to the Bluetooth and creates a serial device named ``/dev/rfcomm0`` in ``raw`` mode. If this test is working, the terminal should be blocked, displaying a message like
```
Waiting for connection on channel 0
Connection from RNBT to /dev/rfcomm0
Press CTRL-C for hangup
```
On the robot side, whenever we connect to the BCB board, a blue LED should light up between the "Motors" and "CPU" button. By pressing ``CTRL+C``, the connection is interrupted.

The problem with ``rfcomm connect`` is that it keeps the connection with the Bluetooth board even when not necessary, and it is blocking for the terminal that called it. Alternatively, it is possible to use
```
sudo rfcomm bind 0 RNBT
sudo stty -F /dev/rfcomm0 raw
```
This connects to the Bluetooth only when the port ``/dev/rfcomm0`` is opened. The second command makes sure that the port is interpreted as a raw serial port and not as TTY. After launching those commands, the ``/dev/rfcomm0`` should be visible.

The connections made via ``rfcomm`` get reset when shutting down. In order to have them working at startup follow the next section.

### Connect to the BCB board automatically

The connections made via ``rfcomm`` get reset when shutting down. In order to have them working at startup, create a system service as follows. First create the file ``bt-battery.service`` in the folder ``/etc/systemd/system/`` as [here](https://github.com/icub-tech-iit/icub-os-files/blob/master/scripts/bt-battery.service)

This service runs once the ``bt-battery_connect.sh`` script at startup after running the ``bluetooth`` service.
You can find the script [here](https://github.com/icub-tech-iit/icub-os-files/blob/master/scripts/bt-battery_connect.sh), and it needs to be saved in the ``/etc/rc.iCub.d`` system folder.
⚠️ You need to change _RNBT_ADDRESS_ with the address you noted, keeping the ``"``.

The scripts first tries to connect using ``rfcomm connect``. If it works (hence ``rfcomm connect`` is still alive), releases the connection. Then it tries running ``rfcomm bind`` and ``stty`` checking the outputs in case of errors. If there is any error, it tries again at most 10 times.

You can try to run this script with the command
```
sudo bash ~/bt-battery_connect.sh
```

If the connections was successfull, you should see ``stty successfull`` and the ``/dev/rfcomm0`` should be available.

This service can be enabled at startup with
```
sudo systemctl enable bt-battery.service
```
and started with
```
sudo systemctl start bt-battery.service
```
In case there were errors starting the service, it is possible to inspect the output of the script with
```
systemctl status bt-battery.service
```
This script can also be run after startup in case the connection is not working, with
```
sudo bash ~/bt-bluetooth_connect.sh
```
