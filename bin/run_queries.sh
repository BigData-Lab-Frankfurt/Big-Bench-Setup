#!/bin/bash

  # include global config
current_dir="$(dirname "$0")"
source "$current_dir/global.sh"


output "Starting..."
output "Configured engines: $(echo ${BIG_BENCH_DEFAULT_ENGINE})"
output "Configured queries: $(echo ${queries[@]})"

$bigbench_dir/bin/bigBench cleanLogs -U
hdfs dfs -mkdir hdfs://141.2.2.172/user/user1/benchmarks/bigbench/stats

for query in "${queries[@]}"
do
    output "Executing query '$query' (Engine: '$engine')..."

    $bigbench_dir/bin/bigBench runQuery -q $query -m 8 -U
done

DATE=$(date +"%F_%H-%M-%S")
SAVE_DIR=$log_path/${DATE}
mkdir $SAVE_DIR &&
cp $log_path/*.log $SAVE_DIR &&

output "Finished."

output "Generating BigBenchTimes.csv."
python3 $setup_dir/bin/parse_logs.py $SAVE_DIR

output "Done"
