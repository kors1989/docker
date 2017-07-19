#!/bin/bash

# Start nginx
/etc/init.d/nginx.sh start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi
