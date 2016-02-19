use utf8;
package SkiResort::Model::Schema::Result::Piste;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("piste");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "resort_id",
  {
    data_type      => "integer",
    default_value  => \"null",
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "name",
  {
    data_type     => "varchar( 255 )",
    default_value => \"null",
    is_nullable   => 1,
  },
  "start_altitude",
  { data_type => "float", default_value => \"null", is_nullable => 1 },
  "end_altitude",
  { data_type => "float", default_value => \"null", is_nullable => 1 },
  "length",
  { data_type => "float", default_value => \"null", is_nullable => 1 },
  "grade",
  { data_type => "char( 1 )", default_value => \"null", is_nullable => 1 },
  "last_modified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    timezone      => "UTC",
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "resort",
  "SkiResort::Model::Schema::Result::Resort",
  { id => "resort_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-01-14 16:20:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oU4i5xGpWw26h9Y9gDQgCg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

# vim: ts=2:sw=2:et
