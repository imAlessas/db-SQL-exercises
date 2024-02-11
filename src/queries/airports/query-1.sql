/* List the scheduled flights using a known type of aircraft. */

SELECT * 
FROM
    FLIGHTS
WHERE
    AircraftType IS NOT NULL;
