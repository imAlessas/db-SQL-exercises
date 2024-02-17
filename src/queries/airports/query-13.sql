/* List the cities served by aircraft types with the maximum capacity. The list should have a single column. */


-- Lists the cities that have flights with maximum capacity departing
SELECT DISTINCT
    FLIGHTS.DepartureCityName AS "City"
FROM
    FLIGHTS
    INNER JOIN AIRPLANE_TYPES ON FLIGHTS.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
    AIRPLANE_TYPES.Capacity = ( 
        -- Gets the maximum capacity value of the airplanes
        SELECT
            MAX(Capacity)
        FROM
            AIRPLANE_TYPES
    )

UNION


-- Lists the cities that have flights with maximum capacity arriving
SELECT DISTINCT
    FLIGHTS.ArrivalCityName AS "City"
FROM
    FLIGHTS
    INNER JOIN AIRPLANE_TYPES ON FLIGHTS.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
    AIRPLANE_TYPES.Capacity = ( 
        -- Gets the maximum capacity value of the airplanes
        SELECT
            MAX(Capacity)
        FROM
            AIRPLANE_TYPES
    )

-- Note that in this scenario, using a VIEW could have been beneficial, eliminating the need to rewrite the nested query twice.





/* Solution without JOIN */

-- Lists the cities that have flights with maximum capacity departing
SELECT DISTINCT
    FLIGHTS.DepartureCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.AircraftType = (
        -- Lists all the planes who have maximum capacity
        SELECT
            AIRPLANE_TYPES.AircraftType
        FROM
            AIRPLANE_TYPES
        WHERE
            AIRPLANE_TYPES.Capacity = (
                -- Gets the maximum capacity
                SELECT
                    MAX(Capacity)
                FROM
                    AIRPLANE_TYPES
            )
    )

UNION

-- Lists the cities that have flights with maximum capacity arriving
SELECT DISTINCT
    FLIGHTS.ArrivalCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.AircraftType = (
        -- Lists all the planes who have maximum capacity
        SELECT
            AIRPLANE_TYPES.AircraftType
        FROM
            AIRPLANE_TYPES
        WHERE
            AIRPLANE_TYPES.Capacity = (
                -- Gets the maximum capacity
                SELECT
                    MAX(Capacity)
                FROM
                    AIRPLANE_TYPES
            )
    );

-- Note that in this scenario, using a VIEW could have been beneficial too
