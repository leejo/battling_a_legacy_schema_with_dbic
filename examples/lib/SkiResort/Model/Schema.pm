use utf8;
package SkiResort::Model::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-01-14 14:43:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4oFJmmKd6jz+P1DoLXXwKw

use DBIx::Class::UnicornLogger;

my $pp = DBIx::Class::UnicornLogger->new({
	tree             => { profile => 'console' },
	profile          => 'console',
	format           => '[%d]\[%F:%L]%n ** %m',
	multiline_format => ' -- %m',
});

sub connection {
	my $self = shift;

	my $ret = $self->next::method(@_);
	$self->storage->debugobj( $pp );

	return $ret
}

sub rs {
	return shift->resultset( @_ );
}

1;

# vim: ts=4:sw=4:noet
