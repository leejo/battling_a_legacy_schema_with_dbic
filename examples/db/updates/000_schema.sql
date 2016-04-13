CREATE TABLE resort (
	id            INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name          VARCHAR( 255 ),
	last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE piste_rating (
	id             INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	rating         VARCHAR( 255 ) NOT NULL,
	last_modified  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE piste (
	id              INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	resort_id       INTEGER DEFAULT NULL,
	name            VARCHAR( 255 ) DEFAULT NULL,
	piste_rating_id INTEGER DEFAULT NULL,
	last_modified   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

	FOREIGN KEY( resort_id ) REFERENCES resort( id )
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY( piste_rating_id ) REFERENCES piste_rating( id )
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE installation_type (
	id             INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	description    VARCHAR( 255 ) NOT NULL,
	last_modified  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE installation (
	id                   INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	installation_type_id INTEGER NOT NULL,
	resort_id            INTEGER NOT NULL,
	name                 VARCHAR( 255 ) DEFAULT NULL,
	last_modified        TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

	FOREIGN KEY( resort_id ) REFERENCES resort( id )
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY( installation_type_id ) REFERENCES installation_type( id )
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE piste_installation (
	piste_id         INTEGER NOT NULL,
	installation_id  INTEGER NOT NULL,
	altitude         DECIMAL( 5,2 ) DEFAULT NULL,
	last_modified    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

	PRIMARY KEY( piste_id,installation_id,altitude ),

	FOREIGN KEY( piste_id ) REFERENCES piste( id )
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY( installation_id ) REFERENCES installation( id )
		ON UPDATE CASCADE ON DELETE CASCADE
);
