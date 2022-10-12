#!/bin/bash

ttyPort=$1
firmwareFile=$2

[ -z "$ttyPort" ] && ttyPort=/dev/ttyACM0

source ~/.virtualenvs/esptool/bin/activate

echo "Deleting flash..."

esptool.py --chip esp32 --port $ttyPort erase_flash

echo "Flash deleted..."

echo "Programing the firmware..."

esptool.py --chip esp32 --port $ttyPort --baud 460800 write_flash -z 0x1000 $firmwareFile

echo "Firmware was succesfully programmed!..."
