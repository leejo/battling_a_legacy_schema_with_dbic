package SkiResort::Model::Resort;

use strict;
use warnings;

use Moo;
with 'SkiResort::Role::DB::Resort';

use Types::Standard qw/ :all /;

use SkiResort::Types qw/ $SQLiteDate /;
use SkiResort::Model::Piste;
use SkiResort::Model::Installation;
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
				return $self->_get_resort( $attribute );
			}
		);

	}
}

sub _get_resort {
	my ( $self,$attribute ) = @_;

	SkiResort::Exception::Database->throw( "id attribute missing for _get_resort" )
		if ! $self->id;

	my $model = $self->dbic;

	if ( my $resort = $model->rs( 'Resort' )->find( $self->id ) ) {
		$self->name( $resort->name );
		$self->last_modified( $resort->last_modified );
	}
	else {
		SkiResort::Exception::Database->throw( "Resort not found" );
	}

	return $self->{$attribute};
}

sub pistes {
	my ( $self ) = @_;

	my @pistes;

	foreach my $row ( $self->dbic->rs( 'Piste' )->search({
		resort_id => $self->id,
	})->all ) {
		push( @pistes,SkiResort::Model::Piste->new( $row->get_inflated_columns ) );
	}

	return [ @pistes ];
}

sub installations {
	my ( $self ) = @_;

	my @installations;

	foreach my $row ( $self->dbic->rs( 'Installation' )->search({
		resort_id => $self->id,
	})->all ) {
		push( @installations,SkiResort::Model::Installation->new( $row->get_inflated_columns ) );
	}

	return [ @installations ];
}

sub number_of_beginner_slopes     { grep { $_->beginner } @{ shift->pistes } }
sub number_of_intermediate_slopes { grep { $_->intermediate } @{ shift->pistes } }
sub number_of_advanced_slopes     { grep { $_->advanced } @{ shift->pistes } }
sub number_of_freeride_slopes     { grep { $_->freeride } @{ shift->pistes } }

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
