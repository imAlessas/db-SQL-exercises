/* The names of the singers who have never sung a song as soloists. */

-- This view contains the number of the singers who sing in the specific song
CREATE VIEW SINGERS_PER_SONG AS (
    SELECT
        SongId,
        COUNT(*) AS "Number"
    FROM
        SONG_SINGERS
    GROUP BY
        SongId
    ORDER BY
        SongId
);

-- Lists all the singers' name
SELECT
    PEOPLE.PersonName AS "Name"
FROM
    PEOPLE

EXCEPT

-- Lists singers who sung as soloist
SELECT DISTINCT
    SONG_SINGERS.PersonName AS "Name"
FROM
    SONG_SINGERS
    INNER JOIN SINGERS_PER_SONG ON SONG_SINGERS.SongId = SINGERS_PER_SONG.SongId
WHERE
    SINGERS_PER_SONG."Number" = 1;





