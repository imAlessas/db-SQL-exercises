/* List every city connected to Melbourne by a flight (either departing from or arriving at Melbourne). */


-- Lists the cities DEPARTING from Melbourne
SELECT DISTINCT
    FLIGHTS.ArrivalCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.DepartureCityName = 'Melbourne'

UNION

-- Lists the citi ARRIVING to Melbourne
SELECT DISTINCT
    FLIGHTS.DepartureCityName AS "City"
FROM
    FLIGHTS
WHERE
    FLIGHTS.ArrivalCityName = 'Melbourne';
