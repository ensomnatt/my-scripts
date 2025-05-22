#!/bin/bash

for file in *.mkv; do
    if [ -f "$file" ]; then
        ffmpeg -i "$file" -c copy "${file%.mkv}.mp4"
    fi
done
