#!/bin/sh

modprobe v4l2loopback exclusive_caps=1 max_buffers=2 video_nr=7 card_label="DslrCam"

gphoto2 --stdout --capture-movie --wait-event | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video7
