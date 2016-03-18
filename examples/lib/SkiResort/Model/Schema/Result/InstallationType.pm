use utf8;
package SkiResort::Model::Schema::Result::InstallationType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("installation_type");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "description",
  { data_type => "varchar( 255 )", is_nullable => 0 },
  "last_modified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    timezone      => "UTC",
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "installations",
  "SkiResort::Model::Schema::Result::Installation",
  { "foreign.installation_type_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-03-18 15:34:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YdXyOBUYGjZTKXtbCZdIeQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
