/* The names of the authors who have never sung a song and the names of the singers who have never written a song, listed in a single column. */

SELECT DISTINCT
    PEOPLE.PersonName AS "Name"
FROM
    PEOPLE
WHERE
    PEOPLE.PersonName NOT IN (
        SELECT DISTINCT
            SONG_AUTHORS.PersonName
        FROM
            SONG_AUTHORS
    )

UNION

SELECT DISTINCT
    PEOPLE.PersonName AS "Name"
FROM
    PEOPLE
WHERE
    PEOPLE.PersonName NOT IN (
        SELECT DISTINCT
            SONG_SINGERS.PersonName
        FROM
            SONG_SINGERS
    );



