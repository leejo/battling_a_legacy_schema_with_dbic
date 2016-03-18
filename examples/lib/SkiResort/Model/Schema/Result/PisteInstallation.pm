use utf8;
package SkiResort::Model::Schema::Result::PisteInstallation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("piste_installation");
__PACKAGE__->add_columns(
  "piste_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "installation_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "altitude",
  {
    data_type     => "decimal( 5,2 )",
    default_value => \"null",
    is_nullable   => 0,
  },
  "last_modified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    timezone      => "UTC",
  },
);
__PACKAGE__->set_primary_key("piste_id", "installation_id", "altitude");
__PACKAGE__->belongs_to(
  "installation",
  "SkiResort::Model::Schema::Result::Installation",
  { id => "installation_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);
__PACKAGE__->belongs_to(
  "piste",
  "SkiResort::Model::Schema::Result::Piste",
  { id => "piste_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-03-18 15:49:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uh5ItyzFmEqVllLwhcww0A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
