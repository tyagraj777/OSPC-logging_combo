#Problem: Identifying relevant logs from a large dataset.
#Solution: Use grep and awk to filter OpenStack logs for errors.

#!/bin/bash
LOG_DIR="/var/log/nova"
OUTPUT_FILE="filtered_logs.txt"

# Filter logs for errors and save to a file
grep -i "ERROR" $LOG_DIR/*.log | awk '{print $1, $2, $3, $NF}' > $OUTPUT_FILE

# Summarize errors by type
awk '{print $NF}' $OUTPUT_FILE | sort | uniq -c
