#!/usr/bin/env bash

wal -i $1 -n -s --cols16
matugen image $1
walogram -B
