#!/bin/bash

  # include global config
current_dir="$(dirname "$0")"
source "$current_dir/global.sh"


output "Clean up Big-Bench log directory..."
rm -rf $log_path/*

output "Clean up Big-Bench result tables..."
$bigbench_dir/bin/bigBench cleanQueries
$bigbench_dir/bin/bigBench cleanQueries -e spark

output "Done."