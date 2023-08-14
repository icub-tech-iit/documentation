# FirmwareUpdater Documentation
With the `FirmwareUpdater` application it is possible to perform GUI-based FW update on both CAN- and ETH-based robots; the commonly used functionalities are:

- Upload `application` firmware both on `ETH` boards and `CAN` boards
- Change the `IP addrress` for ethernet based boards
- Change the `CAN ID` for the CAN based boards
- Update the `eLoader` (advanced option)
- Update the `eUpdater` (advanced option)
- Change `bootstrap` mode
- Access to the `F/T` sensors calibration data of the `STTRAIN`/`STRAIN2`/`STRAIN2C`
  
**TBD inserire img di FU con drivers**


To launch `FirmwareUpdater` GUI just open a terminal and type :

```sh
FrimwareUpdater
```

!!!info
    In order to have all possible drivers that `FirmwareUpdater` can use to communicate with the boards, make sure you have the [firmwareupdater.ini](https://github.com/robotology/icub-main/blob/master/src/tools/FirmwareUpdater/firmwareupdater.ini) file in the place where you launch the GUI 

## GUI interface
Here are described the main basic and advanced operations that the `FirmwareUpdater` GUI allows you to do.


### Operations on ETH boards
Here are the main operations on the ETH based boards.

#### Discover
This allow you to discover all `ETH` boards in the current `IP subnet` (titpically `10.0.1.X)

- In a terminal type `FirmwareUpdater`

- It opens the GUI, select the `ETH` driver in the devices list and click `Discover`
If any ETH boards are availabe they'll be listed prompting board info.
Detailed processesinfo of each board are available in the `Board Properties` box clicking on the board.

**TBD inserire img di discover+board properties**

#### Force ETH Maintenance
This allow you tu force the board in maintenance mode and do operations such as upload FW, change IP, change bootstrap mode etc..

- In a terminal type `FirmwareUpdater -a` (or `FirmwareUpdater --admin`)
- Select the `ETH` driver in the devices list
- Select the board by selecting its checkbox
- Click on `Force ETH Maintenance`

You should see the board running in the `eUpdater` process and related version.

**TBD inserire img maintenance**

#### Force ETH Application
This allow you tu force the board in application mode.

- In a terminal type `FirmwareUpdater -a` (or `FirmwareUpdater --admin`)
- Select the `ETH` driver in the devices list
- Select the board by selecting its checkbox
- Click on `Force ETH Application`

You should see the board running in the `eApplication` process and related version.

**TBD inserire img application**

#### Upload Application
This allow you to upload a new application binary onto the board uP.

- In a terminal type `FirmwareUpdater -a` (or `FirmwareUpdater --admin`)
- Select the `ETH` driver in the devices list
- Select the board by selecting its checkbox
- Click on `Force ETH Maintenance`
- Click on `Upload Application` and browse to the correct binary application file (official FW binaries are located at https://github.com/robotology/icub-firmware-build)

**TBD inserire img per upload**

#### Change board IP address
This allow you to change the IP address of the board.

- In a terminal type `FirmwareUpdater -a` (or `FirmwareUpdater --admin`)
- Select the `ETH` driver in the devices list
- Select the board by selecting its checkbox
- Click on `Force ETH Maintenance`
- Click on `Change IP Address` and insert the wanted new IP address in the dialog box.

**TBD inserire img per change IP**

!!!warning
    Pay attention to give to the board a proper IP address in the domain of the configured IP subnet (i.e. 10.0.1.X)
    Otherwise you'll be not able to discover it any more since you re-flash the board using a debugger, see :

    - https://icub-tech-iit.github.io/procedures/tp-boards-programming/


## Command Line Interface (CLI)
`FirmwareUpdater` provides a CLI with a set of options to do operations via the command line.

By running `FirmwareUpdater -h`, you'll be prompted with the list of all available options: 

<img src ="../img/cli-options.png" height = 480px>

### CLI options to change CAN ID and IP address
Here's below a summary of the CLI functionalities: 

- CAN board ID via `SOCKETCAN` device
- CAN board ID via `ETH` device  
- IP address of an ETH board

### Change CAN ID via SOCKETCAN
In this example, we change the `CAN ID` on an `mtb` board connected via `SOCKETCAN` from 1 to 2.
The syntax of the command is the following : 
```bash
FirmwareUpdater -g -e SOCKETCAN -i 0 -c 0 -n 1 -k 2
```
where : 
- `-g -e SOCKETCAN -i 0 -c 0` is required to use a `SOCKETCAN` device (i.e. `ESD CAN/USB`) with `ID=0` and `canline=0`
- `-n 1 -k 2` changes old id 1 (-n 1) to 2 (-k 2)

<img src ="../img/canId-socketcan.gif" height = 480px>


### Change CAN ID via ETH
In this example, we change the `CAN ID` on an `mtb` board connected via `ETH ` through an `ems4` board w/ `IP address = 10.0.1.1` from 1 to 2.
The syntax of the command is the following : 
```bash
FirmwareUpdater -g -e ETH -i eth1 -t 10.0.1.1 -c 1 -n 1 -k 2
```
where : 
- `-g -e ETH -i eth1 -t 10.0.1.1 -c 1` is required to use a `ETH` device (i.e. `ems4`) with `ip address = 10.0.1.1` and `canline=1`
- `-n 1 -k 2` changes old id 1 (-n 1) to 2 (-k 2)

<img src ="../img/canId-eth.gif" height = 480px>


### Change IP address of an ETH board
In this example, we change the `IP address on an `ems4` board from `10.0.1.1` to 110.0.1.21.
The syntax of the command is the following : 
```bash
 FirmwareUpdater -g -e ETH -i eth1 -t 10.0.1.1 -2 10.0.1.2
```
where : 
- ` -g -e ETH -i eth1` is required to use a `ETH` device (i.e. `ems4`) 
- `-t 10.0.1.1 -2 10.0.1.2` changes old i`IP address` 10.0.1.1 to 10.0.1.2

<img src ="../img/change-ip-address.gif" height = 480px>

## How to use ETH boards with a different IP subnet
We provide here the instructions to use ETH boards with a subnet different from the standard 10.0.1.X.

### Change IP to the board
Let's assume that the board we use has the `10.0.1.1` IP and that we aim to switch to `10.0.2.1`. You ought to follow these steps:

1. Run `FirmwareUpdater -a` 
2. Select the eth interface and then `Discover`
3. Select the board and then ` Force ETH Maintenance`
4. Select `Upload Application` and flash the new firmware (`icub-firmware-build` on branch `devel`)
4. Select `Change IP Address` and input `10.0.2.1`
 
### Configure the system
1. Change the IP address of your ETH interface to `10.0.2.104`
2. Change the `firmwareupdater.ini` file including this line
```xml
ETH "10.0.2.104:3333"
```
3. Reset the board and check if it is discoverable with the `FirmwareUpdater`
4. Change the following `xml` files : 

**/hardware/electronics/pc104.xml**
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE params PUBLIC "-//YARP//DTD yarprobotinterface 3.0//EN" "http://www.yarp.it/DTD/yarprobotinterfaceV3.0.dtd">

<params xmlns:xi="http://www.w3.org/2001/XInclude" robot="single-ETH-2FOC-motor" build="1">

    <group name="PC104">
        <param name="PC104IpAddress">           10.0.2.104      </param>
        <param name="PC104IpPort">              12345           </param>
        <param name="PC104TXrate">              1               </param> 
        <param name="PC104RXrate">              5               </param>
    </group>

</params>
```

**hardware/electronics/knee-eb10-j0-eln.xml**
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE params PUBLIC "-//YARP//DTD yarprobotinterface 3.0//EN" "http://www.yarp.it/DTD/yarprobotinterfaceV3.0.dtd">

<params xmlns:xi="http://www.w3.org/2001/XInclude" robot="single-ETH-2FOC-motor" build="1">

    <xi:include href="./pc104.xml" />
    
    <group name="ETH_BOARD">
   
        <group name="ETH_BOARD_PROPERTIES">
            <param name="IpAddress">                10.0.2.1              </param>
            <param name="IpPort">                   12345                   </param>
            <param name="Type">                     mc4plus                    </param>
            <param name="maxSizeRXpacket">          768                     </param>
            <param name="maxSizeROP">               384                     </param>
        </group>

        <group name="ETH_BOARD_SETTINGS">
            <param name="Name">                     "knee-eb10-j0"    </param> 
            <group name="RUNNINGMODE">
                <param name="period">                   1000                </param>
                <param name="maxTimeOfRXactivity">      400                 </param>
                <param name="maxTimeOfDOactivity">      300                 </param>   
                <param name="maxTimeOfTXactivity">      300                 </param>                
                <param name="TXrateOfRegularROPs">      5                   </param> 
            </group>              
        </group>                 
        
        <group name="ETH_BOARD_ACTIONS">
            <group name="MONITOR_ITS_PRESENCE">
                <param name="enabled">                  true                </param> 
                <param name="timeout">                  0.020               </param> 
                <param name="periodOfMissingReport">    60.0                </param> 
            </group>
        </group>

    </group>  
    
</params>
```

### Run yarprobotinterace
Finally, if all the operations above came off, you're then able to run `yarprobotinterface` using the new subnet `10.0.2.X`.

### Test
The software has been compiled also on the Linux machine running `yarprobotinterface` and it works.

See below an example of `yarprobotinterface` running with a gateway set to `10.0.2.104` connected to an `ems4` board with address `10.0.2.1` and an `F/T` sensor (`strain2`) connected to it.


<img src ="../img/use-different-subnet.png" height = 340px>

## Strain2 dedicated CLI Options

The `CLI` options implemented for the strain2 (F/T sensors) are : 

-   `-z` or `--load-dat-file` : Loads the calibration .dat file into  STRAIN2 eeprom (pass the file.dat with -l or --file option)
```
example : FirmwareUpdater -g -e ETH -i eth1 -t 10.0.1.1 -c 1 -n 13 -z -l calibrationDataSN003.dat
```
-   `-w` or `--set-strain-sn <sn>` : Sets the passed serialNumber (i.e. SN001) on STRAIN2
```
example : FirmwareUpdater -g -e ETH -i eth1 -t 10.0.1.1 -c 1 -n 13 -w SN001
```
- `-j` or ``--set-strain-gains`` :  Sets on STRAIN2 default gains to (8,24,24,10,10,24) , adjust the offset and check if some channel saturates
```
example : FirmwareUpdater -g -e ETH -i eth1 -t 10.0.1.1 -c 1 -n 13 -j
```
- `-b` or `--get-canboard-version <saveFile>` :  Gets Bootloader or Application version (<saveFile> must be y or n to save or        not a file containing fw info)
```
example : FirmwareUpdater -g -e ETH -i eth1 -t 10.0.1.1 -c 1 -n 13 -b y
```
- `-u` or `--save-dat-file` : Saves the calibration .dat file from STRAIN2 EEPROM
```
example : FirmwareUpdater -g -e ETH -i eth1 -t 10.0.1.1 -c 1 -n 13 -u
```

!!!info
    **All the example are running on a setup with an `EMS4` board with `IP=10.0.1.1` and a `STRAIN2` board attached to it in the `CAN1` line with `ID=13`**


## Useful Resources
Below a list of useful links:
- Low-level [boards programming](https://icub-tech-iit.github.io/procedures/tp-boards-programming/) (using degugger/programmer)
- Firmware [sources](https://github.com/robotology/icub-firmware)
- Firmware [binaries](https://github.com/robotology/icub-firmware-build)
- `FirmwareUpdater` [sources](https://github.com/robotology/icub-main/tree/master/src/tools/FirmwareUpdater) 

