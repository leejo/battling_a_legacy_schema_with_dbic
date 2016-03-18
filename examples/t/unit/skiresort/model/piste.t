#!perl

use strict;
use warnings;

use Test::Most;
use Test::Exception;

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
		grade
		last_modified
	/,
);

is( $Piste->name,'Ruvines','->name' );
is( $Piste->grade,'Advanced','->grade' );
isa_ok( $Piste->last_modified,'DateTime','->last_modified' );

ok( ! $Piste->beginner,'->beginner' );
ok( ! $Piste->intermediate,'->intermediate' );
ok( $Piste->advanced,'->advanced' );
ok( ! $Piste->expert,'->expert' );
ok( ! $Piste->freeride,'->freeride' );

cmp_deeply(
	$Piste->TO_JSON,
	{
		id             => 1,
		name           => 'Ruvines',
		grade          => 'Advanced',
		last_modified  => ignore(),
	},
	'TO_JSON'
);

throws_ok(
	sub { SkiResort::Model::Piste->new( id => 999 )->name },
	"SkiResort::Exception::Database",
);

throws_ok(
	sub { SkiResort::Model::Piste->new->name },
	"SkiResort::Exception::Database",
);

done_testing();

# vim: ts=4:sw=4:noet
