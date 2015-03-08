#!/bin/bash

  # include global config
current_dir="$(dirname "$0")"
source "$current_dir/global.sh"


csv_file="$log_path/BigBenchTimes.csv"
java -jar $parsebigbench_dir/target/parse-big-bench-1.0.0-SNAPSHOT-jar-with-dependencies.jar --logPath $log_path --queryTimes $csv_file
output "Generated $csv_file"
