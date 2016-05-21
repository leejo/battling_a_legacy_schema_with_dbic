#!perl

use strict;
use warnings;
use feature qw/ say /;

use FindBin qw/ $Bin /;
use lib $Bin;
use Connect qw/ model /;

my $rating = shift;
my $model = model();

say "";
say join(
	"\n",
	map { $_->name // '' }
		$model->resultset( "PistesForRating" )
			->search( {},{ bind => [ $rating ] } )
			->all
);

# vim: ts=4:sw=4:noet
