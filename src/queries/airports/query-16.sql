/* For each city, list the types of aircraft with the minimum capacity among all flights departing from that city. */

SELECT DISTINCT
    FLIGHTS_1.DepartureCityName AS "City",
    AIRPLANE_TYPES.AircraftType AS "Aircraft"
FROM
    FLIGHTS AS FLIGHTS_1
    INNER JOIN AIRPLANE_TYPES ON FLIGHTS_1.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
     AIRPLANE_TYPES.AircraftType = (
        SELECT 
            MIN(AIRPLANE_TYPES.AircraftType) AS "Min capacity"
        FROM 
            FLIGHTS AS FLIGHTS_2
            INNER JOIN AIRPLANE_TYPES ON FLIGHTS_2.AircraftType = AIRPLANE_TYPES.AircraftType
        WHERE
            FLIGHTS_1.DepartureCityName = FLIGHTS_2.DepartureCityName
        GROUP BY
            FLIGHTS_2.DepartureCityName
     );






