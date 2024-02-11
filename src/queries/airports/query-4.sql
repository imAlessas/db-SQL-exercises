/* For flight with ID 56, list the day of the week, the departure country, and the arrival country. */

SELECT
    DayOfWeek AS "Day of week",
    DepartureCity.Country AS "Departure country",
    ArrivalCityName.Country AS "Arrival Country"
FROM 
    FLIGHTS
    INNER JOIN CITIES AS DepartureCity ON DepartureCity.CityName = FLIGHTS.DepartureCityName
    INNER JOIN CITIES AS ArrivalCityName ON ArrivalCityName.CityName = FLIGHTS.ArrivalCityName
WHERE
    FlightId = 56;

