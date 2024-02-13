/* The titles of the albums that contain at least one popular song.  A popular song is a song whose publication date is unknown */


SELECT 
    ALBUMS.AlbumTitle AS "Album"
FROM
    ALBUMS
    INNER JOIN ALBUM_SONGS ON ALBUMS.AlbumId = ALBUM_SONGS.AlbumId
WHERE
    ALBUM_SONGS.SongId = (
        SELECT
            SongId
        FROM
            SONGS
        WHERE
            SONGS.SongYear IS NULL
    );

