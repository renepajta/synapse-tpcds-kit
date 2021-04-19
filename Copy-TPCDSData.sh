#!/bin/bash

# Environment variables
# - SYNAPSE_USER
# - SYNAPSE_USER_PWD

# nohup ./COPY-TPCDSData.sh [SYNAPSE_URL] [DATABASE] [DATA_URL] >status.out 2> status.err < /dev/null &

SYNAPSE_URL=$1
DATABASE=$2
DATA_URL=$3


LOG_DIR=".logs/insert"

for table in $(cat build_data_for_tables.txt); do
    echo "Loading table ${table}."

    # Note time at start of run
    Start_Time="$(date +%s%N)"

    # Run the SQL
    sql_to_run=$(
        cat dml/${table}.sql | sed "s,DATA_URL,${DATA_URL},g"
        echo "GO"
    )

    sqlcmd -S ${SYNAPSE_URL} -d ${DATABASE} -U ${SYNAPSE_USER} -P ${SYNAPSE_USER_PWD} -I >${LOG_DIR}/TPC_DS_${table}_InsertResults.out <<EOF
${sql_to_run}
EOF

done