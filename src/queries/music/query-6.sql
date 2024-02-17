/* The identifiers of the albums containing songs that are all by a single singer and containing at least three songs from years preceding the album's year. */


-- Lists all the albums with only one singer
SELECT
    "Album"
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
HAVING
    COUNT("Singer") = 1


INTERSECT


-- Lists all the albums that have at least 3 songs which has been published before the album
SELECT
    ALBUM_SONGS.AlbumId AS "Album"
FROM
    ALBUM_SONGS
    INNER JOIN SONGS ON ALBUM_SONGS.SongId = SONGS.SongId
    INNER JOIN ALBUMS ON ALBUM_SONGS.AlbumId = ALBUMS.AlbumId
WHERE
    SONGS.SongYear < ALBUMS.AlbumYear
GROUP BY
    ALBUM_SONGS.AlbumId
HAVING
    COUNT(*) >= 3;




