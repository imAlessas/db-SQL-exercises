/* List the types of aircraft used in flights departing from Turin */

SELECT AircraftType
FROM FLIGHTS
WHERE DepartureCityName = 'Turin' AND AircraftType IS NOT NULL;
