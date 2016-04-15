#!perl

use strict;
use warnings;
use feature qw/ say /;

use FindBin qw/ $Bin /;
use lib $Bin;
use Connect qw/ model /;

my $model = model();

say "";
say "----> " . $model->resultset( "Resort" )->search( {},{ prefetch => [ qw/ pistes / ] } )->first->pistes->first->name;

# vim: ts=4:sw=4:noet
