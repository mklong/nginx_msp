#!/bin/bash
#This script run at 00:00
#The Nginx logs path
logs_path="/usr/local/webservices/nginx/logs/"
mkdir -p ${logs_path}$(date -d "yesterday" +"%Y")/$(date -d "yesterday" +"%m")/
mv ${logs_path}error.log ${logs_path}$(date -d "yesterday" +"%Y")/$(date -d "yesterday" +"%m")/error_$(date -d "yesterday" +"%Y%m%d").log
#kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`
cd /usr/local/webservices/nginx/sbin/
./nginx -s reopen
