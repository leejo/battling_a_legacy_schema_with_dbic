rm resorts_legacy.db
for file in $(ls -1 updates)
do
	echo $file
	sqlite3 resorts_legacy.db < updates/$file
done
