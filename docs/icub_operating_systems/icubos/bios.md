# Introduction

Some tweaks to the bios are necessary to setup the icub-head board (*Kontron COMe-cKL6*).
They are directly realted to icubOS installation and it's necessary to perform the tweaks below only once, regadless if the operating systems is reinstalled.

## How to access BIOS

In Order to modify BIOS parameters it is ncessary to connect a monitor (with _Display Port_ connector) and an USB keyboard to the icub-head board.
Then, power on the board and press a key (it is different on each model of the icub-head board, usually F2 or DEL) to enter BIOS settings.

## How to set the max power (TDP) of the processor

Set the TDP to 10000 (10w). See page 65 of the user manual of the board for more details https://www.kontron.com/downloads/manuals/c/come-ckl6_user-guide_rev-1.5_2020-07-23.pdf?product=146491


## USB Legacy support

On boot tab, please disable the `USB legacy support` (where available).

## Save Settings!

Before leaving the BIOS and rebooting, please remember to save your update setting with the option `SAVE SETTINGS AND EXIT`.
