package Connect;

use strict;
use warnings;

use Carp qw/ confess /;
use SkiResort::Model::LegacySchema;
use Exporter::Easy (
    OK => [ qw/
        model
    / ]
);

sub model {
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
}

1;
