xrandr -q | grep VGA | grep " connected "
if [ $? -eq 0 ]
then
    # External monitor is connected
    xrandr --output LVDS --mode 1280x800 --pos 0x224 --primary --output VGA-0 --mode 1280x1024 --noprimary --pos 1280x0
    if [ $? -ne 0 ]
    then
        # Something went wrong. Autoconfigure the internal monitor and disable the external one
        xrandr --output LVDS --mode auto --output VGA-0 --off
    fi                                                                                                                                                                              
else                                                                                                                                                                                
    # External monitor is not connected                                                                                                                                             
    xrandr --output LVDS --mode 1280x800 --primary --output VGA-0 --off                                                                                                             
fi
