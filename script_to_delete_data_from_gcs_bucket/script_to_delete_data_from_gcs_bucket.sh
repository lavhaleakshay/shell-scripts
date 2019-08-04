#!/bin/bash

#script to delete the data from gcs bucket every after 2 days automatically

gsutil ls gs://${gcs_bucket}/${ENVIRONMENT}/ > /cleanup-bucket/current_time.txt

cut -d "/" -f 5 current_time.txt > /cleanup-bucket/check.txt

file="/cleanup-bucket/check.txt"

cut -d "/" -f 7 current_time.txt > /cleanup-buckets/check.txt

file="/cleanup-buckets/check.txt"

#for f in `find . -name "check.txt" -type d -regex '.*-.*-.*(?=_)' -printf "%f\n"`
while read -r line
do
	f2=$(echo $line | grep -P '.*-.*-.*(?=_)' -o)
	days=$(((`date "+%s"` - `date -d "${f2}" "+%s"`)/86400))

	if [ $days -gt 2 ]; then
	gsutil rm -r gs://${gcs_bucket}/${ENVIRONMENT}/$f2_*
	fi
done < "$file"
