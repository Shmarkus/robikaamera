#!/bin/bash
for i in {1..5}
do
ffmpeg -y -f v4l2 -video_size 1600x1200 -i /dev/video0 -vframes 1 /var/www/html/00000005.png
sleep 10
done