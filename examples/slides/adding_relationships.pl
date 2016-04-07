#!perl

use strict;
use warnings;
use feature qw/ say /;

use Carp qw/ confess /;
use SkiResort::Model::LegacySchema;

my $db_path = $ENV{RESORT_DB}
	|| confess( "Missing RESORT_DB env variable" );

my $model = SkiResort::Model::LegacySchema->connect(
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

say "";
say "----> " . $model->resultset( "ResortItem" )->first->resort->name;
say "";
say "----> " . $model->resultset( "ResortItem" )->search( {},{ prefetch => [ qw/ resort / ] } )->first->resort->name;

# vim: ts=4:sw=4:noet
