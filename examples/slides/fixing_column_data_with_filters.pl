#!perl

use strict;
use warnings;
use feature qw/ say /;

use FindBin qw/ $Bin /;
use lib $Bin;
use Connect qw/ model /;

my $model = model();

say "";

my $resort = $model->resultset( "Resort" )->first;

say "@{[ $resort->name ]} is @{[ $resort->active ? 'active' : 'inactive' ]}";

# vim: ts=4:sw=4:noet
