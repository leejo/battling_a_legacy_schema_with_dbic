#!/bin/bash

set -e -x -u

dbicdump \
        -o debug=1 \
        -o dump_directory=lib \
        -o generate_pod=0 \
        -o components="[qw{InflateColumn::DateTime}]" \
        -o preserve_case=1 \
        -o overwrite_modifications=0 \
        -o datetime_timezone=UTC \
                'SkiResort::Model::Schema' \
                'dbi:SQLite:dbname=db/resorts.db' \
                "" \
                ""
