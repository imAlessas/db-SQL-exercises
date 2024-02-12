/* List the cities served by aircraft types with the maximum capacity. The list should have a single column. */

SELECT DISTINCT
    FLIGHTS.DepartureCityName AS "City"
FROM
    FLIGHTS
    INNER JOIN AIRPLANE_TYPES ON FLIGHTS.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
    AIRPLANE_TYPES.Capacity = ( SELECT
                                    MAX(Capacity)
                                FROM
                                    AIRPLANE_TYPES)

UNION

SELECT DISTINCT
    FLIGHTS.ArrivalCityName AS "City"
FROM
    FLIGHTS
    INNER JOIN AIRPLANE_TYPES ON FLIGHTS.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
    AIRPLANE_TYPES.Capacity = ( SELECT
                                    MAX(Capacity)
                                FROM
                                    AIRPLANE_TYPES);





/* Solution without JOIN */

SELECT DISTINCT
    FLIGHTS.DepartureCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.AircraftType = (SELECT
                                AIRPLANE_TYPES.AircraftType
                            FROM
                                AIRPLANE_TYPES
                            WHERE
                                AIRPLANE_TYPES.Capacity = (SELECT
                                                                MAX(Capacity)
                                                            FROM
                                                                AIRPLANE_TYPES))

UNION

SELECT DISTINCT
    FLIGHTS.ArrivalCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.AircraftType = (SELECT
                                AIRPLANE_TYPES.AircraftType
                            FROM
                                AIRPLANE_TYPES
                            WHERE
                                AIRPLANE_TYPES.Capacity = (SELECT
                                                                MAX(Capacity)
                                                            FROM
                                                                AIRPLANE_TYPES));


