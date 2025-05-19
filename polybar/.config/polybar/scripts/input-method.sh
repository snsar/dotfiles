#!/bin/bash

# Get current input method
current_im=$(fcitx-remote)

if [ "$current_im" = "1" ]; then
    # Non-English input method is active
    echo " $(fcitx-remote -n)"
else
    # English input method is active
    echo " EN"
fi
