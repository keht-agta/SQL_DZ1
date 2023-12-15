CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	date_release DATE not NULL
);

CREATE TABLE IF NOT EXISTS Song (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	duration TIME,
	album INTEGER not null references Album(id)
);

CREATE TABLE IF NOT EXISTS Colection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	date DATE not NULL
);

CREATE TABLE IF NOT EXISTS Musician_genres (
	musician_id INTEGER REFERENCES Musician(id),
	genre_id INTEGER REFERENCES Genre(id),
	CONSTRAINT pk PRIMARY KEY (musician_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Musician_albums (
	musician_id INTEGER REFERENCES Musician(id),
	album_id INTEGER REFERENCES Album(id),
	CONSTRAINT pk2 PRIMARY KEY (musician_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks_colection (
	colection_id INTEGER REFERENCES Colection(id),
	song_id INTEGER REFERENCES Song(id),
	CONSTRAINT pk3 PRIMARY KEY (colection_id, song_id)
);
