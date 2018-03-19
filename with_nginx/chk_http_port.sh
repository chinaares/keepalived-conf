#!/bin/sh
chk_http_port()
{
    </dev/tcp/127.0.0.1/80 > /dev/null
    if [ $? -eq 0 ]
    then
          return 0
    else
          return 1
    fi
 }

chk_http_port
