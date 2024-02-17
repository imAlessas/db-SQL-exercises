/* The identifier of the album that contains the highest number of songs. */

SELECT
    ALBUM_SONGS.AlbumId AS "Album"
FROM
    ALBUM_SONGS
WHERE
    ALBUM_SONGS.TrackId = (
        -- Gets the maximum value of TrackId
        SELECT
            MAX(ALBUM_SONGS.TrackId)
        FROM
            ALBUM_SONGS
    );



/* Without using TrackId attribute */

SELECT
    ALBUM_SONGS.AlbumId AS "Album"
FROM
    ALBUM_SONGS
GROUP BY
    ALBUM_SONGS.AlbumId
HAVING
    COUNT(ALBUM_SONGS.SongId) = (
        -- Gets the maximum number of songs contained in an album 
        SELECT
            MAX("Tracks")
        FROM (
            -- Lists the number of songs for every album
            SELECT
                COUNT(ALBUM_SONGS.SongId) AS "Tracks"
            FROM
                ALBUM_SONGS
            GROUP BY
                ALBUM_SONGS.AlbumId
        )
    );
