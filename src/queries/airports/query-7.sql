/* The cities from which there are direct flights to Osaka, ordered alphabetically. */

SELECT 
    FLIGHTS.DepartureCityName AS "Departure city"
FROM 
    FLIGHTS
WHERE 
    FLIGHTS.ArrivalCityName = 'Osaka'
GROUP BY
    FLIGHTS.DepartureCityName
ORDER BY 
    FLIGHTS.DepartureCityName ASC;


