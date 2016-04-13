CREATE TABLE resort (
	id            INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name          VARCHAR( 255 ),
	active        CHARACTER( 1 ) DEFAULT 'N'
);

CREATE TABLE resort_item (
	resort_id     INTEGER DEFAULT NULL,
	item_source   VARCHAR( 255 ),
	item_id       INTEGER NOT NULL
);

CREATE TABLE piste (
	id              INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name            VARCHAR( 255 ) DEFAULT NULL,
	rating          VARCHAR( 255 ) NOT NULL,
	lifts           TEXT
);

CREATE TABLE lift (
	id              INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name            VARCHAR( 255 ) DEFAULT NULL,
	type            VARCHAR( 255 ) DEFAULT NULL
);
