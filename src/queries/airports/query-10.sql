/* List the French cities from which more than two flights depart weekly directly to Italy. */

SELECT
    FLIGHTS.DepartureCityName AS "City"
FROM
    FLIGHTS
    INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
    INNER JOIN CITIES AS ARRIVAL ON FLIGHTS.ArrivalCityName = ARRIVAL.CityName
WHERE
    DEPARTURE.Country = 'FRA' AND
    ARRIVAL.Country = 'ITA'
GROUP BY
    FLIGHTS.DepartureCityName 
HAVING
    COUNT(*) > 2;


