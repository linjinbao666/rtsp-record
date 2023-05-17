#!/bin/bash

rtsp_url="rtsp://admin:369369@192.168.1.2:554/live/main"

ffmpeg -hide_banner -y -loglevel info -rtsp_transport tcp -use_wallclock_as_timestamps 1 -i "${rtsp_url}" -vcodec copy -acodec copy -f segment -reset_timestamps 1 -segment_time 3600 -segment_format mp4 -segment_atclocktime 1 -strftime 1 -crf 25 /mnt/dd/media/live/stream/%Y%m%dT%H%M%S.mp4

