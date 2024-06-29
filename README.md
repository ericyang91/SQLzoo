# SQLZOO

## Table of Content
1. [SELECT BASICS](#select-basics)
2. [SELECT QUIZ](#select-quiz)
3. [SELECT FROM WORLD](#select-from-world)
4. [BBC QUIZ](#bbc-quiz)
5. [SELECT FROM NOBEL TUTORIAL](#select-from-nobel-tutorial)
6. [NOBEL QUIZ](#nobel-quiz)
7. [SELECT WITHIN SELECT TUTORIAL](#select-within-select-tutorial)
8. [NESTED SELECT QUIZ](#nested-select-quiz)
9. [SUM AND COUNT](#sum-and-count)
10. [SUM AND COUNT QUIZ](#sum-and-count-quiz)
11. [THE JOIN OPERATION](#the-join-operation)
12. [JOIN QUIZ](#join-quiz)
13. [MORE JOIN OPERATIONS](#more-join-operations)
14. [MORE JOIN QUIZ](#more-join-quiz)
15. [USING NULL](#using-null)

## SELECT BASICS

1. The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes'. Modify it to show the population of Germany:
    ```sql
    SELECT population FROM world
    WHERE name = 'Germany';
    ```

2. Checking a list: The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India', and 'China'. Show the name and the population for 'Sweden', 'Norway', and 'Denmark':
    ```sql
    SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway', 'Denmark');
    ```

3. Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000:
    ```sql
    SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000;
    ```

## SELECT QUIZ

1. Select the code which produces this table:
    ```sql
    SELECT name, population
    FROM world
    WHERE population BETWEEN 1000000 AND 1250000;
    ```

2. Pick the result you would obtain from this code:
    ```sql
    SELECT name, population
    FROM world
    WHERE name LIKE "Al%";
    ```
    **Answer:** Table-E

3. Select the code which shows the countries that end in A or L:
    ```sql
    SELECT name FROM world
    WHERE name LIKE '%a' OR name LIKE '%l';
    ```

4. Pick the result from the query:
    ```sql
    -- Answer:
    -- name	length(name)
    -- Italy	5
    -- Malta	5
    -- Spain	5
    ```

5. Pick the result you would obtain from this code:
    ```sql
    SELECT name, area*2 FROM world WHERE population = 64000;
    ```
    **Answer:** Andorra 936

6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000:
    ```sql
    SELECT name, area, population
    FROM world
    WHERE area > 50000 AND population < 10000000;
    ```

7. Select the code that shows the population density of China, Australia, Nigeria, and France:
    ```sql
    SELECT name, population/area
    FROM world
    WHERE name IN ('China', 'Nigeria', 'France', 'Australia');
    ```

## SELECT FROM WORLD

1. Read the notes about this table. Observe the result of running this SQL command to show the name, continent, and population of all countries:
    ```sql
    SELECT name, continent, population 
    FROM world;
    ```

2. How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros:
    ```sql
    SELECT name FROM world
    WHERE population >= 200000000;
    ```

3. Give the name and the per capita GDP for those countries with a population of at least 200 million:
    ```sql
    SELECT name, GDP/population as 'per capita GDP'
    FROM world
    WHERE population >= 200000000;
    ```

4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions:
    ```sql
    SELECT name, population/1000000 as 'population in m'
    FROM world
    WHERE continent = 'South America';
    ```

5. Show the name and population for France, Germany, Italy:
    ```sql
    SELECT name, population
    FROM world
    WHERE name IN ('France', 'Germany', 'Italy');
    ```

6. Show the countries which have a name that includes the word 'United':
    ```sql
    SELECT name
    FROM world
    WHERE name LIKE '%United%';
    ```

7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. Show the countries that are big by area or big by population. Show name, population, and area:
    ```sql
    SELECT name, population, area
    FROM world
    WHERE area > 3000000 OR population > 250000000;
    ```

8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population, and area:
    ```sql
    SELECT name, population, area
    FROM world
    WHERE area > 3000000 XOR population > 250000000;
    ```

9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places:
    ```sql
    SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
    FROM world
    WHERE continent = 'South America';
    ```

10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000. Show per-capita GDP for the trillion-dollar countries to the nearest $1000:
    ```sql
    SELECT name, ROUND(GDP/population, -3)
    FROM world
    WHERE GDP >= 1000000000000;
    ```

11. Greece has capital Athens. Each of the strings 'Greece', and 'Athens' has 6 characters. Show the name and capital where the name and the capital have the same number of characters. You can use the LENGTH function to find the number of characters in a string:
    ```sql
    SELECT name, capital
    FROM world
    WHERE LENGTH(name) = LENGTH(capital);
    ```

12. The capital of Sweden is Stockholm. Both words start with the letter 'S'. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word. You can use the function LEFT to isolate the first character. You can use <> as the NOT EQUALS operator:
    ```sql
    SELECT name, capital
    FROM world
    WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;
    ```

13. Equatorial Guinea and the Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name. Find the country that has all the vowels and no spaces in its name:
    ```sql
    SELECT name
    FROM world
    WHERE name LIKE '%a%' AND
    name LIKE '%e%' AND
    name LIKE '%i%' AND
    name LIKE '%o%' AND
    name LIKE '%u%' AND
    name NOT LIKE '% %';
    ```

## BBC QUIZ

1. Select the code which gives the name of countries beginning with U:
    ```sql
    SELECT name
    FROM world
    WHERE name LIKE 'U%';
    ```

2. Select the code which shows just the population of the United Kingdom:
    ```sql
    SELECT population
    FROM world
    WHERE name = 'United Kingdom';
    ```

3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
    ```sql
    SELECT continent 
    FROM world 
    WHERE 'name' = 'France';
    ```
    **Answer:** `'name'` should be `name`

4. Select the result that would be obtained from the following code:
    ```sql
    SELECT name, population / 10 
    FROM world 
    WHERE population < 10000;
    ```
    **Answer:** `Nauru/ 990`

5. Select the code which would reveal the name and population of countries in Europe and Asia:
    ```sql
    SELECT name, population
    FROM world
    WHERE continent IN ('Europe', 'Asia');
    ```

6. Select the code which would give two rows:
    ```sql
    SELECT name FROM world
    WHERE name IN ('Cuba', 'Togo');
    ```

7. Select the result that would be obtained from this code:
    ```sql
    SELECT name FROM world
    WHERE continent = 'South America'
    AND population > 40000000;
    ```
    **Answer:** `Brazil/ Columbia`

## SELECT FROM NOBEL TUTORIAL

1. Change the query shown so that it displays Nobel prizes for 1950:
    ```sql
    SELECT *
    FROM nobel
    WHERE yr = 1950;
    ```

2. Show who won the 1962 prize for Literature:
    ```sql
    SELECT winner
    FROM nobel
    WHERE yr = 1962 AND subject = 'Literature';
    ```

3. Show the year and subject that won 'Albert Einstein' his prize:
    ```sql
    SELECT yr, subject
    FROM nobel
    WHERE winner = 'Albert Einstein';
    ```

4. Give the name of the 'Peace' winners since the year 2000, including 2000:
    ```sql
    SELECT winner
    FROM nobel
    WHERE subject = 'Peace' AND yr >= 2000;
    ```

5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 and 1984:
    ```sql
    SELECT *
    FROM nobel
    WHERE subject = 'Literature' AND yr IN (1980, 1984);
    ```

6. Show all details of the presidential winners:
    ```sql
    SELECT *
    FROM nobel
    WHERE winner LIKE 'President%';
    ```

7. Show the winners with first name John:
    ```sql
    SELECT winner
    FROM nobel
    WHERE winner LIKE 'John%';
    ```

8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984:
    ```sql
    SELECT yr, subject, winner
    FROM nobel
    WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);
    ```

9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine:
    ```sql
    SELECT yr, subject, winner
    FROM nobel
    WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');
    ```

10. Show the year, subject, and name of winners for 1984 and 1980 for subjects not including Chemistry:
    ```sql
    SELECT yr, subject, winner
    FROM nobel
    WHERE subject <> 'Chemistry' AND yr IN (1980, 1984);
    ```

## NOBEL QUIZ

1. Select the code which gives the name of winners for 1950:
    ```sql
    SELECT winner
    FROM nobel
    WHERE yr = 1950;
    ```

2. Select the code which shows just the subject for 1962 Literature prize winners:
    ```sql
    SELECT subject
    FROM nobel
    WHERE yr = 1962 AND subject = 'Literature';
    ```

3. Select the answer which shows the problem with this SQL code - the intended result should be the year and subject of Einstein's prize:
    ```sql
    SELECT yr subject
    FROM nobel
    WHERE winner = 'Albert Einstein';
    ```
    **Answer:** Missing comma between `yr` and `subject`.

4. Select the result that would be obtained from the following code:
    ```sql
    SELECT winner
    FROM nobel
    WHERE subject = 'Peace' AND yr >= 2000;
    ```
    **Answer:** The list of Peace winners since 2000.

5. Select the code which would reveal the year and subject for Literature prize winners for 1980 and 1984:
    ```sql
    SELECT yr, subject
    FROM nobel
    WHERE subject = 'Literature' AND yr IN (1980, 1984);
    ```

6. Select the code which would give all details of the presidential winners:
    ```sql
    SELECT *
    FROM nobel
    WHERE winner LIKE 'President%';
    ```

7. Select the result that would be obtained from this code:
    ```sql
    SELECT yr, subject, winner
    FROM nobel
    WHERE winner LIKE 'John%';
    ```
    **Answer:** The list of winners whose first name is John.

8. Select the code that shows the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984:
    ```sql
    SELECT yr, subject, winner
    FROM nobel
    WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);
    ```

9. Select the code which excludes Chemistry and Medicine winners for 1980:
    ```sql
    SELECT yr, subject, winner
    FROM nobel
    WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');
    ```

10. Select the code that shows the year, subject, and name of winners for 1984 and 1980 excluding Chemistry:
    ```sql
    SELECT yr, subject, winner
    FROM nobel
    WHERE subject <> 'Chemistry' AND yr IN (1980, 1984);
    ```

## SELECT WITHIN SELECT TUTORIAL

1. List each country name where the population is larger than that of 'Russia'
    ```sql
    SELECT name FROM world
    WHERE population > (SELECT population FROM world
    WHERE name = 'Russia');
    ```

3. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'
    ```sql
    SELECT name FROM world
    WHERE gdp/population > (SELECT gdp/population FROM world
    WHERE name = 'United Kingdom') AND continent = 'Europe';
    ```

4. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
    ```sql
    SELECT name, continent
    FROM world
    WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia')
    ORDER BY name;
    ```

5. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
    ```sql
    SELECT name, population
    FROM world
    WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') 
        AND population < (SELECT population FROM world WHERE name = 'Germany');
    ```

6. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
    ```sql
    SELECT name, CONCAT(CAST(ROUND(
        population/(SELECT population FROM world WHERE name = 'Germany')*100,0)AS CHAR), '%') AS percentage
        FROM world
        WHERE continent = 'Europe';
    ```

7. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
    ```sql
    SELECT name FROM world
    WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe');
    ```

8. Find the largest country (by area) in each continent, show the continent, the name, and the area:
    ```sql
    SELECT continent, name, area
    FROM world w1
    WHERE area >= ALL (SELECT area FROM world WHERE continent = w1.continent);
    ```

9. List each continent and the name of the country that comes first alphabetically.
    ```sql
    SELECT continent, name
    FROM world w1
    WHERE name = (SELECT MIN(name) FROM world WHERE continent = w1.continent);
    ```

10. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent, and population.
    ```sql
    SELECT name, continent, population
    FROM world w1
    WHERE 25000000 >= (SELECT MAX(population) FROM world WHERE continent = w1.continent);
    ```

11. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
    ```sql
    SELECT name, continent
    FROM world w1
    WHERE population > 3 * (SELECT MAX(population) 
        FROM world WHERE continent = w1.continent AND name <> w1.name);
    ```

## NESTED SELECT QUIZ

1. Select the code that shows the name, region, and population of the smallest country in each region
    ```sql
    SELECT region, name, population
    FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region = x.region
        AND population > 0);
    ```

2. Select the code that shows the countries belonging to regions with all populations over 50000
    ```sql
    SELECT name, region, population
    FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region = y.region
        AND y.population > 0);
    ```

3. Select the code that shows the countries with a less than a third of the population of the countries around it
    ```sql
    SELECT name, region FROM bbc x
    WHERE population < ALL (SELECT population / 3 FROM bbc y WHERE y.region = x.region
        AND y.name != x.name);
    ```

4. Select the result that would be obtained from the following code:
    ```sql
    SELECT name FROM bbc
    WHERE population > (SELECT population FROM bbc WHERE name='United Kingdom')
    AND region IN (SELECT region FROM bbc WHERE name = 'United Kingdom');
    ```
    **Answer:** Table-D

5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
    ```sql
    SELECT name FROM bbc
    WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');

    SELECT name FROM bbc
    WHERE gdp > ALL (SELECT gdp FROM bbc WHERE region = 'Africa' AND gdp IS NOT NULL);
    ```

6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
    ```sql
    SELECT name FROM bbc
    WHERE population < (SELECT population FROM bbc WHERE name = 'Russia') AND
    population > (SELECT population FROM bbc WHERE name = 'Denmark');
    ```

7. Select the result that would be obtained from the following code:
    ```sql
    SELECT name FROM bbc
    WHERE population > ALL (SELECT MAX(population) FROM bbc WHERE region = 'Europe')
    AND region = 'South Asia';
    ```
    **Answer:** Table-B

## SUM and COUNT

1. Show the total population of the world.
    ```sql
    SELECT SUM(population) AS 'Total Population'
    FROM world;
    ```

2. List all the continents - just once each.
    ```sql
    SELECT DISTINCT(continent)
    FROM world;
    ```

3. Give the total GDP of Africa
    ```sql
    SELECT SUM(gdp)
    FROM world
    WHERE continent = 'Africa';
    ```

4. How many countries have an area of at least 1000000
    ```sql
    SELECT COUNT(name)
    FROM world
    WHERE area >= 1000000;
    ```

5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
    ```sql
    SELECT SUM(population)
    FROM world
    WHERE name IN ('Estonia', 'Latvia', 'Lithuania');
    ```

6. For each continent show the continent and number of countries.
    ```sql
    SELECT continent, COUNT(name)
    FROM world
    GROUP BY continent;
    ```

7. For each continent show the continent and number of countries with populations of at least 10 million.
    ```sql
    SELECT continent, COUNT(name)
    FROM world
    WHERE population >= 10000000
    GROUP BY continent;
    ```

8. List the continents that have a total population of at least 100 million.
    ```sql
    SELECT continent
    FROM world
    GROUP BY continent
    HAVING SUM(population) >= 100000000;
    ```

## SUM and COUNT QUIZ

1. Select the statement that shows the sum of population of all countries in 'Europe'
    ```sql
    SELECT SUM(population) FROM bbc WHERE region = 'Europe';
    ```

2. Select the statement that shows the number of countries with population smaller than 150000
    ```sql
    SELECT COUNT(name) FROM bbc WHERE population < 150000;
    ```

3. Select the list of core SQL aggregate functions
    ```sql
    AVG(), COUNT(), MAX(), MIN(), SUM()
    ```

4. Select the result that would be obtained from the following code:
    ```sql
    SELECT region, SUM(area)
    FROM bbc 
    WHERE SUM(area) > 15000000 
    GROUP BY region;
    ```
    **Answer:** No result due to invalid use of the WHERE function

5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
    ```sql
    SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark');
    ```

6. Select the statement that shows the medium population density of each region
    ```sql
    SELECT region, SUM(population) / SUM(area) AS density FROM bbc GROUP BY region;
    ```

7. Select the statement that shows the name and population density of the country with the largest population
    ```sql
    SELECT name, population / area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc);
    ```

8. Pick the result that would be obtained from the following code:
    ```sql
    SELECT region, SUM(area) 
    FROM bbc 
    GROUP BY region 
    HAVING SUM(area) <= 20000000;
    ```
    **Answer:** Table-D

## THE JOIN OPERATION

1. The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime. Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
    ```sql
    SELECT matchid, player
    FROM goal
    WHERE teamid = 'GER';
    ```

2. From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match. Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table. Show id, stadium, team1, team2 for just game 1012
    ```sql
    SELECT id, stadium, team1, team2
    FROM game
    WHERE id = '1012';
    ```

3. You can combine the two steps into a single query with a JOIN.
    ```sql
    SELECT *
    FROM game JOIN goal ON (id = matchid);
    ```
    The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say ON (game.id = goal.matchid). The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored. Modify it to show the player, teamid, stadium and mdate for every German goal.
    ```sql
    SELECT player, teamid, stadium, mdate
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    WHERE teamid = 'GER';
    ```

4. Use the same JOIN as in the previous question. Show the team1, team2 and player for every goal scored by a player called Mario (player LIKE 'Mario%')
    ```sql
    SELECT team1, team2, player
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    WHERE player LIKE 'Mario%';
    ```

5. The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes (gtime <= 10)
    ```sql
    SELECT player, teamid, coach, gtime
    FROM goal INNER JOIN eteam ON (goal.teamid = eteam.id)
    WHERE gtime <= 10;
    ```

6. To JOIN game with eteam you could use either game JOIN eteam ON (team1 = eteam.id) or game JOIN eteam ON (team2 = eteam.id). Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
    ```sql
    SELECT mdate, teamname
    FROM game INNER JOIN eteam ON (game.team1 = eteam.id)
    WHERE coach = 'Fernando Santos';
    ```

7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
    ```sql
    SELECT player
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    WHERE stadium = 'National Stadium, Warsaw';
    ```

8. The example query shows all goals scored in the Germany-Greece quarterfinal. Instead, show the name of all players who scored a goal against Germany.
    ```sql
    SELECT DISTINCT(player)
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';
    ```

9. Show teamname and the total number of goals scored.
    ```sql
    SELECT stadium, COUNT(gtime)
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    GROUP BY stadium;
    ```

10. Show the stadium and the number of goals scored in each stadium.
    ```sql
    SELECT stadium, COUNT(gtime)
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    GROUP BY stadium;
    ```

11. For every match involving 'POL', show the matchid, date and the number of goals scored.
    ```sql
    SELECT id, mdate, COUNT(gtime)
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    WHERE (team1 = 'POL' OR team2 = 'POL')
    GROUP BY id;
    ```

12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
    ```sql
    SELECT matchid, mdate, COUNT(gtime)
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    WHERE teamid = 'GER'
    GROUP BY id;
    ```

    ```sql
    SELECT matchid, mdate, COUNT(gtime)
    FROM game INNER JOIN goal ON (game.id = goal.matchid)
    GROUP BY id
    HAVING teamid = 'GER';
    ```
    This won't work as the column in the HAVING clause does not reference the column in the GROUP BY clause or the SELECT clause.

13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

## JOIN QUIZ

1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:

   **Answer:** game JOIN goal ON (id=matchid)

3. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:
   
   **Answer:** matchid, teamid, player, gtime, id, teamname, coach

5. Select the code which shows players, their team, and the number of goals they scored against Greece (GRE).
   ```sql
   SELECT player, teamid, COUNT(*)
   FROM game JOIN goal ON matchid = id
   WHERE (team1 = 'GRE' OR team2 = 'GRE')
   AND teamid != 'GRE'
   GROUP BY player, teamid;
   ```

## MORE JOIN OPERATIONS

1. List the films where the yr is 1962 [Show id, title]
   ```sql
   SELECT id, title
   FROM movie
   WHERE yr=1962;
   ```
   
2. Give year of 'Citizen Kane'.
   ```sql
   SELECT yr
   FROM movie
   WHERE title = 'Citizen Kane';
   ```
   
3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
   ```sql
   SELECT id, title, yr
   FROM movie
   WHERE title LIKE 'Star Trek%'
   ORDER BY yr;
   ```

4. What id number does the actor 'Glenn Close' have?
   ```sql
   SELECT id
   FROM actor
   WHERE name = 'Glenn Close';
   ```

5. What is the id of the film 'Casablanca'
   ```sql
   SELECT id
   FROM movie
   WHERE title = 'Casablanca';
   ```
   
6. Obtain the cast list for 'Casablanca'. Use movieid=11768, (or whatever value you got from the previous question)
   ```sql
   SELECT name
   FROM actor INNER JOIN casting ON (actor.id = casting.actorid)
   WHERE movieid = 11768;
   ```

7. Obtain the cast list for the film 'Alien'
   ```sql
   SELECT name
   FROM casting INNER JOIN actor ON (casting.actorid = actor.id)
   INNER JOIN movie ON (casting.movieid = movie.id)
   WHERE movie.title = 'Alien';
   ```
    
8. List the films in which 'Harrison Ford' has appeared
   ```sql
   SELECT movie.title
   FROM casting INNER JOIN actor ON (casting.actorid = actor.id) INNER JOIN movie ON (casting.movieid = movie.id)
   WHERE actor.name = 'Harrison Ford';
   ```

9. List the films where 'Harrison Ford' has appeared - but not in the starring role. (Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role)
   ```sql
   SELECT movie.title
   FROM casting INNER JOIN actor ON (casting.actorid = actor.id) INNER JOIN movie ON (casting.movieid = movie.id)
   WHERE (actor.name = 'Harrison Ford') AND (casting.ord <> 1);
   ```

10. List the films together with the leading star for all 1962 films.
    ```sql
    SELECT movie.title, actor.name
    FROM casting INNER JOIN actor ON (casting.actorid = actor.id)
    INNER JOIN movie ON (casting.movieid = movie.id)
    WHERE (ord = 1) AND (yr = 1962);
    ```

11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
    ```sql
    SELECT yr, COUNT(title)
    FROM casting INNER JOIN actor ON (casting.actorid = actor.id)
    INNER JOIN movie ON (casting.movieid = movie.id)
    WHERE actor.name = 'Rock Hudson'
    GROUP BY yr
    HAVING COUNT(title)>2;
    ```

12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
    ```sql
    SELECT title, name
    FROM movie INNER JOIN casting ON (movie.id = casting.movieid)
            INNER JOIN actor ON (casting.actorid = actor.id)
    WHERE movieid IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews')) AND ord = 1;
    ```

13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
    ```sql
    SELECT name
    FROM actor INNER JOIN casting ON (actor.id = casting.actorid)
    WHERE ord = 1
    GROUP BY name
    HAVING COUNT(movieid)>=15;
    ```

14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
    ```sql
    SELECT title, COUNT(actor.id)
    FROM movie INNER JOIN casting ON (movie.id = casting.movieid)
            INNER JOIN actor ON (casting.actorid = actor.id)
    WHERE yr = 1978
    GROUP BY movie.id
    ORDER BY COUNT(actor.id) DESC, title;
    ```

15. List all the people who have worked with 'Art Garfunkel'.
    ```sql
    SELECT name
    FROM movie INNER JOIN casting ON (movie.id = casting.movieid)
            INNER JOIN actor ON (casting.actorid = actor.id)
    WHERE actor.name <> 'Art Garfunkel'
        AND movieid IN (SELECT movieid FROM casting INNER JOIN actor ON (casting.actorid = actor.id)
        WHERE actor.name = 'Art Garfunkel');
    ```

## MORE JOIN QUIZ

1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
    ```sql
    SELECT name
    FROM actor INNER JOIN movie ON actor.id = director
    WHERE gross < budget
    ```

2. Select the correct example of JOINing three tables
    ```sql
    SELECT *
    FROM actor JOIN casting ON actor.id = actorid
    JOIN movie ON movie.id = movieid
    ```

3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
   ```sql
   SELECT name, COUNT(movieid)
   FROM casting JOIN actor ON actorid=actor.id
   WHERE name LIKE 'John %'
   GROUP BY name ORDER BY 2 DESC
   ```

4. Select the result that would be obtained from the following code:
   ```sql
   SELECT title 
   FROM movie JOIN casting ON (movieid=movie.id)
              JOIN actor   ON (actorid=actor.id)
   WHERE name='Paul Hogan' AND ord = 1
   ```
   **Answer:** Table-B

5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
   ```sql
   SELECT name
   FROM movie JOIN casting ON movie.id = movieid
   JOIN actor ON actor.id = actorid
   WHERE ord = 1 AND director = 351
   ```

6. There are two sensible ways to connect movie and actor. They are:
   
    **Answer:** link the director column in movies with the primary key in actor, connect the primary keys of movie and actor via the casting table

7. Select the result that would be obtained from the following code:
   ```sql
   SELECT title, yr 
   FROM movie, casting, actor 
   WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3
   ```
   **Answer:** Table-B

## USING NULL

1. List the teachers who have NULL for their department.
    ```sql
    SELECT name
    From teacher
    WHERE dept IS NULL;
    ```

2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
    ```sql
    SELECT teacher.name, dept.name
    FROM teacher JOIN dept
    ON (teacher.dept=dept.id);
    ```

3. Use a different JOIN so that all teachers are listed.
    ```sql
    SELECT teacher.name, dept.name
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);
    ```

4. Use a different JOIN so that all departments are listed.
    ```sql
    SELECT teacher.name, dept.name
    FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id);
    ```

 - COALESCE: COALESCE takes any number of arguments and returns the first value that is not null.
```
    COALESCE(x,y,z) = x if x is not NULL
    COALESCE(x,y,z) = y if x is NULL and y is not NULL
    COALESCE(x,y,z) = z if x and y are NULL but z is not NULL
    COALESCE(x,y,z) = NULL if x and y and z are all NULL
```
```sql
SELECT name, party
      ,COALESCE(party,'None') AS aff
  FROM msp WHERE name LIKE 'C%';
```

5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
    ```sql
    SELECT name, COALESCE(mobile,'07986 444 2266') as mobile
    FROM teacher;
    ```

6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
    ```sql
    SELECT teacher.name, COALESCE(dept.name, 'None') as 'dept name'
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);
    ```

7. Use COUNT to show the number of teachers and the number of mobile phones.
   ```sql
   SELECT COUNT(name) AS 'teacher count',
       COUNT(mobile) AS 'mobile count'
   FROM teacher;
   ```
   
8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
    ```sql
    SELECT dept.name, COUNT(teacher.name)
    FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id)
    GROUP BY dept.name;
    ```

- CASE: CASE allows you to return different values under different conditions. If there no conditions match (and there is not ELSE) then NULL is returned.
    ```sql
    CASE WHEN condition1 THEN value1
         WHEN condition2 THEN value2 
         ELSE def_value
    END
    ```
```sql
SELECT name, population,
      CASE WHEN population<1000000
            THEN 'small'
            WHEN population<10000000
            THEN 'medium'
            ELSE 'large'
       END
FROM bbc
```

9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
   ```sql
   SELECT teacher.name,
       CASE WHEN dept.id = 1 THEN 'Sci'
            WHEN dept.id = 2 THEN 'Sci'
            ELSE 'Art'
       END
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);
   ```

10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
    ```sql
    SELECT teacher.name,
       CASE WHEN dept IN (1,2)
            THEN 'Sci'
            WHEN dept = 3
            THEN 'Art'
            ELSE 'None'
       END
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);
    ```


