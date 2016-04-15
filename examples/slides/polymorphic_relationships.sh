#!/bin/bash

set -e -x -u
export RESORT_DB=./examples/db/legacy/resorts_legacy.db

DBIC_TRACE=1 DBIC_TRACE_PROFILE=console perl -Iexamples/lib ./examples/slides/polymorphic_relationships.pl
