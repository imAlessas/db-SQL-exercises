/* For each song identifier, find the identifier of the album in which the song was first published and find the year of this publication. */

SELECT
    ALBUM_SONGS.SongId AS "Song ID",
    ALBUM_SONGS.AlbumId AS "Album ID",
    ALBUMS.AlbumYear AS "Year"
FROM
    ALBUM_SONGS
    INNER JOIN ALBUMS ON ALBUM_SONGS.AlbumId = ALBUMS.AlbumId
ORDER BY
    "Song ID";



/* In the previous query it was assumed that a song could not be in two albums but only in one. Let's assume that there are albums that contain a song which is already present in a different album. */
SELECT
    ALBUM_SONGS.SongId AS "Song ID",
    ALBUM_SONGS.AlbumId AS "Album ID",
    MIN(ALBUMS.AlbumYear) AS "Year"
FROM
    ALBUM_SONGS
    INNER JOIN ALBUMS ON ALBUM_SONGS.AlbumId = ALBUMS.AlbumId
GROUP BY
    "Song ID", "Album ID"
ORDER BY
    "Song ID";
