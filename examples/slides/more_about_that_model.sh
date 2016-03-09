#!/bin/bash

id=$1

set -x
export RESORT_DB=./examples/db/resorts.db

perl -Iexamples/lib -MSkiResort::Model::Piste -E "say SkiResort::Model::Piste->new( id => $id )->name";
