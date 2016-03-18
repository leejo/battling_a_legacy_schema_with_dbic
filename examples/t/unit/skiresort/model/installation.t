#!perl

use strict;
use warnings;

use Test::Most;

use_ok( 'SkiResort::Model::Installation' );

isa_ok(
	my $Installation = SkiResort::Model::Installation->new(
		id => 1,
	),
	'SkiResort::Model::Installation'
);

can_ok(
	$Installation,
	qw/
		id
		name
		last_modified
	/,
);

is( $Installation->name,'BVB Villars - Bretaye','->name' );
isa_ok( $Installation->last_modified,'DateTime','->last_modified' );

cmp_deeply(
	$Installation->TO_JSON,
	{
		id            => 1,
		name          => 'BVB Villars - Bretaye',
		last_modified => ignore(),
	},
	'TO_JSON'
);

throws_ok(
	sub { SkiResort::Model::Installation->new( id => 999 )->name },
	"SkiResort::Exception::Database",
);

throws_ok(
	sub { SkiResort::Model::Installation->new->name },
	"SkiResort::Exception::Database",
);

done_testing();

# vim: ts=4:sw=4:noet
