-- Q1) Which destination in the flights database is the furtherest distance away, based on informationin the flights table?
-- Show the SQL query(s) that support your conclusion.
-- select MAX(distance) as furthest from flights;
select origin, dest from flights
where distance >= 4890
limit 1;

-- Q2) What are the different numbers of engines in the planes table? 
-- For each number of engines, which aircraft have the most number of seats?
select manufacturer, 
COUNT(model)
from planes
group by manufacturer
order by COUNT(seats) DESC;

-- Q3) Show the total number of flights.
SELECT 'flights', COUNT(*) FROM flights;

-- Q4) Show the total number of flights by airline (carrier).
SELECT carrier,
  COUNT(flight)
from flights
group by carrier;

-- Q5) Show all of the airlines, ordered by number of flights in descending order.
SELECT carrier,
  COUNT(flight)
from flights
group by carrier
order by COUNT(flight) DESC;

-- Q6) Show only the top 5 airlines, by number of flights, ordered by number of flights in
-- descending order.
SELECT carrier,
  COUNT(flight)
from flights
group by carrier
order by COUNT(flight) DESC
LIMIT 5;

-- Q7) Show only the top 5 airlines, by number of fights of distance 1000 miles or greater,
-- ordered by number of flights in descending order.
select carrier from flights
where distance >= 1000
order by distance DESC
limit 5;

-- Q8) Create a question that (a) uses data from the flight database and (b) requires aggregation 
-- to answer it and write down both the question and the query that answers the question.
-- Show the total number of flights that have left from airports located in New York City.
SELECT origin,
  COUNT(flight)
FROM flights
group by origin
order by COUNT(flight)
LIMIT 2;