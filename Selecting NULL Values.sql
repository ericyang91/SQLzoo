-- 1. List the teachers who have NULL for their department.
SELECT name
    From teacher
    WHERE dept IS NULL;
 
-- 2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
    FROM teacher JOIN dept
           ON (teacher.dept=dept.id);

-- 3. Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

-- 4. Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
    FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id);

-- COALESCE
-- COALESCE takes any number of arguments and returns the first value that is not null.

    COALESCE(x,y,z) = x if x is not NULL
    COALESCE(x,y,z) = y if x is NULL and y is not NULL
    COALESCE(x,y,z) = z if x and y are NULL but z is not NULL
    COALESCE(x,y,z) = NULL if x and y and z are all NULL

SELECT name, party
      ,COALESCE(party,'None') AS aff
  FROM msp WHERE name LIKE 'C%';

-- 5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile,'07986 444 2266') as mobile
    FROM teacher;

-- 6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name, COALESCE(dept.name, 'None') as 'dept name'
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

-- 7. Use COUNT to show the number of teachers and the number of mobile phones.
 SELECT COUNT(name) AS 'teacher count',
       COUNT(mobile) AS 'mobile count'
    FROM teacher;

-- 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, COUNT(teacher.name)
    FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id)
    GROUP BY dept.name;

-- CASE
-- CASE allows you to return different values under different conditions.
-- If there no conditions match (and there is not ELSE) then NULL is returned.
--   CASE WHEN condition1 THEN value1
--        WHEN condition2 THEN value2 
--        ELSE def_value
--   END

SELECT name, population
      ,CASE WHEN population<1000000
            THEN 'small'
            WHEN population<10000000
            THEN 'medium'
            ELSE 'large'
       END
FROM bbc

-- 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
 
SELECT teacher.name,
       CASE WHEN dept.id = 1 THEN 'Sci'
            WHEN dept.id = 2 THEN 'Sci'
            ELSE 'Art'
       END
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

-- 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT teacher.name,
       CASE WHEN dept IN (1,2)
            THEN 'Sci'
            WHEN dept = 3
            THEN 'Art'
            ELSE 'None'
       END
    FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);