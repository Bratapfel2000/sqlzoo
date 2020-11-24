1.List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

2.When was Citizen Kane released?
SELECT yr
 FROM movie
 WHERE title= 'Citizen Kane';

3.Star Trek movies
SELECT id, title,yr
 FROM movie
 WHERE title LIKE '%Star Trek%'
ORDER BY yr;

4.id for actor Glenn Close
SELECT id FROM actor
WHERE name = 'Glenn Close';

5.id for Casablanca
SELECT id FROM movie
WHERE title = 'Casablanca';

6.Cast list for Casablanca
SELECT actor.name
FROM actor JOIN casting ON(casting.actorid=actor.id)
WHERE casting.movieid=11768;

7.Alien cast list
SELECT actor.name
FROM actor JOIN casting ON(casting.actorid=actor.id) JOIN movie ON movie.id=casting.movieid
WHERE movie.title='Alien';

8.Harrison Ford movies
SELECT movie.title
FROM actor JOIN casting ON(casting.actorid=actor.id) JOIN movie ON movie.id=casting.movieid
WHERE actor.name='Harrison Ford';

9.Harrison Ford as a supporting actor
SELECT movie.title
FROM actor JOIN casting ON(casting.actorid=actor.id) JOIN movie ON movie.id=casting.movieid
WHERE actor.name='Harrison Ford' AND casting.ord!=1;

10.Lead actors in 1962 movies
SELECT movie.title, actor.name
FROM actor JOIN casting ON(casting.actorid=actor.id) JOIN movie ON movie.id=casting.movieid
WHERE movie.yr=1962 AND casting.ord=1;

11.Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

12.Lead actor in Julie Andrews movies
SELECT title, name
FROM movie JOIN casting ON (movieid=movie.id AND ord=1)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
  SELECT movieid FROM casting
WHERE actorid IN (
SELECT id FROM actor
  WHERE name='Julie Andrews'))
  
13.Actors with 15 leading roles
SELECT name FROM actor
  JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name

14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, Count(actorid)
 FROM casting JOIN movie ON movie.id = casting .movieid
 WHERE movie .yr = 1978
GROUP BY movie .title
ORDER BY Count(casting .actorid) DESC, title

15.List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT name
FROM actor JOIN casting ON id=actorid
WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='Art Garfunkel')) AND name != 'Art Garfunkel'














