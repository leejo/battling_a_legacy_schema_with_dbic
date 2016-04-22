use utf8;
package SkiResort::Model::LegacySchema::Result::Resort;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("resort");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar( 255 )", is_nullable => 1 },
  "active",
  { data_type => "character( 1 )", default_value => "N", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-04-07 14:16:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3JLNIAMsIuaZ4T+fYKDWRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->has_many(
  resort_items => 'SkiResort::Model::LegacySchema::Result::ResortItem',
  { 'foreign.resort_id' => 'self.id' }
);

__PACKAGE__->many_to_many(
  'pistes' => 'resort_items' => 'piste'
);

__PACKAGE__->load_components( "FilterColumn" );

__PACKAGE__->filter_column( active => {
  filter_to_storage   => sub { return $_[1] ? 'Y' : 'N'; },
  filter_from_storage => sub { return defined $_[1] && $_[1] =~ /Y/i ? 1 : 0; },
});

1;
