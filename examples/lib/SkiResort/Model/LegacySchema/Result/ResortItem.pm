use utf8;
package SkiResort::Model::LegacySchema::Result::ResortItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("resort_item");
__PACKAGE__->add_columns(
  "resort_id",
  { data_type => "integer", default_value => \"null", is_nullable => 1 },
  "item_source",
  { data_type => "varchar( 255 )", is_nullable => 1 },
  "item_id",
  { data_type => "integer", is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-04-07 14:16:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kOaW4xm7IT+Y3qVDDBy2hg

__PACKAGE__->belongs_to(
  "resort",
  "SkiResort::Model::LegacySchema::Result::Resort",
  { id => "resort_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

1;
