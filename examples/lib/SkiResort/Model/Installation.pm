package SkiResort::Model::Installation;

use strict;
use warnings;

use Moo;
with 'SkiResort::Role::DB::Resort';

use Types::Standard qw/ :all /;
use SkiResort::Types qw/ $SQLiteDate /;
use SkiResort::Exception::Database;

has 'id' => (
	'is'       => 'ro',
	'isa'      => Int,
	'required' => 0,
);

my %attributes = (
	Maybe[Str]         => [ qw/ name / ],
	Maybe[$SQLiteDate] => [ qw/ last_modified / ],
);

foreach my $type ( keys( %attributes ) ) {
	foreach my $attribute ( @{ $attributes{$type} } ) {

		has $attribute => (
			is      => 'rw',
			isa     => sub { $type },
			lazy    => 1,
			default => sub {
				my ($self) = @_;
				return $self->_get_installation( $attribute );
			}
		);

	}
}

sub _get_installation {
	my ( $self,$attribute ) = @_;

	SkiResort::Exception::Database->throw( "id attribute missing for _get_installation" )
		if ! $self->id;

	my $model = $self->dbic;

	if ( my $installation = $model->rs( 'Installation' )->find( $self->id ) ) {
		$self->name( $installation->name );
		$self->last_modified( $installation->last_modified );
	}
	else {
		SkiResort::Exception::Database->throw( "Installation not found" );
	}

	return $self->{$attribute};
}

sub TO_JSON {
	my ( $self ) = @_;

	return {
		id            => $self->id,
		name          => $self->name,
		last_modified => $self->last_modified->iso8601,
	};
}

1;

# vim: ts=4:sw=4:noet
