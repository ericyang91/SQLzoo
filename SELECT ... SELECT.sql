-- 1. You may use a SELECT statement in the FROM line.
-- In this case the derived table X has columns name and gdp_per_capita. The calculated values in the inner SELECT can be used in the outer SELECT.
-- Notice that
-- - the inner table is given an alias X
-- - the first column in the inner query keeps its name
-- - the second column in the inner query has an alias
SELECT name, gdp_per_capita
  FROM
  (SELECT name,
          gdp/population AS gdp_per_capita
     FROM world) X
WHERE gdp_per_capita>2000;

-- 2. Find the countries in the same continent as Bhutan
SELECT name
  FROM world
WHERE continent IN
  (SELECT continent FROM world
WHERE name='Bhutan');

-- 3. Show the countries where the population is greater than 5 times the average for its region (correlated subquery)
SELECT name
  FROM bbc b1
WHERE population>
  5*(SELECT AVG(population) FROM bbc
     WHERE region=b1.region);