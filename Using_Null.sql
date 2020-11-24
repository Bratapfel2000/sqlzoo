1.NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
SELECT name FROM teacher
  WHERE dept IS NULL
  
2.Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
3.Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

4.Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
          ON (teacher.dept=dept.id)

5.Using the COALESCE function
SELECT name ,COALESCE(mobile,'07986 444 2266') AS aff
  FROM teacher 
