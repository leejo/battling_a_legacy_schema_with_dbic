#!perl

use strict;
use warnings;
use feature qw/ say /;

use FindBin qw/ $Bin /;
use lib $Bin;
use Connect qw/ model /;

my $rating = shift;
my $string = shift;
my $model = model();

say "";
say join(
	"\n",
	map { $_->name // '' }
		$model->resultset( "PistesForRatingMatchingString" )
			->search( {},{ bind => [ $rating,$string ] } )
			->all
);

# vim: ts=4:sw=4:noet
