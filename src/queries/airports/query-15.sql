/* List the USA cities from which there are no flights departing for abroad. The list should have a single column. */



/*Only with set operators. */

SELECT DISTINCT
    FLIGHTS.DepartureCityName as "City"
FROM
    FLIGHTS
    INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
    INNER JOIN CITIES AS ARRIVAL ON FLIGHTS.ArrivalCityName = ARRIVAL.CityName
WHERE 
    DEPARTURE.Country = 'USA' AND
    DEPARTURE.Country = ARRIVAL.Country

EXCEPT

SELECT DISTINCT
    FLIGHTS.DepartureCityName as "City"
FROM
    FLIGHTS
    INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
    INNER JOIN CITIES AS ARRIVAL ON FLIGHTS.ArrivalCityName = ARRIVAL.CityName
WHERE 
    DEPARTURE.Country = 'USA' AND
    DEPARTURE.Country <> ARRIVAL.Country;




/* With a nested independent query using the NOT IN operator. */

SELECT DISTINCT
    FLIGHTS.DepartureCityName as "City"
FROM
    FLIGHTS
    INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
WHERE 
    DEPARTURE.Country = 'USA' AND
    FLIGHTS.DepartureCityName NOT IN (
        SELECT DISTINCT
            FLIGHTS.DepartureCityName as "City"
        FROM
            FLIGHTS
            INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
            INNER JOIN CITIES AS ARRIVAL ON FLIGHTS.ArrivalCityName = ARRIVAL.CityName
        WHERE 
            DEPARTURE.Country = 'USA' AND
            DEPARTURE.Country <> ARRIVAL.Country
    );



/* With a nested query connected using the NOT EXISTS operator. */ 

SELECT DISTINCT
    FLIGHTS.DepartureCityName as "City"
FROM
    FLIGHTS
    INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
WHERE 
    DEPARTURE.Country = 'USA' AND
    NOT EXISTS (
        SELECT DISTINCT
            FLIGHTS.DepartureCityName as "City"
        FROM
            FLIGHTS
            INNER JOIN CITIES AS DEPARTURE ON FLIGHTS.DepartureCityName = DEPARTURE.CityName
            INNER JOIN CITIES AS ARRIVAL ON FLIGHTS.ArrivalCityName = ARRIVAL.CityName
        WHERE 
            DEPARTURE.Country = 'USA' AND
            DEPARTURE.Country <> ARRIVAL.Country
    );


