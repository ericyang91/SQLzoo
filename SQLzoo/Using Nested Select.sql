-- 1. List each country in the same continent as 'Brazil'.
SELECT name FROM world WHERE continent =
    (SELECT continent
    FROM world WHERE name = 'Brazil');

-- 2. List each country and its continent in the same continent as 'Brazil' or 'Mexico'.
SELECT name, continent FROM world
    WHERE continent IN
    (SELECT continent
        FROM world WHERE name='Brazil'
                    OR name='Mexico');

-- 3. Show the population of China as a multiple of the population of the United Kingdom
SELECT
    population/(SELECT population FROM world
                WHERE name='United Kingdom')
    FROM world
    WHERE name = 'China';

-- 4. Show each country that has a population greater than the population of ALL countries in Europe.
SELECT name FROM world
WHERE population > ALL
      (SELECT population FROM world
        WHERE continent='Europe');