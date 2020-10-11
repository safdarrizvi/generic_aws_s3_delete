#!/bin/bash

################################################################################################################
#Script Name         : generic_aws_s3_delete.sh
#Created on          : 11th Oct 2020
#Author(s)           : Syed Safdar Abbas Rizvi
#Purpose             : Script to delete the folder from S3 for particular Bucket Name, Folder Name and Date
#Change Log          :
################################################################################################################

bucket_name=$1
echo "Bucket Name is ${bucket_name}"
folder=$2
echo "Folder Name is ${folder}"
date=$3
echo "Date is ${date}"

echo "Checking all 3 parameters"
if [[ $# -ne 3 ]]
then
        echo "Script cannot be executed without input arg : Bucket, Table and Date"
        echo "Aborting as Exit 1"
        exit 1
fi

echo "All parameters are available"

echo "Starting the deletion process"

export raw_responce=$(aws s3 rm s3://${bucket_name}/${folder}/${date}  --recursive)

echo "Deletion of data for bucket ${bucket_name} and folder ${folder} is completed for date ${date}"
