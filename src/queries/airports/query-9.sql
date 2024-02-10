/* For each Italian city, indicate the number of international flights departing. The list should only contain cities where this number is > 0. */

SELECT 
    FLIGHTS.DepartureCityName AS "City",
    COUNT(FlightId) as "International flights"
FROM 
    FLIGHTS
    INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
    INNER JOIN CITIES AS ARRIVAL ON FLIGHTS.ArrivalCityName = ARRIVAL.CityName
WHERE
    DEPARTURE.Country = 'ITA' AND
    ARRIVAL.Country <> 'ITA'
GROUP BY
    FLIGHTS.DepartureCityName;
