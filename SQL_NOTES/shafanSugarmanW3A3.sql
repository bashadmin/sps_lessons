-- the MySQL root password: cUny$p$_7
-- Aggregation functions apply to all rows selected in a query such as SUM(), MIN(),MAX(),COUNT(),
-- You can use where to single out specfics, you can also groupby loginID
-- Order By always goes after GROUP By and then you can set desc or asc
-- You may also group by aggregate functions

-- 1) Show the total number of flights.
SELECT COUNT(flight) FROM flights;

-- 2) Show the total number of flights by airline (carrier).
SELECT carrier, COUNT(flight) 
FROM flights
GROUP BY carrier;

-- 3) Show all of the airlines, ordered by number of flights in descending order.
SELECT carrier, COUNT(flight) 
FROM flights
GROUP BY carrier
ORDER BY COUNT(flight) DESC;

-- 4) Show only the top 5 airlines, by number of flights, ordered by number of
-- flights in descending order.
SELECT carrier, COUNT(flight) 
FROM flights
GROUP BY carrier
HAVING COUNT(*) >= 27000
ORDER BY COUNT(flight) DESC;


-- 5) Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater,
-- ordered by number of flights in descending order
SELECT airline, COUNT(flight)
FROM
(select carrier as airline,
distance
flight
FROM
flights
where distance >= 1000) newTable
GROUP BY airline
ORDER BY COUNT(flight) DESC
LIMIT 5;

-- 6) How many flights came out of JFK airport?
SELECT 
origin, 
COUNT(flight) 
FROM flights
WHERE origin = 'JFK'
GROUP BY origin;