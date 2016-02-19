#!perl

use strict;
use warnings;

use Test::Most;

use_ok( 'SkiResort::Model::Piste' );

isa_ok(
	my $Piste = SkiResort::Model::Piste->new(
		id => 1,
	),
	'SkiResort::Model::Piste'
);

can_ok(
	$Piste,
	qw/
		id
		name
		start_altitude
		end_altitude
		length
		grade
		last_modified
	/,
);

is( $Piste->name,'Ruvines','->name' );
ok( ! $Piste->start_altitude,'->start_altitude' );
ok( ! $Piste->end_altitude,'->end_altitude' );
ok( ! $Piste->length,'->length' );
is( $Piste->grade,'A','->grade' );
isa_ok( $Piste->last_modified,'DateTime','->last_modified' );

ok( ! $Piste->beginner,'->beginner' );
ok( ! $Piste->intermediate,'->intermediate' );
ok( $Piste->advanced,'->advanced' );
ok( ! $Piste->freeride,'->freeride' );

cmp_deeply(
	$Piste->TO_JSON,
	{
		id             => 1,
		name           => 'Ruvines',
		start_altitude => undef,
		end_altitude   => undef,
		length         => undef,
		grade          => 'A',
		last_modified  => ignore(),
	},
	'TO_JSON'
);

done_testing();

# vim: ts=4:sw=4:noet
