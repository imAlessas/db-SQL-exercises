/* List the cities from which international flights depart. */

SELECT
    DEPARTURE.CityName AS "City"
FROM
    FLIGHTS
    INNER JOIN CITIES AS DEPARTURE ON DEPARTURE.CityName = FLIGHTS.DepartureCityName
    INNER JOIN CITIES AS ARRIVAL ON ARRIVAL.CityName = FLIGHTS.ArrivalCityName
WHERE
    DEPARTURE.Country <> ARRIVAL.Country
GROUP BY
    DEPARTURE.CityName;



