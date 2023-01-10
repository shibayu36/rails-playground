#!/bin/bash
set -e

# Remove pid file to prevent already runnning error
rm -f /app/tmp/pids/server.pid

# exec command passed from docker
exec "$@"
