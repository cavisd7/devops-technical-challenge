#!/bin/bash

# Clear pid file if necessary or create pid file to avoid 'server.pid' file not found error
if [ -f /usr/src/app/tmp/pids/server.pid ]; 
then
    echo "Clearing pidfile..."
    echo "" > /usr/src/app/tmp/pids/server.pid
else
    echo "Creating pidfile..."
    mkdir -p /usr/src/app/tmp/pids
    touch /usr/src/app/tmp/pids/server.pid
fi

# Initialize and seed database
bundle exec rake db:setup

# Execute defualt instruction
exec bundle exec "$@"
