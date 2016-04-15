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
  { data_type => "integer", is_nullable => 0 },
  "item_source",
  { data_type => "varchar( 255 )", is_nullable => 0 },
  "item_id",
  { data_type => "integer", is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2016-04-15 15:46:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lRI0m2b0UhfB5xRHMLmyPA

__PACKAGE__->belongs_to(
  "resort",
  "SkiResort::Model::LegacySchema::Result::Resort",
  { id => "resort_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->set_primary_key( "resort_id","item_source","item_id" );

foreach my $source ( qw/ piste lift / ) {

  __PACKAGE__->belongs_to(
    $source => 'SkiResort::Model::LegacySchema::Result::' . ucfirst( $source ),
    sub {
      my ( $args ) = @_;

      return {
        "$args->{self_alias}.item_source" => $source,
        "$args->{self_alias}.item_id"   => { -ident => "$args->{foreign_alias}.id" },
      };
    },
  );

}

1;
