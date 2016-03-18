/* la station */
INSERT INTO resort( name ) values( 'Villars-Gryon' );

/* les installations */
INSERT INTO installation_type( id,description ) values
	( 1,'Train' ),
	( 2,'Télécabine' ),
	( 3,'Télémix' ),
	( 4,'Télésiège 2 places' ),
	( 5,'Télésiège 4 places' ),
	( 6,'Télésiège 6 places' ),
	( 7,'Téléski' ),
	( 8,'Tapis' )
;

/* piste_rating */
INSERT INTO piste_rating( id,rating ) values
	( 1,'Easy' ),
	( 2,'Intermediate' ),
	( 3,'Advanced' ),
	( 4,'Expert' ),
	( 5,'Extremely difficult' ),
	( 6,'Off-piste' )
;

/* les pistes noire double (très difficile) */

/* les pistes noires (difficile) */
INSERT INTO piste( resort_id,name,piste_rating_id ) values
	( 1,'Ruvines',3 ),
	( 1,'La Croix noire',3 )
;

/* les pistes rouges (moyen) */
INSERT INTO piste( resort_id,name,piste_rating_id ) values
	( 1,'Chamois',2 ),
	( 1,'Aigle',2 ),
	( 1,'Chamossaire - Nord',2 ),
	( 1,'Chamossaire - Sud',2 ),
	( 1,'Satde',2 ),
	( 1,'Chaux Ronde Rouge',2 ),
	( 1,'Les Oeils',2 ),
	( 1,'Les Vernes',2 ),
	( 1,'La Traverse',2 ),
	( 1,'Golette',2 ),
	( 1,"Combe d'Orsay",2 ),
	( 1,'Sodoleuvre Rouge',2 ),
	( 1,'Cuelle',2 ),
	( 1,'Leuins Rouge (Frach.)',2 ),
	( 1,'La Croix rouge',2 )
;

/* les pistes jaunes (freeride) */
INSERT INTO piste( resort_id,name,piste_rating_id ) values
	( 1,'Bouquetins (Roc - Villars)',6 ),
	( 1,'Loveresse (Col de Soud - gare)',6 ),
	( 1,'Le Crot',6 ),
	( 1,'Monjoie (Eurotel)',6 ),
	( 1,'Parc',6 ),
	( 1,'Leuins Jaune (Frience)',6 )
;

/* les pistes bleues (facile) */
INSERT INTO piste( resort_id,name,piste_rating_id ) values
	( 1,'Bretaye - Orsay',1 ),
	( 1,'Lac de Bretaye',1 ),
	( 1,'Lac Noir',1 ),
	( 1,'Chaux Ronde Bleue',1 ),
	( 1,'La Rasse',1 ),
	( 1,'Populaire Bretaye - Col de Soud',1 ),
	( 1,'Lapins (Col de Soud - télécabine)',1 ),
	( 1,NULL,1 ),
	( 1,'Gryonne',1 ),
	( 1,'Sodoleuvre Bleue',1 ),
	( 1,'Populaire Gryon',1 ),
	( 1,'Fracherets',1 )
;

/* les installations */
INSERT INTO installation( resort_id,name,installation_type_id ) values
	( 1,'BVB Villars - Bretaye',1 ),
	( 1,"TC8 Villars - Roc d'Orsay",2 ),
	( 1,'Grand Chamossaire',6 ),
	( 1,'Bretaye - Orsay',7 ),
	( 1,"Combe d'Orsay",7 ),
	( 1,'Lac Noir - Chaux Ronde',5 ),
	( 1,'Lac Noir - Bretaye',7 ),
	( 1,'Lac de Bretaye',7 ),
	( 1,'Chaux Ronde I',7 ),
	( 1,'Chaux Ronde II',7 ),
	( 1,'Petit Chamossaire',6 ),
	( 1,'Rasse - Chaux Ronde',6 ),
	( 1,'Palace',7 ),
	( 1,'Chavonnes',7 ),
	( 1,'TC4 Barboleuse - Les Chaux',2 ),
	( 1,'Sodoleuvre - La Croix',5 ),
	( 1,'Gryonne',7 ),
	( 1,'Plan - Métroz',7 ),
	( 1,'Fracherets',7 )
;
