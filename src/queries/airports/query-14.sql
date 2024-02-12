/* List the Spanish cities with the highest "reception." The reception of a city is obtained by summing the capacity of the flights arriving in that city. The list should have a single column.*/

SELECT
    FLIGHTS.ArrivalCityName AS "City"
FROM
    FLIGHTS
    INNER JOIN CITIES ON FLIGHTS.ArrivalCityName = CITIES.CityName
    INNER JOIN AIRPLANE_TYPES ON FLIGHTS.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
    CITIES.Country = 'ESP'
GROUP BY
    FLIGHTS.ArrivalCityName
ORDER BY
    SUM(AIRPLANE_TYPES.Capacity) DESC;

/* May be wrong ↑ */


