#!/bin/bash

swww img $@ --transition-type wipe --transition-duration 1 >/dev/null 2>&1
PID=$!
kill -SIGINT "$PID"
wal -i $@ -n --cols16
wal-telegram --wal
