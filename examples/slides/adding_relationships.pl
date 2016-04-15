#!perl

use strict;
use warnings;
use feature qw/ say /;

use FindBin qw/ $Bin /;
use lib $Bin;
use Connect qw/ model /;

my $model = model();

say "";
say "----> " . $model->resultset( "ResortItem" )->first->resort->name;
say "";
say "----> " . $model->resultset( "ResortItem" )->search( {},{ prefetch => [ qw/ resort / ] } )->first->resort->name;

# vim: ts=4:sw=4:noet
