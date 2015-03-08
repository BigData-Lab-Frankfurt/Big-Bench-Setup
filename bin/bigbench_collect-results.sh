#!/bin/bash

  # include global config
current_dir="$(dirname "$0")"
source "$current_dir/global.sh"


results_file="$log_path/bigbench-results_$(date +'%Y-%m-%d_%H-%M-%S').csv"
touch $results_file

output "Scanning for result tables in database '$bigbench_db'..."
tables=$(hive -e "SHOW TABLES;" -S --database $bigbench_db | grep "^q.*_result")
readarray -t tables_array <<<"$tables"
output "Found tables: $(echo $tables)"

echo "table,row count,sample row" >> $results_file

query=""
for table in "${tables_array[@]}"
do
  output "Process table '$table'..."
  query="SELECT COUNT(*) FROM $table; SELECT * FROM $table LIMIT 1;"

    # Filter deprecation messages
  results=$(hive -e "$query" -S --database $bigbench_db | grep -Ev "WARN.*DEPRECATED")
  readarray -t results_array <<<"$results"
  echo $(printf "\n$table,${results_array[0]},${results_array[1]}") >> $results_file

  output "...done."
done

output "Finished. Wrote results to file '$results_file'."
