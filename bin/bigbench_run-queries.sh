#!/bin/bash

  # include global config
current_dir="$(dirname "$0")"
source "$current_dir/global.sh"


output "Starting..."
output "Configured engines: $(echo ${engines[@]})"
output "Configured queries: $(echo ${queries[@]})"

$bigbench_dir/bin/bigBench cleanLogs -U

for engine in "${engines[@]}"
do

  for query in "${queries[@]}"
  do
    output "Executing query '$query' (Engine: '$engine')..."

    $bigbench_dir/bin/bigBench runQuery -e $engine -q $query -m 8 -U

  done

done

output "Finished."
