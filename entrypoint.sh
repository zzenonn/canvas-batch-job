#!/bin/bash

PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

mkdir -p /root/.config/rclone/

aws ssm get-parameter --name /admu/alls/rclone.conf --query Parameter.Value --with-decryption --output text > /root/.config/rclone/rclone.conf

/canvas-data-collector/run.sh

#rclone copy /root/.config/rclone/rclone.conf admu-gdrive:
