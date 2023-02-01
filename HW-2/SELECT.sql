SELECT name, production_date FROM album
WHERE production_date BETWEEN '20180101' AND '20181231';

SELECT name, lenght FROM track
ORDER BY lenght DESC
LIMIT 1

SELECT name FROM track
WHERE length > '00:03:29';

SELECT name, production_date FROM collection
WHERE production_date BETWEEN '20180101' AND '20201231';

SELECT artist_name FROM artist
WHERE artist_name NOT LIKE '% %';

SELECT name FROM track
WHERE name LIKE '%My%' OR name LIKE '%Мой%';