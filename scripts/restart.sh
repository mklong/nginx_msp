#!/bin/bash

 /usr/local/webservices/nginx//sbin/nginx -t

 kill -USR2 `cat /usr/local/webservices/nginx//logs/nginx.pid`
 sleep 1
 test -f /usr/local/webservices/nginx//logs/nginx.pid.oldbin

kill -QUIT `cat /usr/local/webservices/nginx//logs/nginx.pid.oldbin`
