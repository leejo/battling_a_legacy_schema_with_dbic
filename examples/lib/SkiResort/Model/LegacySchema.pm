use utf8;
package SkiResort::Model::LegacySchema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-04-07 14:16:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:31i/pC6U47ct2QZKqqoZuQ

use Carp qw/ longmess shortmess /;

sub resultset {
	my ( $self,$table ) = @_;

	if ( my $trace = $ENV{DBIC_TRACE} ) {
		# if DBIC_TRACE is set then cluck the resultset name before we
		# run the query so we can get a good idea of where the call to
		# the query came from
		my ( $level,$trace_file ) = split( /=/,$trace );
		$trace = $level == 1
			? shortmess( "RESULTSET: $table" )
			: longmess( "RESULTSET: $table" );
		if ( $level && $trace_file ) {
			open( my $fh,'>>',$trace_file )
				|| cluck( "Can't open $trace_file for write: $!" );
			print $fh $trace;
			close( $fh );
		} else {
			print STDERR $trace;
		}
	}

	return $self->SUPER::resultset( $table );
}

1;
