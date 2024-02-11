/* Indicate the number of international flights departing on Monday from Manchester. */

SELECT 
    COUNT(FLIGHTS.FlightId) AS "Number of flights"
FROM 
    FLIGHTS
    INNER JOIN CITIES AS ARRIVAL ON FLIGHTS.ArrivalCityName = ARRIVAL.CityName
WHERE
    ARRIVAL.Country <> 'GRE' AND
    FLIGHTS.DayOfWeek = 'MO' AND
    FLIGHTS.DepartureCityName = 'Manchester';

