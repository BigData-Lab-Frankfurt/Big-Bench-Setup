#!/bin/bash

current_dir="$(dirname "$0")"


	# functions

function output {
  echo "[$(basename $0) / $(date +'%c')] $1"
}


	# constants

setup_dir="$current_dir/.."
bigbench_dir="$setup_dir/Big-Data-Benchmark-for-Big-Bench/"
parsebigbench_dir="$setup_dir/parse-big-bench"
log_path="$bigbench_dir/logs"

bigbench_db="bigbenchorc"

export BIG_BENCH_HOME="/home/user1/Big-Bench-Setup/Big-Data-Benchmark-for-Big-Bench"

	# settings

#queries=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
queries=(15)

# If the default engine is not set, BigBench defaults to Hive.
#export BIG_BENCH_DEFAULT_ENGINE="hive"
#export BIG_BENCH_DEFAULT_ENGINE="spark"
