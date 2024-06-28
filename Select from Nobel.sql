-- 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT *
from nobel
WHERE yr = 1950;

-- 2. Show who won the 1962 prize for literature.
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE subject = 'peace' AND yr>=2000

-- 5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT *
FROM nobel
WHERE subject = 'literature' AND
yr BETWEEN 1980 AND 1989;

-- 6. Show all details of the presidential winners:
-- Theodore Roosevelt
-- Thomas Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
SELECT *
from nobel
WHERE winner IN ('Theodore Roosevelt', 'Thomas Woodrow Wilson',
'Jimmy Carter', 'Barack Obama');

-- 6. Show the winners with first name John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

-- 7. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner
FROM nobel
WHERE winner IN (SELECT winner FROM nobel WHERE yr = 1980 AND subject = 'physics') OR
winner IN (SELECT winner FROM nobel WHERE yr = 1984 AND subject = 'chemistry');

-- 8. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT yr, subject, winner
FROM nobel
WHERE subject NOT IN ('chemistry', 'medicine') AND yr = 1980;

-- 9. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 
-- 'Literature' prize in a later year (after 2004, including 2004)
SELECT * FROM nobel
WHERE winner IN (SELECT winner FROM nobel WHERE subject = 'medicine'AND yr<1910)
OR
winner IN (SELECT winner FROM nobel WHERE subject = 'literature' AND yr>=2004);

-- 10. Find all details of the prize won by PETER GRÜNBERG
select * from nobel
where winner in ('PETER GRÜNBERG');

-- 11. Find all details of the prize won by EUGENE O'NEILL
SELECT *
from nobel
WHERE winner = 'Eugene O''Neill';

-- 12. Knights in order
-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

-- 13. The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.
-- Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.


-- NOBEL QUIZ

-- 1. Pick the code which shows the name of winner's names beginning with C and ending in n
SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n';

-- 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960;

-- 3. Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');

-- 4. Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
-- Answer: Medicine/ Sir John Eccles, Medicine/ Sir Frank Macfarlane Burnet

-- 5. Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'));

-- 6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- 7. Pick the result that would be obtained from the following code:
SELECT subject, COUNT(subject) 
   FROM nobel 
  WHERE yr ='1960' 
GROUP BY subject
-- Answer:
-- Chemistry1
-- Literature1
-- Medicine2
-- Peace1
-- Physics1