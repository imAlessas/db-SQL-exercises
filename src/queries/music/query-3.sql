/* The names of individuals whose names start with "T" and who have sung a song written by them. */

SELECT DISTINCT
    SONG_SINGERS.PersonName AS "Name"
FROM
    SONG_SINGERS
    INNER JOIN SONG_AUTHORS ON SONG_SINGERS.SongId = SONG_AUTHORS.SongId
WHERE
    SONG_SINGERS.PersonName = SONG_AUTHORS.PersonName AND
    SONG_SINGERS.PersonName LIKE 'T%';
