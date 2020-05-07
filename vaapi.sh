#ffmpeg -vaapi_device /dev/dri/renderD128 -f x11grab -video_size 1920x1080 -i :0 -vf 'hwupload,scale_vaapi=format=nv12' -c:v h264_vaapi -qp 24 -y output.mp4
ffmpeg -vaapi_device /dev/dri/renderD128 -f x11grab -video_size 1920x1080 -thread_queue_size 1024 -framerate 30 -i :0.0 -f alsa -ac 2 -thread_queue_size 512 -i pulse -vf 'hwupload,scale_vaapi=format=nv12' -c:v h264_vaapi -qp 24 -y output.mp4
