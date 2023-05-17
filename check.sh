#!/bin/bash
set -x
basedir="/mnt/dd/media/live/stream"
echo "basedir is ${basedir}"

yesterday=$(date -d "1 day ago" +"%Y%m%d")
echo "begin check videos in ${yesterday}"

mkdir -p "${basedir}/${yesterday}"

videos=$(find ${basedir} -maxdepth 1 -type f -name "${yesterday}T*.mp4")


for video in ${videos}
  do
    mv -v ${video} "${basedir}/${yesterday}/"
done

rclone mkdir "vvr48:/media/${yesterday}"

rclone moveto -P -v "${basedir}/${yesterday}" "vvr48:/media/"

echo "check videos in ${yesterday} done!"

folder="${basedir}/${yesterday}"

file_count=$(find "$folder" -type f | wc -l)

if [ "$file_count" -eq 0 ]; then
    rm -r $folder
else
    echo "文件夹不为空"
fi
