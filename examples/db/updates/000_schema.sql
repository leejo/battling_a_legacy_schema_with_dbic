CREATE TABLE resort (
    id            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name          VARCHAR( 255 ),
    last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE piste (
    id             INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	resort_id      INTEGER DEFAULT NULL,
    name           VARCHAR( 255 ) DEFAULT NULL,
	start_altitude FLOAT DEFAULT NULL,
	end_altitude   FLOAT DEFAULT NULL,
	length         FLOAT DEFAULT NULL,
	grade          CHAR( 1 ) DEFAULT NULL,
    last_modified  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY( resort_id ) REFERENCES resort( id )
);

CREATE TABLE installation (
    id             INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	resort_id      INTEGER DEFAULT NULL,
    name           VARCHAR( 255 ) DEFAULT NULL,
    last_modified  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY( resort_id ) REFERENCES resort( id )
);
