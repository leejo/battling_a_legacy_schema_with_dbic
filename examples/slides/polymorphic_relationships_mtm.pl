#!perl

use strict;
use warnings;
use feature qw/ say /;

use FindBin qw/ $Bin /;
use lib $Bin;
use Connect qw/ model /;

my $model = model();

say "";
say "----> " .  $model->resultset( "Resort" )->first
	->search_related( 'resort_items' )
	->search_related( 'piste' )->first->name;

# vim: ts=4:sw=4:noet
