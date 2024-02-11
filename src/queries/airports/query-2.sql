/* List the types of aircraft used in flights departing from Singapore */

SELECT
    AircraftType
FROM
    FLIGHTS
WHERE
    DepartureCityName = 'Singapore' AND
    AircraftType IS NOT NULL;
