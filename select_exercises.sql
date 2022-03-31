USE albums_db;
#2 complete

SHOW tables;

describe albums;

SELECT * FROM albums;
#3 completed
SELECT COUNT(artist) 
FROM albums;
#3a 31 rows in album

SELECT COUNT(DISTINCT artist) 
FROM albums;
#3b this bit of code reveals 23 different artists

SHOW CREATE TABLE albums;
#3c primary key is 'id'

SELECT name FROM albums WHERE artist='pink floyd';
#4a name of all pink floyd songs
 -- OR artist = 'AC/DC';
-- this line of code gives us specifically pink floyd under the artist column

SELECT * FROM albums 
WHERE release_date 
ORDER BY release_date;
#3d
#ASC LIMIT 1; optional code to give us one answer
#this line of code pulls all of the info from albums and organized it by release date in order of release date
-- SELECT first_name, last_name
-- FROM employees
-- ORDER BY last_name DESC;

SELECT * FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
#ORDER BY release_date;
#4b specifically

SELECT genre FROM albums
WHERE name = 'Nevermind';
#4c

SELECT * 
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
#4d

SELECT * 
FROM albums 
WHERE sales < 20;
#4e

SELECT * 
FROM albums
#WHERE genre = 'Rock';
WHERE genre LIKE '%Rock%';
#4f they do not include the other genres because it is looking for the exact string 