/* For flight with ID 13, list the day of the week, the departure country, and the arrival country. */

SELECT *
    DayOfWeek AS "Day of week",
    Country AS "Departure country",
    Country AS "Arrival Country"
FROM 
    FLIGHTS
    INNER JOIN CITIES ON CITIES.CityName = FLIGHTS.DepartureCityName
WHERE
    FlightId = 13;

