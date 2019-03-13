xrandr -q | grep HDMI | grep " connected "
if [ $? -eq 0 ]
then
    # External monitor is connected
    xrandr --output HDMI-0 --mode 1360x768 --primary --output LVDS-0 --off
    pacmd set-card-profile 0 output:hdmi-stereo
    if [ $? -ne 0 ]
    then
        # Something went wrong. Autoconfigure the internal monitor and disable the external one
        xrandr --output LVDS-0 --mode auto --output HDMI-0 --off
	pacmd set-card-profile 0 output:analog-stereo
    fi
else
    xrandr --output LVDS-0 --mode auto --output HDMI-0 --off
    pacmd set-card-profile 0 output:analog-stereo
fi
