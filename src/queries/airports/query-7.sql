/* The cities from which there are direct flights to Milan, ordered alphabetically. */

SELECT 
    FLIGHTS.DepartureCityName AS "Departure city"
FROM 
    FLIGHTS
WHERE 
    FLIGHTS.ArrivalCityName = 'Milan'
ORDER BY 
    FLIGHTS.DepartureCityName ASC;


