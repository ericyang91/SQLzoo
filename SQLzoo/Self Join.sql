-- 1. How many stops are in the database.
SELECT COUNT(id) as 'Stop Count'
    FROM stops;

-- 2. Find the id value for the stop 'Craiglockhart'
SELECT id
    FROM stops
    WHERE name = 'Craiglockhart';

-- 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name
    FROM stops INNER JOIN route ON (stops.id = route.stop)
    WHERE num = 4 AND company = 'LRT';

-- 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). 
-- Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
    FROM route WHERE stop=149 OR stop=53
    GROUP BY company, num
    HAVING COUNT(*) = 2;

-- 5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. 
-- Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;

-- 6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. 
-- Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

-- 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT a.company, a.num
    FROM route a JOIN route b ON a.num = b.num AND a.company = b.company
    WHERE a.stop = 115 AND b.stop = 137
    GROUP BY num, company;

-- 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, b.num
    FROM route a JOIN route b ON a.num = b.num AND a.company = b.company
    JOIN stops startstop ON a.stop = startstop.id
    JOIN stops endstop ON b.stop = endstop.id
    WHERE startstop.name = 'Craiglockhart' AND endstop.name = 'Tollcross';

-- 9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. 
-- Include the company and bus no. of the relevant services.
SELECT endstop.name, a.company, a.num
    FROM route a JOIN route b ON a.num = b.num AND a.company = b.company
    JOIN stops startstop ON a.stop = startstop.id
    JOIN stops endstop ON b.stop = endstop.id
    WHERE startstop.name = 'Craiglockhart' AND a.company = 'LRT';

-- 10. Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus.
-- Hint: Self-join twice to find buses that visit Craiglockhart and Lochend, then join those on matching stops.
SELECT X.num, X.company, X.name, Y.num, Y.company
FROM
    (SELECT start.num, start.company, transferstop.name
    FROM route start
    JOIN route mid ON start.num = mid.num AND start.company = mid.company
    JOIN stops startstop ON start.stop = startstop.id
    JOIN stops transferstop ON mid.stop = transferstop.id
    WHERE startstop.name = 'Craiglockhart') X
JOIN
    (SELECT end.num, end.company, transferstop.name
    FROM route mid
    JOIN route end ON mid.num = end.num AND mid.company = end.company
    JOIN stops transferstop ON mid.stop = transferstop.id
    JOIN stops endstop ON end.stop = endstop.id
    WHERE endstop.name = 'LOCHEND') Y
ON X.name = Y.name
ORDER BY X.num, X.name, Y.num;

-- MAKE SURE YOU DON'T JOIN NUM COMPANY FOR THE FIRST AND SECOND ROUTES AS THE TRANSFER FOR THE SECOND ROUTE WILL ONLY BE LIMITED TO THE NUMBER AND COMPANIES YOU USED ON YOUR FIRST TRIP!



-- Self Join Quiz

-- 1. Select the code that would show it is possible to get from Craiglockhart to Haymarket
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
WHERE a.name='Craiglockhart' AND b.name ='Haymarket';

-- 2. Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'
 
-- 3. Select the code that shows the services available from Tollcross?
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross' 