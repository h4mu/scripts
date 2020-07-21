for i in 0 1 2 3
do sudo sh -c "echo performance > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor"
done
ulimit -m 4000000
GALLIUM_HUD="cpu0,cpu1,cpu2,cpu3;cpufreq-cur-cpu0,cpufreq-cur-cpu1,cpufreq-cur-cpu2,cpufreq-cur-cpu3;sensors_temp_cu-radeon-pci-0100.temp1,sensors_temp_cu-nct6776-isa-0290.CPUTIN;VRAM-usage,fps,primitives-generated" fgfs --launcher
killall -INT ffmpeg
