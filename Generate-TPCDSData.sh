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

# This script generates data for the tables listed in 'build_data_for_tables.txt'
# using a specified no. of threads to increase throughput.

# Parameters
#     $1 - Scale Factor - The size of the data to be generated in Gigabytes
#          e.g. 1 = 1Gb
#     $2 - Temporary directory - The generated data will be stored here before
#          uploaded to ADLS Gen 2
#     $3 - ADLS Gen 2 Container name
#     $4 - ADLS Gen 2 directory - Location where data will be uploaded in
#          storage account
#     $5 - Number of files generated per table

#-------------------------------------------------------------------------------

set -e

SCALE_FACTOR=$1
TMP_DIR=$2
CONTAINER_NAME=$3
DATA_DIR=$4
PARALLEL=$5

cd tools

for table in $(cat ../build_data_for_tables.txt); do

    table_name=$(echo ${table} | awk -F '|' '{print $1}')

    for ((CHILD = 1; CHILD <= $PARALLEL; CHILD++)); do

        ./dsdgen -table ${table_name} -scale ${SCALE_FACTOR} -dir ${TMP_DIR} -parallel ${PARALLEL} -CHILD ${CHILD} -rngseed 100 -terminate n -force
        # ./dsdgen -table ${table_name} -scale ${SCALE_FACTOR} -dir ${TMP_DIR} -terminate n -force

        # Move each file produced to ADLS Gen2
        #   - Leave any 'customer' files as they need a character set fix and can't do it in HDFS.
        #     These files will be fixed and moved to ADLS later.

        if [ -f ${TMP_DIR}/${table_name}_${CHILD}_${PARALLEL}.dat ]; then

            az storage blob upload --account-name ${ACCOUNT_NAME} --account-key ${ACCOUNT_KEY} -f ${TMP_DIR}/${table_name}_${CHILD}_${PARALLEL}.dat -c ${CONTAINER_NAME} -n ${DATA_DIR}/${table_name}/${CHILD}_${PARALLEL}.dat
            rm -f ${TMP_DIR}/${table_name}_${CHILD}_${PARALLEL}.dat

            # dsdgen is not called explictly to create returns. These are created alongside
            # the sales. Hence, unavoidable hard coding here to copy to HDFS.
            # This relates to catalog_returns, store_returns and web_returns.

            if [ "${table_name}" == "catalog_sales" -o "${table_name}" == "store_sales" -o "${table_name}" == "web_sales" ]; then

                table_name_ret=$(echo ${table_name} | sed 's/sales/returns/')
                az storage blob upload --account-name ${ACCOUNT_NAME} --account-key ${ACCOUNT_KEY} -f ${TMP_DIR}/${table_name_ret}_${CHILD}_${PARALLEL}.dat -c ${CONTAINER_NAME} -n ${DATA_DIR}/${table_name_ret}/${CHILD}_${PARALLEL}.dat
                rm -f ${TMP_DIR}/${table_name_ret}_${CHILD}_${PARALLEL}.dat

            fi
        fi

        echo "COMPLETE: ${table_name}: ${CHILD} out of ${PARALLEL}"

    done

    echo "COMPLETE: ${table_name}"

done

# echo "COMPLETE: dsdgen parallel ${PARALLEL} child ${CHILD} scale ${SCALE_FACTOR}"
echo "COMPLETE: dsdgen scale ${SCALE_FACTOR} parallel ${PARALLEL}"
#------------------------------------------------------------------------------#
#---------------------------- End of Shell Script -----------------------------#
#------------------------------------------------------------------------------#
