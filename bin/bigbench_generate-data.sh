#!/bin/bash

  # include global config
current_dir="$(dirname "$0")"
source "$current_dir/global.sh"


scale_factor="$1"

re='^[0-9]+$'
if ! [[ $scale_factor =~ $re ]] ; then
   echo "No valid scale factor passed to script." >&2; exit 1
fi


output "Generate and load data..."
output "Scale factor: $scale_factor"

$bigbench_dir/bin/bigBench runBenchmark -m 4 -f $scale_factor -s 2 -3 -4 -5 -6 -7

output "Done."