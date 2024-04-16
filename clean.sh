#!/bin/bash

set -x 
find /mnt/mmcblk0p1/live -mmin +1080 -name "*.flv" -exec rm -rf {} \;
