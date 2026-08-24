#!/bin/bash
if xrandr | grep -q "^HDMI1 connected"; then
    xrandr --output HDMI1 --primary --mode 2560x1440 --pos 0x0 --output eDP1 --mode 1920x1080 --pos 2560x360
else
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --output HDMI1 --off
fi

# use 'xrandr' to check the display name
