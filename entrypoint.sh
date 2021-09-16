#!/bin/bash

PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

aws ssm get-parameter --name /admu/alls/rclone.conf --query Parameter.Value --with-decryption --output text > rclone.conf
