# SQLZOO
## About
## Table of Content
1. [SELECT BASICS](#selectbasics)
2. a
3. a
4. a
5. a
6. a
7. 
<h2 id='selectbasics'>SELECT BASICS</h2>
-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';
-- Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany';

-- 2. Checking a list The word IN allows us to check if an item is in a list. 
-- The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). 
-- The example below shows countries with an area of 250,000-300,000 sq. km. 
-- Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

## SELECT QUIZ
-- 1. Select the code which produces this table
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000;

-- 2. Pick the result you would obtain from this code:
SELECT name, population
    FROM world
    WHERE name LIKE "Al%"
-- Answer: Table-E

-- 3. Select the code which shows the countries that end in A or L
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

-- 4. Pick the result from the query
-- Answer:
-- name	length(name)
-- Italy	5
-- Malta	5
-- Spain	5

-- 5. Pick the result you would obtain from this code:
SELECT name, area*2 FROM world WHERE population = 64000
-- Answer: Andora 936

-- 6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

-- 7. Select the code that shows the population density of China, Australia, Nigeria and France
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

 ## SELECT FROM WORLD
 -- 1. Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population 
FROM world;

-- 2. How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 
-- 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population>=200000000;

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, GDP/population as 'per capita GDP'
FROM world
WHERE population>=200000000;

-- 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 as 'population in m'
FROM world
WHERE continent = 'South America';

-- 5. Show the name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy');

-- 6. Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name like '%United%'

-- 7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. 
-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area>3000000 OR population>250000000;

-- 8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. 
-- Show name, population and area.
-- -Australia has a big area but a small population, it should be included.
-- -Indonesia has a big population but a small area, it should be included.
-- -China has a big population and big area, it should be excluded.
-- -United Kingdom has a small population and a small area, it should be excluded.
SELECT name, population, area
FROM world
WHERE area>3000000 XOR population>250000000;

-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
-- Use the ROUND function to show the values to two decimal places.
-- For Americas show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000,2), ROUND(GDP/1000000000,2)
FROM world
WHERE continent = 'South America';

-- 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). 
-- Round this value to the nearest 1000. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(GDP/population,-3)
FROM world
WHERE GDP>=1000000000000;

-- 11. Greece has capital Athens.
-- Each of the strings 'Greece', and 'Athens' has 6 characters.
-- Show the name and capital where the name and the capital have the same number of characters.
-- You can use the LENGTH function to find the number of characters in a string
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- 12. The capital of Sweden is Stockholm. Both words start with the letter 'S'.
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operator.
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND
name <> capital;

-- 13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
-- Find the country that has all the vowels and no spaces in its name.
-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
SELECT name
FROM world
WHERE name LIKE '%a%' AND
name LIKE '%e%' AND
name LIKE '%i%' AND
name LIKE '%o%' AND
name LiKE '%u%' AND
name NOT LIKE '% %';

## BBC QUIZ
-- 1. Select the code which gives the name of countries beginning with U
SELECT name
FROM world
WHERE name LIKE 'U%'

-- 2. Select the code which shows just the population of United Kingdom?
SELECT population
 FROM world
 WHERE name = 'United Kingdom'

-- 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
SELECT continent 
 FROM world 
 WHERE 'name' = 'France'
-- Answer: 'name' should be name

-- 4. Select the result that would be obtained from the following code:
SELECT name, population / 10 
FROM world 
WHERE population < 10000
-- Answer: Nauru/ 990

-- 5. Select the code which would reveal the name and population of countries in Europe and Asia.
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

-- 6. Select the code which would give two rows
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

-- 7. Select the result that would be obtained from this code:
SELECT name FROM world
 WHERE continent = 'South America'
   AND population > 40000000
-- Answer: Brazil/ Columbia

## SELECT FROM NOBEL TUTORIAL
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

## NOBEL QUIZ
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
