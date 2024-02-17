# Exercises using SQL

In this repository are listed some of the SQL exercises used in preparation for the _Database 1_ exam at the University of Padova.

## Airports

The first database contains three tables: _Cities_, _Airplane\_Types_ and _Flights_ and it is structured as follows:

> ___Cities___ (__CityName__, Country)
>
>___Airplane\_Types___(__AircraftType__, Capacity)
>
> ___Flights___(__FlightID__, DayOfWeek, _DepartureCityName_, _ArrivalCityName_, _AircraftType_)

The creation of the database can be achieved by running on your DBMS the script shown in [airports-db.sql](src/db-creation-files/airports-db.sql) file, where the tables are created and the inserts are randomly generated.

### Queries

The following queries are implemented. It is strongly recommended to analyze the query code, this list's purpose is to specify the contract utilized in the query but it does not explain the query functioning.

#### [query-1](src/queries/airports/query-1.sql)

_List the scheduled flights using a known type of aircraft._ This is a simple query example with the three basic statements, `SELECT` `FROM` `WHERE`

#### [query-2](src/queries/airports/query-2.sql)

_List the types of aircraft used in flights departing from Singapore._ This is a simple query with the introduction of the boolean operator `AND`

#### [query-3](src/queries/airports/query-3.sql)

_List the countries from which flights depart that can carry at least 200 passengers._ In this query, the `INNER JOIN` operation is introduced

#### [query-4](src/queries/airports/query-4.sql)

_For the flight with ID 56, list the day of the week, the departure country, and the arrival country._ Here, the `INNER JOIN` operation is accomplished two times on the same table

#### [query-5](src/queries/airports/query-5.sql)

_List the cities from which international flights depart._ Like in the 4th, the `JOIN` operation is done 2 times in the same table

#### [query-6](src/queries/airports/query-6.sql)

_For each flight departing from Rome, list the arrival city and, if available, the type and capacity of the aircraft._ In this case, the `LEFT JOIN` is utilized instead

#### [query-7](src/queries/airports/query-7.sql)

_List the cities from which there are direct flights to Osaka, ordered alphabetically._ In this query, the `GROUP` BY` and `ORDER BY` statements are combined

#### [query-8](src/queries/airports/query-8.sql)

_Indicate the number of international flights departing on Monday from Manchester._ The mathematical function `COUNT()` is introduced

#### [query-9](src/queries/airports/query-9.sql)

_For each Italian city, indicate the number of international flights departing. The list should only contain cities where this number is > 0._ Here we can find a combination of `COUNT()` and `GROUP BY` statements

#### [query-10](src/queries/airports/query-10.sql)

_List the French cities from which more than two flights depart weekly directly to Italy._ In this query, it is used the `HAVING` statement in combination with `COUNT()` function

#### [query-11](src/queries/airports/query-11.sql)

_List every city connected to Melbourne by a flight (either departing from or arriving at Melbourne)._ The set operation `UNION` is used between two queries

#### [query-12](src/queries/airports/query-12.sql)

_List the cities connected EXCLUSIVELY by Tuesday flights, meaning flights departing from or arriving at these cities only on Tuesdays. The list should have a single column. Avoid using __JOIN__._ Here we can find a combination of `UNION` and `EXCEPT` set operations

#### [query-13](src/queries/airports/query-13.sql)

_List the cities served by aircraft types with the maximum capacity. The list should have a single column._ Here, the __nested__ queries are introduced

#### [query-14](src/queries/airports/query-14.sql)

_List the Spanish cities with the highest "reception." The reception of a city is obtained by summing the capacity of the flights arriving in that city. The list should have a single column._

#### [query-15](src/queries/airports/query-15.sql)

_List the USA cities from which there are no flights departing for abroad. The list should have a single column._ In this query, it can be used both `NOT IN` and `NOT EXISTS`, operators

#### [query-16](src/queries/airports/query-16.sql)

_For each city, list the types of aircraft with the minimum capacity among all flights departing from that city._ The first case of intra-query join.

## Music

The second database contains all the tables needed to manage music albums of different singers. Its structure is the following:

> ___People___(__PersonName__, BirthYear)
>
> ___Songs___(__SongID__, SongTitle, SongYear)
>
> ___Song\_Authors___(__PersonName__, ___SongID___)
>
> ___Song\_Singers___(__PersonName__, ___SongID___)
>
> ___Albums___(__AlbumID__, AlbumTile, AlbumYear)
>
> ___Album_Songs___(___AlbumID___, __TrackID__, _SongID_)

The creation of the database can be achieved by running on your DBMS the script shown in [music-db.sql](src/db-creation-files/music-db.sql) file.

### Queries

The following queries are implemented. It is strongly recommended to analyze the query code, this list's purpose is to specify the contract utilized in the query but it does not explain the query functioning.

#### [query-1](src/queries/music/query-1.sql)

_The titles of the albums that contain at least one popular song.  A popular song is a song whose publication date is unknown._ In this query, a __nested__ query is utilized-

#### [query-2](src/queries/music/query-2.sql)

_The titles and singers of the songs from the album with identifier 3, sorted by track identifier._ This query has been implemented by the `ORDER BY` construct.

#### [query-3](src/queries/music/query-3.sql)

_The names of individuals whose names start with "T" and who have sung a song written by them._ In this query the `LIKE` construct is used for the first time.

#### [query-4](src/queries/music/query-4.sql)

_The names of the authors who have never sung a song and the names of the singers who have never written a song, listed in a single column._ The query is implemented by the `UNION` set operator and using the construct `NOT IN` and `DISTINCT`.

#### [query-5](src/queries/music/query-5.sql)

_The identifier of the album that contains the highest number of songs._ This query calculates the maximum through 2 nested queries. The first one is used in the `HAVING` statement while the second is used in the `FROM` statement of the first nested query. Note that this query could be implemented by using a __view__.

#### [query-6](src/queries/music/query-6.sql)

_The identifiers of the albums containing songs that are all by a single singer and containing at least three songs from years preceding the album's year._ To implement this query uses the `INTERSECT` operator between two othe queries in which there is the `COUNT` operation in the `HAVING` statement.

#### [query-7](src/queries/music/query-7.sql)

_The names of the singers who have never sung an entire album alone._ In this query a `VIEW` is implemented to improve the readibility of the query.

#### [query-8](src/queries/music/query-8.sql)

_The names of the singers who have never sung a song as soloists._ This query uses a `VIEW` construct and then intersects two other queries.


#### [query-9](src/queries/music/query-9.sql)

_The names of the singers who have only sung as soloists._ A similar apporach is used here as well, relying on a `VIEW` and to the `EXCEPT` set operator.

#### [query-10](src/queries/music/query-10.sql)

_For each song identifier, find the identifier of the album in which the song was first published and find the year of this publication._