/* la station */
INSERT INTO resort( name ) values( 'Villars-Gryon' );

/* les pistes noires (difficile) */
INSERT INTO piste( resort_id,name,grade ) values( 1,'Ruvines','A' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'La Croix noire','A' );

/* les pistes rouges (moyen) */
INSERT INTO piste( resort_id,name,grade ) values( 1,'Chamois','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Aigle','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Chamossaire - Nord','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Chamossaire - Sud','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Satde','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Chaux Ronde Rouge','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Les Oeils','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Les Vernes','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'La Traverse','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Golette','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,"Combe d'Orsay",'I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Sodoleuvre Rouge','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Cuelle','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Leuins Rouge (Frach.)','I' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'La Croix rouge','I' );

/* les pistes jaunes (freeride) */
INSERT INTO piste( resort_id,name,grade ) values( 1,'Bouquetins (Roc - Villars)','F' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Loveresse (Col de Soud - gare)','F' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Le Crot','F' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Monjoie (Eurotel)','F' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Parc','F' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Leuins Jaune (Frience)','F' );

/* les pistes bleues (facile) */
INSERT INTO piste( resort_id,name,grade ) values( 1,'Bretaye - Orsay','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Lac de Bretaye','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Lac Noir','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Chaux Ronde Bleue','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'La Rasse','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Populaire Bretaye - Col de Soud','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Lapins (Col de Soud - télécabine)','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,NULL,'B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Gryonne','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Sodoleuvre Bleue','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Populaire Gryon','B' );
INSERT INTO piste( resort_id,name,grade ) values( 1,'Fracherets','B' );

/* les installations */
INSERT INTO installation( resort_id,name ) values( 1,'BVB Villars - Bretaye' );
INSERT INTO installation( resort_id,name ) values( 1,"TC8 Villars - Roc d'Orsay" );
INSERT INTO installation( resort_id,name ) values( 1,'Grand Chamossaire' );
INSERT INTO installation( resort_id,name ) values( 1,'Bretaye - Orsay' );
INSERT INTO installation( resort_id,name ) values( 1,"Combe d'Orsay" );
INSERT INTO installation( resort_id,name ) values( 1,'Lac Noir - Chaux Ronde' );
INSERT INTO installation( resort_id,name ) values( 1,'Lac Noir - Bretaye' );
INSERT INTO installation( resort_id,name ) values( 1,'Lac de Bretaye' );
INSERT INTO installation( resort_id,name ) values( 1,'Chaux Ronde I' );
INSERT INTO installation( resort_id,name ) values( 1,'Chaux Ronde II' );
INSERT INTO installation( resort_id,name ) values( 1,'Petit Chamossaire' );
INSERT INTO installation( resort_id,name ) values( 1,'Rasse - Chaux Ronde' );
INSERT INTO installation( resort_id,name ) values( 1,'Palace' );
INSERT INTO installation( resort_id,name ) values( 1,'Chavonnes' );
INSERT INTO installation( resort_id,name ) values( 1,'TC4 Barboleuse - Les Chaux' );
INSERT INTO installation( resort_id,name ) values( 1,'Sodoleuvre - La Croix' );
INSERT INTO installation( resort_id,name ) values( 1,'Gryonne' );
INSERT INTO installation( resort_id,name ) values( 1,'Plan - Métroz' );
INSERT INTO installation( resort_id,name ) values( 1,'Fracherets' );
