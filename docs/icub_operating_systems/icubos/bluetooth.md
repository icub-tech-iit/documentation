# Configure the Bluetooth

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
This procedure shows how to pair the bluetooth on icub-head with the BCB board to retrieve the battery status.

1. Install the following packages
  ```
  bluetooth bluez bluez-tools
  ```

2. Scan for available devices and search for the battery device. It should have the prefix ``RNBT``.
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

6. Pair the battery device using the RNBT address (replace _RNBT_ADDRESS_ with the addres you noted on point 3. ). It may prompt to enter ``yes`` to verify that the passcode is correct
  ```
  pair RNBT_ADDRESS
  ```

7. If everything is ok, the above command shows the battery device as _PAIRED_ (not connected), then quit Bluetooth control
  ```
  quit
  ```

It is not possible to connect since the board is not compatible with ``BlueZ``. In order to use it as a serial device, it is possible to use [``rfcomm``](https://linux.die.net/man/1/rfcomm):
```
sudo rfcomm -r connect 0 RNBT_ADDRESS
```
This connects to the Bluetooth and creates a serial device named ``/dev/rfcomm0`` in ``raw`` mode. The problem with ``rfcomm connect`` is that it keeps the connection with the Bluetooth board even when not necessary. Alternatively, it is possible to use 
```
sudo rfcomm bind 0 00:06:66:E7:82:23
sudo stty -F /dev/rfcomm0 raw
```
This connects to the Bluetooth only when the port ``/dev/rfcomm0`` is opened. The second command makes sure that the port is interpreted as a raw serial port and not as TTY.

On the robot side, whenever we connect to the BCB board, a blue LED should light up between the "Motors" and "CPU" button.
The connections made via ``rfcomm`` get reset when shutting down. In order to have them working at startup follow the next section.

### Connect to the BCB board automatically

The connections made via ``rfcomm`` get reset when shutting down. In order to have them working at startup, create a system service as follows. First create the file ``battery_bluetooth.service`` in the folder ``/etc/systemd/system/`` as follows
<details>
<summary><code>battery_bluetooth.service</code> content</summary>
<p>

```
[Unit]
Description=Connect to the BCB board via bluetooth using rfcomm
After=bluetooth.service

[Service]
Type=oneshot
ExecStart=/bin/bash /home/icub/battery_bluetooth.sh

[Install]
WantedBy=multi-user.target
```
</p>

</details>

This service runs once the ``battery_bluetooth.sh`` script at startup after running the ``bluetooth`` service. The script is as follows, and needs to be saved in the ``/home/icub/`` folder. ⚠️ You need to change _RNBT_ADDRESS_ with the address you noted. 

<details>
<summary><code>battery_bluetooth.sh</code> content</summary>
<p>

```bash
#!/bin/bash

address=RNBT_ADDRESS

connected=0
i=0

echo Started

while (( connected == 0 && i < 10 ))
do
    echo Attempt $i
    rfcomm release 0 # Close eventual previous connections
    rfcomm -r connect 0 $address > /tmp/connect_out 2>&1 & #executes rfcomm in background to check that bluetooth is working
    sleep 5
    pid=$! #stores executed process id in pid
    count=$(ps -A| grep $pid |wc -l) #check whether process is still running
    if [[ $count -eq 0 ]] #if process is already terminated, then there were issues in connecting
    then
        cat /tmp/connect_out
        echo Connect failed
        if grep -q "No route to host" /tmp/connect_out; then # There are issues with the bluetooth
            echo "There might be a problem with the bluetooth. If it persists, try running sudo service bluetooth restart"
        fi
    else
        rfcomm release 0
        echo Released connection
        sleep 1
        cat /tmp/connect_out
        if grep -q "$address" /tmp/connect_out; then # If the connection was successfull, the address should be displayed in the output
            echo Connect successfull
            rfcomm bind 0 $address > /tmp/bind_out 2>&1
            cat /tmp/bind_out
            if [[ -s /tmp/bind_out ]]; then #if bind is successfull does not print anything
                echo  Bind returned error
            else
                echo Bind successfull
                sleep 1
                echo Calling stty
                stty -F /dev/rfcomm0 raw
                stty_return=$?
                if [[ $stty_return -eq 0 ]]
                then
                    echo stty successfull
                    connected=1
                else
                    echo stty failed
                fi
            fi
        else
            echo Connect failed
        fi
    fi
    i=$((i+1))
done

```
</p>

</details>

The scripts first tries to connect using ``rfcomm connect``. If it works (hence ``rfcomm connect`` is still alive), releases the connection. Then it tries running ``rfcomm bind`` and ``stty`` checking the outputs in case of errors. If there is any error, it tries again at most 10 times.

This service can be enabled at startup with 
```
sudo systemctl enable battery_bluetooth.service
```
and started with 
```
sudo systemctl enable battery_bluetooth.service
```
In case there were errors starting the service, it is possible to inspect the output of the script with 
```
systemctl status battery_bluetooth.service
```
This script can also be run after startup in case the connection is not working, with 
```
sudo bash ~/battery_bluetooth.sh
```

