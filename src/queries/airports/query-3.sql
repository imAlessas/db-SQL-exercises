/* List the countries from which flights depart that can carry at least 200 passengers. */

SELECT
    Country, 
    COUNT(Country) AS "Flights"
FROM
    CITIES
    INNER JOIN FLIGHTS ON CITIES.CityName = FLIGHTS.DepartureCityName
    INNER JOIN AIRPLANE_TYPES ON FLIGHTS.AircraftType = AIRPLANE_TYPES.AircraftType
WHERE
    AIRPLANE_TYPES.Capacity >= 200
GROUP BY
    Country;
