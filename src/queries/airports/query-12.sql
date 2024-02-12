/*  List the cities connected EXCLUSIVELY by Tuesday flights, meaning flights departing from or arriving at these cities only on Tuesdays. The list should have a single column. Avoid using JOIN. */

(
    SELECT 
        FLIGHTS.DepartureCityName AS "City"
    FROM
        FLIGHTS

    UNION

    SELECT 
        FLIGHTS.ArrivalCityName AS "City"
    FROM
        FLIGHTS
)

EXCEPT

(
    SELECT 
        FLIGHTS.DepartureCityName AS "City"
    FROM
        FLIGHTS
    WHERE
        FLIGHTS.DayOfWeek <> 'TU'

    UNION

    SELECT 
        FLIGHTS.ArrivalCityName AS "City"
    FROM
        FLIGHTS
    WHERE
        FLIGHTS.DayOfWeek <> 'TU'
);




