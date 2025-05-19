#!/bin/bash

# Pulseaudio control script for Polybar
# Allows volume control, sink switching, and mute toggling

# Default step size for volume control
VOLUME_STEP=5

# Get the active sink
get_active_sink() {
    pactl info | grep 'Default Sink' | cut -d: -f2 | xargs
}

# Get the volume of the active sink
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1 | tr -d '%'
}

# Check if the active sink is muted
is_muted() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes" && echo "yes" || echo "no"
}

# Display current volume and sink name
display_volume() {
    active_sink=$(get_active_sink)
    volume=$(get_volume)
    muted=$(is_muted)

    if [ "$muted" = "yes" ]; then
        echo " Muted"
    else
        if [ "$volume" -ge 0 ] && [ "$volume" -lt 30 ]; then
            echo " $volume%"
        elif [ "$volume" -ge 30 ] && [ "$volume" -lt 70 ]; then
            echo " $volume%"
        else
            echo " $volume%"
        fi
    fi
}

# Increase volume
volume_up() {
    pactl set-sink-volume @DEFAULT_SINK@ +${VOLUME_STEP}%
}

# Decrease volume
volume_down() {
    pactl set-sink-volume @DEFAULT_SINK@ -${VOLUME_STEP}%
}

# Toggle mute
toggle_mute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
}

# Switch to the next sink
next_sink() {
    # Get all sinks
    sinks=$(pactl list short sinks | cut -f1)

    # Get the current default sink
    current_sink=$(pactl info | grep 'Default Sink' | cut -d: -f2 | xargs)
    current_index=$(pactl list short sinks | grep "$current_sink" | cut -f1)

    # Find the next sink
    next_index=""
    found=0

    for sink in $sinks; do
        if [ $found -eq 1 ]; then
            next_index=$sink
            break
        fi

        if [ "$sink" = "$current_index" ]; then
            found=1
        fi
    done

    # If we didn't find a next sink, use the first one
    if [ -z "$next_index" ]; then
        next_index=$(echo "$sinks" | head -1)
    fi

    # Set the default sink to the next sink
    pactl set-default-sink $next_index

    # Move all current input streams to the new sink
    for app in $(pactl list short sink-inputs | cut -f1); do
        pactl move-sink-input $app $next_index
    done

    # Get the name of the new sink for notification
    sink_name=$(pactl list sinks | grep -A 1 "Sink #$next_index" | grep "Name:" | cut -d: -f2 | xargs)
    notify-send "Audio" "Switched to $sink_name"
}

# Main function
case "$1" in
    --volume-up)
        volume_up
        ;;
    --volume-down)
        volume_down
        ;;
    --toggle-mute)
        toggle_mute
        ;;
    --next-sink)
        next_sink
        ;;
    *)
        display_volume
        ;;
esac
