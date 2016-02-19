package SkiResort::Model::Piste;

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
	Maybe[Str]         => [ qw/ name grade / ],
	Maybe[Num]         => [ qw/ start_altitude end_altitude length / ],
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
				return $self->_get_piste( $attribute );
			}
		);

	}
}

sub _get_piste {
	my ( $self,$attribute ) = @_;

	SkiResort::Exception::Database->throw( "id attribute missing for _get_piste" )
		if ! $self->id;

	my $model = $self->dbic;

	if ( my $piste = $model->rs( 'Piste' )->find( $self->id ) ) {
		$self->name( $piste->name );
		$self->start_altitude( $piste->start_altitude );
		$self->end_altitude( $piste->end_altitude );
		$self->length( $piste->length );
		$self->grade( $piste->grade );
		$self->last_modified( $piste->last_modified );
	}
	else {
		SkiResort::Exception::Database->throw( "Piste not found" );
	}

	return $self->{$attribute};
}

sub beginner     { return shift->grade eq 'B' };
sub intermediate { return shift->grade eq 'I' };
sub advanced     { return shift->grade eq 'A' };
sub freeride     { return shift->grade eq 'F' };

sub TO_JSON {
	my ( $self ) = @_;

	return {
		id             => $self->id,
		name           => $self->name,
		start_altitude => $self->start_altitude,
		end_altitude   => $self->end_altitude,
		length         => $self->length,
		grade          => $self->grade,
		last_modified  => $self->last_modified->iso8601,
	};
}

1;

# vim: ts=4:sw=4:noet
