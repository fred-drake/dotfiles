#!/bin/bash

data=$(vm_stat)

free=$(grep "Pages free" <<< "$data" | grep -Eo '\d+')
active=$(grep "Pages active" <<< "$data" | grep -Eo '\d+')
inactive=$(grep "Pages inactive" <<< "$data" | grep -Eo '\d+')
speculative=$(grep "Pages speculative" <<< "$data" | grep -Eo '\d+')
throttled=$(grep "Pages throttled" <<< "$data" | grep -Eo '\d+')
wired=$(grep "Pages wired down" <<< "$data" | grep -Eo '\d+')
compressor=$(grep "Pages occupied by compressor" <<< "$data" | grep -Eo '\d+')
purgeable=$(grep "Pages purgeable" <<< "$data" | grep -Eo '\d+')

total=$[${free} + ${active} + ${inactive} + $speculative + $throttled + $wired + $compressor]
total_free=$[${free} + ${inactive} + ${purgeable}]

pct_val=$(echo "(1 - ($total_free / $total)) * 100" | bc -l)
pct_val=$(echo "$pct_val / 1" | bc)  # Strip decimal

sketchybar -m                 \
    --set stats_mem_percent   \
        label="${pct_val}%"
