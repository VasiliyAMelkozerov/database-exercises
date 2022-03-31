USE albums_db;
#2 complete

SHOW tables;

describe albums;

SELECT * FROM albums;
#3 completed
#3a 31 rows in album

SELECT DISTINCT artist FROM albums;
#3b this bit of code reveals 23 different artists

SHOW CREATE TABLE albums;
#3c primary key is 'id'

SELECT name FROM albums WHERE artist='pink floyd' #OR artist = 'AC/DC';
