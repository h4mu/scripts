ulimit -m 4000000
#ffmpeg -s 1920x1080 -f x11grab -thread_queue_size 1024 -framerate 30 -i :0.0 -f alsa -ac 2 -thread_queue_size 512 -i pulse -vcodec libx264 -preset ultrafast -tune animation -profile:v main -b:v 5M -minrate:v 5M -maxrate:v 5M -bufsize:v 5M -pix_fmt yuv420p -bf:v 3 -threads 1 -y output.mp4

ffmpeg -loglevel quiet -s 1920x1080 -f x11grab -thread_queue_size 1024 -framerate 30 -i :0.0 -f alsa -ac 2 -thread_queue_size 512 -f pulse -ac 2 -i 1 -vcodec libx264 -preset ultrafast -tune animation -profile:v main -b:v 5M -minrate:v 5M -maxrate:v 5M -bufsize:v 5M -pix_fmt yuv420p -bf:v 3 -threads 1 -f flv rtmp://live-prg.twitch.tv/app/$token
