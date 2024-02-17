/* The names of the authors who have never sung a song and the names of the singers who have never written a song, listed in a single column. */

-- Lists all people who did not write any songs
SELECT DISTINCT
    PEOPLE.PersonName AS "Name"
FROM
    PEOPLE
WHERE
    PEOPLE.PersonName NOT IN (
        -- Lists all people who wrote at least one song
        SELECT DISTINCT
            SONG_AUTHORS.PersonName
        FROM
            SONG_AUTHORS
    )

UNION

-- Lists all people who did not sing any songs
SELECT DISTINCT
    PEOPLE.PersonName AS "Name"
FROM
    PEOPLE
WHERE
    PEOPLE.PersonName NOT IN (
        -- Lists all people who sang at least one song
        SELECT DISTINCT
            SONG_SINGERS.PersonName
        FROM
            SONG_SINGERS
    );



