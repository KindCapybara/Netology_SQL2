INSERT INTO artist (artist_name) VALUES 
	('Madonna'),
	('GGun'),
	('Sam Smith'),
	('Ava Max'),
	('INSTASAMKA'),
	('Snoop Dogg'),
	('Jason Derulo'),
	('Lady Gaga');

INSERT INTO genre (name) VALUES
	('Pop'),
	('Rock'),
	('Hip-Hop'),
	('Rap'),
	('Deep House');
	
INSERT INTO genre_artist (id_genre, id_artist) VALUES 
	(4, 2),
	(3, 3),
	(1, 3),
	(5, 4),
	(3, 5),
	(1, 6),
	(2, 7),
	(4, 8),
	(1, 2),
	(3, 8),
	(5, 3),
	(3, 2),
	(4, 7),
	(2, 5);
		
INSERT INTO album (name, production_date) VALUES
	('The Yardbirds', '2018-05-03'),
	('Talking Heads', '2019-05-03'),
	('Soundgarden', '2020-05-03'),
	('Roxy Music', '2017-05-03'),
	('Black Sabbath', '2018-06-03'),
	('The Grateful Dead', '2019-07-03'),
	('Parliament', '2020-09-03'),
	('My Songs', '2019-07-09');
	
INSERT INTO album_artist (id_album, id_artist) VALUES
	(4, 5),
	(1, 8),
	(6, 3),
	(6, 4),
	(4, 2),
	(2, 7),
	(2, 2),
	(8, 6),
	(7, 2),
	(5, 4),
	(8, 1),
	(3, 1),
	(7, 5),
	(5, 3),
	(3, 6);

INSERT INTO track (name, production_date, length, id_album) VALUES
	('Flowers', '2002-05-04', '00:04:20', 3),
	('Creepin', '2010-06-07', '00:04:20', 4),
	('The Astronaut', '2011-07-08', '00:04:20', 5),
	('Bloody Mary', '2013-09-10', '00:03:20', 6),
	('Miss You', '2014-10-11', '00:03:20', 7),
	('Escapism.', '2015-01-02', '00:03:20', 8),
	('Players', '2016-03-04', '00:03:20', 1),
	('Sure Thing', '2017-05-06', '00:03:20', 2),
	('Miguel', '2018-07-08', '00:04:50', 8),
	('People', '2021-09-10', '00:03:60', 7),
	('POPSTAR', '2020-02-09', '00:03:60', 6),
	('DJ Khaled', '2020-03-07', '00:03:60', 5),
	('Unholy', '2018-04-08', '00:03:60', 4),
	('I"m Good', '2018-05-03', '00:03:10', 3),
	('My Captain', '2019-09-02', '00:03:10', 2);

INSERT INTO collection (name, production_date) VALUES 
	('Pop Hits', '2019-01-02'),
	('Hip Hop Hits', '2021-02-05'),
	('Rap Hits', '2019-01-06'),
	('Rock Hits', '2018-09-22'),
	('Summer Hits', '2015-05-12'),
	('Hot Winter', '2014-06-13'),
	('Best Collection', '2021-08-18'),
	('Best of the Best', '2020-11-11');
	
INSERT INTO track_collection (id_track, id_collection) VALUES
	(14, 4),
	(4,3),
	(10, 8),
	(11, 5),
	(2, 6),
	(7, 1),
	(15, 1),
	(13, 6),
	(9, 8),
	(15, 5),
	(2, 8),
	(4, 4),
	(1, 5),
	(13, 3),
	(6, 2),
	(10, 6),
	(5, 3),
	(11, 1),
	(7, 5),
	(14, 2),
	(9, 5),
	(5, 5),
	(6, 4),
	(12, 4),
	(12, 2);