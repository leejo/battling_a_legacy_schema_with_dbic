package SkiResort::Role::DB::Resort;

use strict;
use warnings;

use Moo::Role;
use Types::Standard qw/ :all /;

use Carp qw/ confess /;
use SkiResort::Model::Schema;

has 'dbic' => (
	'is'      => 'ro',
	'isa'     => InstanceOf['SkiResort::Model::Schema'],
    'lazy'    => 1,
	'default' => sub {
		my $db_path = $ENV{RESORT_DB}
			|| confess( "Missing RESORT_DB env variable" );

		return SkiResort::Model::Schema->connect(
			"dbi:SQLite:dbname=$db_path",
			'',
			'',
			{
				AutoCommit                 => 1,
				RaiseError                 => 1,
				sqlite_unicode             => 1,
				sqlite_see_if_its_a_number => 1,
			},
		);
	},
);

1;

# vim: ts=4:sw=4:noet
