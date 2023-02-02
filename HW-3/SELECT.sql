--количество исполнителей в каждом жанре;
SELECT g.name, count(*) FROM genre g
JOIN genre_artist ga ON ga.id_genre = g.id
GROUP BY g.id

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT a.name, COUNT(*)  FROM track t 
JOIN album a ON t.id_album = a.id 
WHERE a.production_date BETWEEN '2019-01-01' AND '2020-01-31'
GROUP BY a.name;

--средняя продолжительность треков по каждому альбому;
SELECT a.name, AVG(length) FROM album a
JOIN track t ON a.id = t.id_album
GROUP BY a.name;

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT ar.artist_name, a.name, a.production_date FROM artist ar
JOIN album_artist aa on ar.id = aa.id_artist
JOIN album a on aa.id_album = a.id 
WHERE a.production_date NOT BETWEEN '2020-01-01' and '2020-12-31';

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT DISTINCT ar.artist_name, ct.name FROM artist ar
JOIN album_artist aa ON ar.id = aa.id_artist
JOIN album a ON aa.id_album = a.id
JOIN track t ON a.id = t.id_album
JOIN track_collection tc ON t.id = tc.id_track 
JOIN collection ct ON tc.id_collection = ct.id 
WHERE ar.artist_name = 'INSTASAMKA';

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.name, ar.artist_name FROM album a
LEFT JOIN album_artist aa ON a.id = aa.id_album 
LEFT JOIN artist ar ON aa.id_artist = ar.id 
LEFT JOIN genre_artist ga ON ar.id = ga.id_artist
GROUP BY a.name, ar.artist_name
HAVING count(*) > 1;

--наименование треков, которые не входят в сборники;
SELECT t.name FROM track t 
LEFT JOIN track_collection tc on t.id = tc.id_track 
WHERE tc.id_collection IS NULL;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT ar.artist_name, t.length FROM artist ar 
JOIN album_artist aa ON ar.id = aa.id_artist
JOIN album a ON a.id = aa.id_album
JOIN track_collection tc ON a.id = tc.id_collection 
JOIN track t ON t.id = tc.id_track
WHERE t.length = (SELECT MIN(t.length) FROM track t 
JOIN track_collection tc ON t.id = tc.id_track)

--название альбомов, содержащих наименьшее количество треков.
SELECT a.name, count(t.id_album) from album a
JOIN track t on a.id = t.id_album
GROUP BY a.name
HAVING count(t.id_album) in (SELECT COUNT (t.id_album) FROM album a
JOIN track t  ON a.id = t.id_album
GROUP BY a.id
ORDER BY count(t.id_album)
LIMIT 1);