#!/bin/bash

set -e -x -u

folder=$1
db_path=$2
overwrite=$3

dbicdump \
	-o debug=1 -o generate_pod=0 -o preserve_case=1 \
	-o dump_directory=$folder \
	-o components="[qw{InflateColumn::DateTime}]" \
	-o overwrite_modifications=$overwrite \
	-o datetime_timezone=UTC \
		'SkiResort::Model::LegacySchema' \
		'dbi:SQLite:dbname='$db_path''
