#!perl

use strict;
use warnings;

use Test::Most;

use_ok( 'SkiResort::Model::Resort' );

isa_ok(
	my $Resort = SkiResort::Model::Resort->new(
		id => 1,
	),
	'SkiResort::Model::Resort'
);

can_ok(
	$Resort,
	qw/
		id
		name
		last_modified

		pistes
		installations
	/,
);

is( $Resort->name,'Villars-Gryon','->name' );
isa_ok( $Resort->last_modified,'DateTime','->last_modified' );
isa_ok( [ $Resort->pistes ]->[0],'SkiResort::Model::Piste' );
isa_ok( $Resort->installations->[0],'SkiResort::Model::Installation' );

is( $Resort->number_of_beginner_slopes,12,'->number_of_beginner_slopes' );
is( $Resort->number_of_intermediate_slopes,15,'->number_of_intermediate_slopes' );
is( $Resort->number_of_advanced_slopes,2,'->number_of_advanced_slopes' );
is( $Resort->number_of_expert_slopes,0,'->number_of_expert_slopes' );
is( $Resort->number_of_freeride_slopes,6,'->number_of_freeride_slopes' );

cmp_deeply(
	$Resort->TO_JSON,
	{
		id            => 1,
		name          => 'Villars-Gryon',
		last_modified => ignore(),
	},
	'TO_JSON'
);

throws_ok(
	sub { SkiResort::Model::Resort->new( id => 999 )->name },
	"SkiResort::Exception::Database",
);

throws_ok(
	sub { SkiResort::Model::Resort->new->name },
	"SkiResort::Exception::Database",
);

done_testing();

# vim: ts=4:sw=4:noet
