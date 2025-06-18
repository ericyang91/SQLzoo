-- 1. List each country name where the population is larger than that of 'Russia'
SELECT name FROM world
    WHERE population > (SELECT population FROM world
    WHERE name = 'Russia');

-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'
SELECT name FROM world
    WHERE gdp/population > (SELECT gdp/population FROM world
        WHERE name = 'United Kingdom') AND  continent = 'Europe';

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
    FROM world
    WHERE continent in (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia')
    ORDER BY name;

-- 4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
SELECT name, population
    FROM world
    WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') 
        AND population < (SELECT population FROM world WHERE name = 'Germany');

-- 5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name, CONCAT(CAST(ROUND(
    population/(SELECT population FROM world WHERE name = 'Germany')*100,0)AS CHAR), '%') AS percentage
    FROM world
    WHERE continent = 'Europe';

-- 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name FROM world
    WHERE gdp> ALL(SELECT gdp FROM world WHERE continent = 'Europe');

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area: The above example is known as a correlated or synchronized sub-query.
SELECT continent, name, area
    FROM world w1
    WHERE area >= ALL(SELECT area FROM world WHERE continent = w1.continent);

-- 8. List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
    FROM world w1
    WHERE name = (SELECT MIN(name) FROM world WHERE continent = w1.continent);

-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population
    FROM world w1
    WHERE 25000000 >= (SELECT MAX(population) FROM world WHERE continent = w1.continent);

-- 10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent
    FROM world w1
    WHERE population > 3*(SELECT MAX(population) 
        FROM world WHERE continent = w1.continent AND name <> w1.name);


-- Quiz 1: Select the code that shows the name, region and population of the smallest country in each region
SELECT region, name, population
    FROM bbc x WHERE population <= ALL(SELECT population FROM bbc y WHERE y.region = x.region
        AND population>0);

-- Quiz 2: Select the code that shows the countries belonging to regions with all populations over 50000
SELECT name, region, population
    FROM bbc x WHERE 50000< ALL(SELECT population FROM bbc y WHERE x.region = y.region
        AND y.population>0);

-- Quiz 3: Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region FROM bbc x
    WHERE population < ALL(SELECT population/3 FROM bbc y WHERE y.region = x.region
        AND y.name != x.name);

-- Quiz 4: 4. Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom');
        --  Answer: Table-D

-- Quiz 5: Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
    WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');

SELECT name FROM bbc
    WHERE gdp > ALL(SELECT gdp FROM bbc WHERE region = 'Africa' AND gdp<>NULL); -- This is wrong as in SQL we cannot use operators to directly compare NULL values. Instead, we should use IS NULL or IS NOT NULL.

-- Quiz 6: Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name FROM bbc
    WHERE population < (SELECT population FROM bbc WHERE name = 'Russia') AND
    population > (SELECT population FROM bbc WHERE name = 'Denmark');

-- Quiz 7: Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
   AND region = 'South Asia'
    -- Answer: Table-B

