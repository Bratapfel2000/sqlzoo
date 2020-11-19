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
















