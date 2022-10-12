#!/bin/bash
tty_port=$1
firmware_file=$2
absolute_path_to_esptool_virtualenv=$3


if [ -z "$tty_port" ]; then
	tty_port=/dev/ttyACM0
fi

if [ -z "$firmware_file" ]; then
	echo "You must pass the firmware file path"
	exit

fi

if [ -z "$absolute_path_to_esptool_virtualenv" ]; then
	echo "You must pass the path to the virtualenv root: example /home/example_user/.virtualenvs/test_env"

else
        source $absolute_path_to_esptool_virtualenv/bin/activate
        esptool.py --chip esp32 --port $ttyPort erase_flash
        esptool.py --chip esp32 --port $ttyPort --baud 460800 write_flash -z 0x1000 $firmwareFile

fi
