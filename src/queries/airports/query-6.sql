/* For each flight departing from Milan, list the arrival city and, if available, the type and capacity of the aircraft. */

SELECT
    FLIGHTS.ArrivalCityName AS "Arrival",
    AIRPLANE_TYPES.AircraftType AS " Aircraft type",
    AIRPLANE_TYPES.Capacity AS " Aircraft capacity"
FROM
    FLIGHTS
    LEFT JOIN AIRPLANE_TYPES ON FLIGHTS.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
    FLIGHTS.DepartureCityName = 'Milan';

