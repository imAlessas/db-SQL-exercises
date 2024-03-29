/* The names of the singers who have never sung an entire album alone. */


--  The view contains the number of singers per album
CREATE VIEW SINGERS_PER_ALBUM AS (
    SELECT
        "Album",
        COUNT("Singer") AS "Singers"
    FROM (
        -- Lists all the singers per album
        SELECT
            SONG_SINGERS.PersonName AS "Singer",
            ALBUM_SONGS.AlbumId AS "Album"
        FROM
            ALBUM_SONGS
            INNER JOIN SONGS ON ALBUM_SONGS.SongId = SONGS.SongId
            INNER JOIN SONG_SINGERS ON SONGS.SongId = SONG_SINGERS.SongId
        GROUP BY
            SONG_SINGERS.PersonName, ALBUM_SONGS.AlbumId
    )
    GROUP BY
        "Album"
);


SELECT
    SONG_SINGERS.PersonName AS "Singer"
FROM
    ALBUM_SONGS
    INNER JOIN SONGS ON ALBUM_SONGS.SongId = SONGS.SongId
    INNER JOIN SONG_SINGERS ON SONGS.SongId = SONG_SINGERS.SongId
WHERE
    ALBUM_SONGS.AlbumId IN (
        -- Lists the albums with more than one singer
        SELECT
            "Album"
        FROM
            SINGERS_PER_ALBUM
        WHERE
            "Singers" > 1
    )
GROUP BY
    SONG_SINGERS.PersonName;

