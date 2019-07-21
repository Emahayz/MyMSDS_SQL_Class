-- Homework Week 1
-- Q1. Which destination in the flights database is the furthest distance away, based on information in the flights table.  
-- Show the SQL query(s) that support your conclusion.
Select Distinct flight, origin, dest, distance 
FROM flights.flights
Where distance in (select Max(distance)
FROM flights.flights);
-- Solution to Q1:
-- This result shows that Honolulu with distance of 4,983 miles is the farthest.

-- Q2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats?
-- Show the SQL statement(s) that support your result.
Select Engines, Max(seats), Manufacturer 
FROM planes
group by Engines;
-- Solution to Q2:
-- This result shows the number of engines (1,2,3,4) with plane manufactured by Douglas having the most number of seats.

-- Q3. Show the total number of flights.
Select count(*) 
FROM flights;
-- Solution to Q3:
-- This result shows the total number of flights as 327,346.

-- Q4. Show the total number of flights by airline (carrier).
Select carrier, Count(*) 
FROM flights 
Group By carrier;
-- Solution to Q4:
-- This result shows the total number of flights with Carrier B6 having 54,049 flights as the most.

-- Q5. Show all of the airlines, ordered by number of flights in descending order.
Select carrier, Count(*) 
as FlightCount 
FROM flights 
Group By carrier 
Order By FlightCount 
Desc;
-- Solution to Q5:
-- This result shows all the airlines with UA having the highest as 57,782 and OO having 29 flights.

-- Q6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
Select carrier, Count(*) 
As FlightCount 
FROM flights 
Group By carrier 
Order By FlightCount 
Desc limit 5;
-- Solution to Q6:
-- This result shows the top 5 airlines with UA having the highest as 57,782 flights.

-- Q7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater
-- ordered by number of flights in descending order.
Select carrier, Count(*) 
As FlightCount 
FROM flights 
Where distance	>=1000 
Group By carrier 
Order By FlightCount 
Desc limit 5 ;
-- Solution to Q7:
-- This result shows the top 5 airlines with distance >= 1,0000 miles (UA = 40,608 Miles).

-- Q8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it,
-- and write down both the question, and the query that answers the question.
-- Question: What is the minimum, maximum and average temperature of JFK airport in NY for the month of February 2013?
Select MIN(temp), Max(temp), AVG(temp) 
FROM weather
WHERE origin = "JFK"
and Year = 2013 AND Month = 2;
-- Solution to Q8:
-- This result shows the minimum, maximum and average temperature of JFK airport in NY for the month of February 2013.