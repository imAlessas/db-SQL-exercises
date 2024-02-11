/* The cities from which there are direct flights to Dubai, ordered alphabetically. */

SELECT 
    FLIGHTS.DepartureCityName AS "Departure city"
FROM 
    FLIGHTS
WHERE 
    FLIGHTS.ArrivalCityName = 'Dubai'
GROUP BY
    FLIGHTS.DepartureCityName
ORDER BY 
    FLIGHTS.DepartureCityName ASC;


