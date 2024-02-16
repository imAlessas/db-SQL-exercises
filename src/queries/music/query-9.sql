/* The names of the singers who have only sung as soloists.
     ► One non-soloist singer in two songs                           => should NOT appear in the result.
     ► One soloist singer in two songs                               => SHOULD appear in the result.
     ► One soloist singer in one song and not a soloist in another   => should NOT appear in the result.
*/

-- This view lists all the songs in which more than one singer sings
CREATE VIEW SONGS_NOT_SOLOIST AS (
    SELECT
        SongId
    FROM
        SONG_SINGERS
    GROUP BY
        SongId
    HAVING
        COUNT(PersonName) > 1
    ORDER BY
        SongId
);


-- Lists all the singers' names
SELECT
    PersonName as "Name"
FROM
    PEOPLE

EXCEPT

-- Lists all the singers who sang with other singer
SELECT DISTINCT
    SONG_SINGERS.PersonName as "Name"
FROM
    SONGS_NOT_SOLOIST
    INNER JOIN SONG_SINGERS ON SONGS_NOT_SOLOIST.SongId = SONG_SINGERS.SongId;


