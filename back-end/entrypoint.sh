#!/bin/bash

if [ -f /usr/src/app/tmp/pids/server.pid ]; 
then
    echo "Clearing pidfile..."
    echo "" > /usr/src/app/tmp/pids/server.pid
else
    echo "Creating pidfile..."
    mkdir -p /usr/src/app/tmp/pids
    touch /usr/src/app/tmp/pids/server.pid
fi

bundle exec rake db:setup

exec bundle exec "$@"
