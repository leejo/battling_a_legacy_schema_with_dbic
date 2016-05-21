package SkiResort::Model::LegacySchema::Result::PistesForRatingMatchingString;
 
use base qw/SkiResort::Model::LegacySchema::Result::PistesForRating/;
 
__PACKAGE__->result_source_instance->view_definition(
	__PACKAGE__->SUPER::result_source_instance->view_definition . "
	AND piste.name like ?
" );

1;
