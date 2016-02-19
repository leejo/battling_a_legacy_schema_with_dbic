#!/bin/bash

id=$1

set -x

perl -Ilib -MSkiResort::Model::Piste -E "say SkiResort::Model::Piste->new( id => $id )->name";
