package SkiResort::Model::LegacySchema::Result::PistesForRating;
 
use base qw/DBIx::Class::Core/;
 
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('pistes_for_rating');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->add_columns( "name", {
    data_type     => "varchar( 255 )",
    default_value => \"null",
    is_nullable   => 1,
} );

__PACKAGE__->result_source_instance->view_definition( "
	SELECT piste.name
	FROM   piste
    WHERE  rating = ?
" );

1;
