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

${BIG_BENCH_HOME}/bin/bigBench cleanAll -U
${BIG_BENCH_HOME}/bin/bigBench dataGen -m 8 -f $scale_factor -U
${BIG_BENCH_HOME}/bin/bigBench populateMetastore -U

output "Done."
