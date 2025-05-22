#!/bin/bash

wal -i $1 -n -s --cols16
matugen image $1
wal-telegram --wal -t black -g
