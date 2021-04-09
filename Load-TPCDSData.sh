#!/bin/bash

#-------------------------------------------------------------------------------

# Copyright 2015 Actian Corporation

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------

set -e

SOURCE_DIR="tools"
SQL_DIR="../.insert"
LOAD_DIR="../load_templates"
LOG_DIR="../.logs/insert"
LOG_FILE=${LOG_DIR}/TPC_DS_Summary_InsertResults.txt

echo ""
echo "Step 0 - Clean-up"
echo ""

cd $SOURCE_DIR

echo "TPC DS Style SQL Insertion Results" >${LOG_FILE}
echo "-----------------------------------------" >>${LOG_FILE}
echo "" >>${LOG_FILE}
echo "Run time in seconds" >>${LOG_FILE}
echo "" >>${LOG_FILE}

for sql_file in $(ls ${PWD}/${SQL_DIR}/*.sql); do

    # Extract the SQL name and no. for the Summary print
    sql_name=$(echo ${sql_file} | awk -F 'dml/' '{print $2}' | awk -F '.' '{print $1}')

    echo "Loading table ${sql_name}."

    # Note time at start of run
    Start_Time="$(date +%s%N)"

    # Run the SQL
    sql_to_run=$(
        cat ${sql_file}
        echo "\g"
    )

    sqlcmd -S ${SERVER_URL} -d ${DATABASE} -U ${USER} -P ${PASSWORD} -I >${LOG_DIR}/TPC_DS_${sql_name}_InsertResults.out <<EOF
${sql_to_run}
EOF

    # Time at end of run and hence calculate duration
    Run_Time="$(($(date +%s%N) - ${Start_Time}))"

    # Log the results - run time or FAILED
    if [ $(grep "^E_US" ${LOG_DIR}/TPC_DS_${sql_name}_Results.out | wc -l) -gt 0 ]; then
        printf "${sql_name} : FAILED\n" >>${LOG_FILE}
    else
        printf "${sql_name} : %5.2f\n" $(bc <<<"scale = 2; (${Run_Time} / 1000000000)") >>${LOG_FILE}
    fi

done

#------------------------------------------------------------------------------#
#---------------------------- End of Shell Script -----------------------------#
#------------------------------------------------------------------------------#
