/* List the scheduled flights using a known type of aircraft. */

SELECT * 
FROM FLIGHTS
WHERE AIRCRAFTTYPE IS NOT NULL;
