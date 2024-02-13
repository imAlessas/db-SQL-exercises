/* The titles and singers of the songs from the album with identifier 3, sorted by track identifier. */

SELECT
    SONGS.SongTitle AS "Title",
    SONG_SINGERS.PersonName AS "Singer"
FROM
    ALBUM_SONGS
    INNER JOIN SONGS ON ALBUM_SONGS.SongId = SONGS.SongId
    INNER JOIN SONG_SINGERS ON SONGS.SongId = SONG_SINGERS.SongId
WHERE
    ALBUM_SONGS.AlbumId = 3
ORDER BY
    ALBUM_SONGS.TrackId;

