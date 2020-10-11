#!/bin/bash

################################################################################################################
#Script Name         : generic_aws_s3_delete.sh
#Created on          : 11th Oct 2020
#Author(s)           : Syed Safdar Abbas Rizvi
#Purpose             : Script to delete the folder from S3 for particular ENV, Table and Date
#Dependent Scripts   : source.txt
#Change Log          :
################################################################################################################

source_env=$1
echo "Source Environment is ${source_env}"
table=$2
echo "Table Name is ${table}"
date=$3
echo "Date is ${date}"

echo "Checking all 3 parameters"
if [[ $# -ne 3 ]]
then
        echo "Script cannot be executed without input arg : Environment, Table and Date"
        echo "Aborting as Exit 1"
        exit 1
fi

echo "All parameters are available"

echo "Fetching the folder of the table $table"

export folder=$(cat ${PWD}/source.txt | grep -w ${table} | awk -F':' '{print $2}')

echo "Folder for table $table is $folder"

echo "Starting the deletion process"

export raw_responce=$(aws s3 rm s3://bb-raw-zone-$source_env/${folder}/inbound/${table}/${date}  --recursive)

echo "Deletion of data for ${table} is completed for date ${date}"
