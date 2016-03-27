rm resorts.db
for file in $(ls -1 updates)
do
	echo $file
	sqlite3 resorts.db < updates/$file
done
