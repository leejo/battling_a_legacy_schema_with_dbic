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
	{ item_source => 'piste' },
	{ prefetch => [ qw/ piste / ] }
)->first->piste->name;

# vim: ts=4:sw=4:noet
