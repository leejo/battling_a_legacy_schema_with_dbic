#!perl

use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use SkiResort::Model::Resort;
use SkiResort::Model::Piste;
use SkiResort::Model::Installation;

use Mojolicious::Lite;
use Try::Tiny::SmartCatch;

get '/:entity/:id/:method'
	=> [
		# restrictive placeholders
		entity => [ qw/ resorts pistes installations / ],
		id     => qr/\d+/,
	]
	=> {
		# optional placeholders (with default values)
		method => undef
	}
	=> sub {

	my ( $self ) = @_;

	try sub {
		chop( my $entity = $self->param( 'entity' ) );
		my $class  = "SkiResort::Model::" . ucfirst( $entity );
		my $Object = $class->new( id => $self->param( 'id' ) );

		if ( my $method = $self->param( 'method' ) ) {
			$method = _validate_method( $entity,$method );
			return $self->render( json => [ $Object->$method ] );
		} else {
			return $self->render( json => $Object );
		}
	},
	catch_default sub {
		$self->app->log->error( $_ );
		return $self->reply->not_found;
	};
};

sub _validate_method {
	my ( $entity,$method ) = @_;

	my $validated_method = {
		'resort' => {
			'pistes'        => 'pistes',
			'installations' => 'installations'
		},
	}->{ $entity }{ $method };

	$validated_method || app->log->error(
		"'$method' not a valid method of '$entity'"
	) && die;

	return $validated_method;
}

app->start;

# vim: ts=4:sw=4:noet
