/* List every city connected to Melbourne by a flight (either departing from or arriving at Melbourne). */


SELECT DISTINCT
    FLIGHTS.ArrivalCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.DepartureCityName = 'Melbourne'

UNION

SELECT DISTINCT
    FLIGHTS.DepartureCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.ArrivalCityName = 'Melbourne';
