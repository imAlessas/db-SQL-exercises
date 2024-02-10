/* Indicate the number of international flights departing on Monday from Venice. */

SELECT 
    COUNT(FLIGHTS.FlightId) AS "Number of flights"
FROM 
    FLIGHTS
WHERE
    FLIGHTS.DayOfWeek = 'LU' AND /* LU = Lunedi' which is Monday in italian*/
    FLIGHTS.DepartureCityName = 'Venice';

