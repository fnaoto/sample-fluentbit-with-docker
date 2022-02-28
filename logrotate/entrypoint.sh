#!/bin/bash

set -Eeuo pipefail

trap catch_sigterm SIGTERM

function catch_sigterm() {
  echo "[DEBUG] start: catch_sigterm"
  logrotate -v -f /etc/logrotate.conf
  echo "[DEBUG] stop: catch_sigterm"
}

function printenv_export() {
  printenv | grep -v "no_proxy" >> /etc/environment
}

function start_crond() {
  crond -s -x proc &
  child_pid=$!
  wait ${child_pid}
}

# loop until catch sigkill

printenv_export
start_crond
