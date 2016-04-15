#!perl

use strict;
use warnings;
use feature qw/ say /;

use FindBin qw/ $Bin /;
use lib $Bin;
use Connect qw/ model /;

my $model = model();

say "";
say "----> " . $model->resultset( "ResortItem" )->search(
	{ item_source => 'lift' },
	{ prefetch => [ qw/ lift / ] }
)->first->lift->name;

# vim: ts=4:sw=4:noet
