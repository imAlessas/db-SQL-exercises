/*  List the cities connected EXCLUSIVELY by Tuesday flights, meaning flights departing from or arriving at these cities only on Tuesdays. The list should have a single column. Avoid using JOIN. */



-- Lists all the cities that have flights departing or arriving
( 
    -- Lists cities that have flights departing 
    SELECT 
        FLIGHTS.DepartureCityName AS "City"
    FROM
        FLIGHTS

    UNION

    -- Lists cities that have flights arriving
    SELECT 
        FLIGHTS.ArrivalCityName AS "City"
    FROM
        FLIGHTS
)

EXCEPT

-- Lists all the cities that have flights departing or arriving any day but Tuesday
(
    -- Lists all the cities that have flights departing any day but Tuesday
    SELECT 
        FLIGHTS.DepartureCityName AS "City"
    FROM
        FLIGHTS
    WHERE
        FLIGHTS.DayOfWeek <> 'TU'

    UNION

    -- -- Lists all the cities that have flights arriving any day but Tuesday
    SELECT 
        FLIGHTS.ArrivalCityName AS "City"
    FROM
        FLIGHTS
    WHERE
        FLIGHTS.DayOfWeek <> 'TU'
);




