#!/bin/bash

basedir="/mnt/dd/media/live/stream"
echo "basedir is ${basedir}"

yesterday=$(date -d "1 day ago" +"%Y%m%d")
echo "begin sync videos in ${yesterday}"

mkdir -p "${basedir}/${yesterday}"

videos=$(find ${basedir} -maxdepth 1 -type f -name "${yesterday}T*.mp4")


for video in ${videos}
  do
    mv -v ${video} "${basedir}/${yesterday}/"
done

#rclone moveto -v "${basedir}/${yesterday}" "vvr48:/media/"

aliyunpan sync start --ldir "${basedir}/${yesterday}" -pdir "/media/record/${yesterday}" -mode "upload"

echo "sync videos in ${yesterday} done!"

rm -rf "${basedir}/${yesterday}"
