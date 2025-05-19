#!/bin/bash

# Check if bluetooth controller exists
if ! command -v bluetoothctl &> /dev/null; then
    notify-send "Bluetooth" "Bluetooth is not available"
    exit 0
fi

# Toggle bluetooth power
if bluetoothctl show | grep -q "Powered: yes"; then
    bluetoothctl power off
    notify-send "Bluetooth" "Bluetooth turned off"
else
    bluetoothctl power on
    notify-send "Bluetooth" "Bluetooth turned on"
fi
