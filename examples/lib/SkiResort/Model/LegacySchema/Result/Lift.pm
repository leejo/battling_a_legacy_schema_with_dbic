use utf8;
package SkiResort::Model::LegacySchema::Result::Lift;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("lift");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  {
    data_type     => "varchar( 255 )",
    default_value => \"null",
    is_nullable   => 1,
  },
  "type",
  {
    data_type     => "varchar( 255 )",
    default_value => \"null",
    is_nullable   => 1,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-04-07 14:16:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4qUCQJAokSmDHhw7dc6oMw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
