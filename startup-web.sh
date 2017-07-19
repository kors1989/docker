#!/bin/bash

# Start php-fpm
/etc/init.d/php-fpm.sh start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start php-fpm: $status"
  exit $status
fi

# Start nginx
/etc/init.d/nginx.sh start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi
