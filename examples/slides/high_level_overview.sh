#!/bin/bash

set -e -x -u

~/bin/perl ~/bin/rdbic.pl examples/db/legacy/resorts_legacy.db
