#!/bin/bash

set -e

trap trap_sigterm SIGTERM

dummer -d -c ${DUMMER_CONFIG_PATH?}
eval "sleep 30 && dummer stop" &

function trap_sigterm() {
    logrotate /logrotate.conf
}

while true
do
    sleep 10
    logrotate /logrotate.conf
done
