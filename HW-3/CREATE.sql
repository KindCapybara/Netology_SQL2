CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	artist_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist (
	id_genre INT NOT NULL REFERENCES genre(id),
	id_artist INT NOT NULL REFERENCES artist(id),
	PRIMARY KEY(id_genre, id_artist)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	production_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS album_artist (
	id_album INT NOT NULL REFERENCES album(id),
	id_artist INT NOT NULL REFERENCES artist(id),
	PRIMARY KEY(id_album, id_artist)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	production_date date NOT NULL
);
	
CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	production_date date NOT NULL,
	length TIME NOT NULL,
	id_album INT NOT NULL REFERENCES album(id)
);	
	
CREATE TABLE IF NOT EXISTS track_collection (
	id_track INT NOT NULL REFERENCES track(id),
	id_collection INT NOT NULL REFERENCES collection(id),
	PRIMARY KEY(id_track, id_collection)	
);