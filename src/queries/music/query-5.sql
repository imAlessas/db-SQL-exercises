/* The identifier of the album that contains the highest number of songs. */

SELECT
    ALBUM_SONGS.AlbumId AS "Album"
FROM
    ALBUM_SONGS
WHERE
    ALBUM_SONGS.TrackId = (
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
WHERE


SELECT
    maxtracks."Album" AS "Album",
    MAX(maxtracks.Tracks)
FROM (
    SELECT
        ALBUM_SONGS.AlbumId AS "Album",
        COUNT(ALBUM_SONGS.SongId) AS "Tracks"
    FROM
        ALBUM_SONGS
    GROUP BY
        ALBUM_SONGS.AlbumId
) AS maxtracks;


