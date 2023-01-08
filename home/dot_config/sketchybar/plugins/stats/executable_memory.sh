#!/bin/bash

mem=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')
sketchybar -m                 \
    --set stats_mem_percent   \
        label="${mem}%"
