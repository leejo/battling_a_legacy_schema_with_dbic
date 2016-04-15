#!/bin/bash

set -e -x -u

rm resorts_legacy.db
for file in $(ls -1 updates)
do
	echo $file
	# AUTO_INC in the file so we can use with mysqlworkbench
	sed 's/AUTO_INC/AUTOINC/g' updates/$file | sqlite3 resorts_legacy.db
done
