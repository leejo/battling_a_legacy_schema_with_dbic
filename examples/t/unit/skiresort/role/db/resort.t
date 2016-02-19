#!perl

use strict;
use warnings;

package Tester::DB;

use Moo;
with 'SkiResort::Role::DB::Resort';

1;

package main;

use Test::Most;

isa_ok(
	my $Tester = Tester::DB->new,
	'Tester::DB'
);

can_ok(
	$Tester,
	qw/
		dbic
	/
);

isa_ok( $Tester->dbic,'SkiResort::Model::Schema' );

lives_ok(
	sub { my $rs = $Tester->dbic->rs( 'Resort' )->all },
	'->dbic can access tables in db'
);

done_testing();

# vim: ts=4:sw=4:noet
