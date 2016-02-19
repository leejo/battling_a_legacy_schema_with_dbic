package SkiResort::Types;

use strict;
use warnings;

use Moo;
use Types::Standard qw/ :all /;
use Type::Utils qw/ declare as where inline_as coerce from /;
use DateTime::Format::SQLite;
use Exporter::Easy (
	OK => [ qw/ $SQLiteDate $SQLiteDateTime / ],
);
 
our $SQLiteDate = declare
	as        Str,
	where     {  ref( $_ ) eq 'DateTime' },
	inline_as { "ref( $_ ) eq 'DateTime'" }
;

our $SQLiteDateTime = declare
	as        Str,
	where     {  ref( $_ ) eq 'DateTime' },
	inline_as { "ref( $_ ) eq 'DateTime'" }
;

# protect against nonsense date values in the db
coerce $SQLiteDate, from Str, q{
	$_ eq '0000-00-00' ? undef : DateTime::Format::SQLite->parse_date($_)
};

# protect against nonsense datetime values in the db
coerce $SQLiteDateTime, from Str, q{
	$_ =~ /0000-00-00/ ? undef: DateTime::Format::SQLite->parse_datetime($_)
};

has 'date' => (
    'is'       => 'rw',
    'isa'      => Maybe[$SQLiteDate],
    'coerce'   => $SQLiteDate->coercion,
);

has 'datetime' => (
    'is'       => 'rw',
    'isa'      => Maybe[$SQLiteDateTime],
    'coerce'   => $SQLiteDateTime->coercion,
);

1;

# vim: ts=4:sw=4:noet
