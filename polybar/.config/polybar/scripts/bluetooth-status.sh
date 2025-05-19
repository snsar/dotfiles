#!/bin/bash

# Check if bluetooth controller exists
if ! command -v bluetoothctl &> /dev/null; then
    echo "No BT"
    exit 0
fi

# Check if bluetooth is powered on
if bluetoothctl show | grep -q "Powered: yes"; then
    # Check if any devices are connected
    if bluetoothctl devices Connected | grep -q "Device"; then
        # Get the name of the connected device
        device_name=$(bluetoothctl devices Connected | head -n 1 | cut -d ' ' -f 3-)
        echo " $device_name"
    else
        echo " On"
    fi
else
    echo " Off"
fi
