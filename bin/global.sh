#!/bin/bash

current_dir="$(dirname "$0")"


	# functions

function output {
  echo "[$(basename $0) / $(date +'%c')] $1"
}


	# constants

setup_dir="$current_dir/.."
bigbench_dir="$setup_dir/Big-Bench"
parsebigbench_dir="$setup_dir/parse-big-bench"
log_path="$bigbench_dir/logs"

bigbench_db="bigbenchorc"


	# settings

queries=(6 7 9 11 12 13 14 15 17 21 22 23 24)
engines=("hive" "spark")