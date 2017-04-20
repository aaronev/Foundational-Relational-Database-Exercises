<<<<<<< HEAD
--SQLZOO.net/wiki



=======
-- http://sqlzoo.net/wiki/
>>>>>>> bd0a692fc70956d955740679dc3ae7978682d8fc

--SELECT basics

SELECT population FROM world WHERE name = 'Germany'
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark')
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000

--SELECT name
<<<<<<< HEAD
=======

>>>>>>> bd0a692fc70956d955740679dc3ae7978682d8fc
SELECT name FROM world WHERE name LIKE 'y%'
SELECT name FROM world WHERE name LIKE '%y'
SELECT name FROM world WHERE name LIKE '%x%'
SELECT name FROM world WHERE name LIKE '%land'
SELECT name FROM world WHERE name LIKE 'c%%ia'
SELECT name FROM world WHERE name LIKE '%oo%'
SELECT name FROM world WHERE name LIKE '%a%%a%%a%'
SELECT name FROM world WHERE name LIKE '_t%'ORDER BY name
SELECT name FROM world WHERE name LIKE '%o__o%'
SELECT name FROM world WHERE LENGTH(name) = 4
SELECT name FROM world WHERE name = capital
<<<<<<< HEAD
SELECT  name FROM world WHERE concat(name, ' ', 'city') = capital
=======
SELECT name FROM world WHERE concat(name, ' ', 'city') = capital
>>>>>>> bd0a692fc70956d955740679dc3ae7978682d8fc
SELECT capital, name FROM world WHERE capital LIKE concat('%', name, '%')
SELECT name, capital FROM world WHERE capital <> name AND capital LIKE concat(name,'%')

--SELECT from world

SELECT name, continent, population FROM world
SELECT name FROM world WHERE population >=  200000000
SELECT name, gdp/population FROM world WHERE population >= 200000000
SELECT name, population / 1000000 FROM world WHERE continent LIKE '%South America%'
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy')
SELECT name FROM world WHERE name LIKE '%United%'
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world WHERE continent LIKE '%south america%'
SELECT name, ROUND(ROUND(gdp/population)/1000) * 1000 AS nearest_thou FROM world WHERE gdp >= 1000000000000
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital)
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1)  AND name <> capital
SELECT name FROM world WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'

--SELECT from nobel

SELECT yr, subject, winner FROM nobel WHERE yr = 1950
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'
SELECT winner FROM nobel WHERE yr >= 2000 AND subject = 'Peace'
SELECT * FROM nobel WHERE yr BETWEEN 1980 AND 1989 AND subject = 'Literature'
SELECT * FROM nobel WHERE winner in ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
SELECT winner FROM nobel WHERE winner LIKE 'John%'
SELECT * FROM nobel WHERE yr = 1980 AND subject = 'Physics'  OR yr = 1984 AND subject = 'Chemistry'
SELECT * FROM nobel WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')
SELECT * FROM nobel WHERE yr < 1910 AND subject = 'Medicine' OR subject = 'Literature' AND yr >= 2004
SELECT * FROM nobel WHERE winner LIKE 'PETER GRÜNBERG'
SELECT * FROM nobel WHERE winner LIKE 'EUGENE O''NEILL'
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%'  ORDER BY yr DESC
SELECT winner, subject
SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'), subject, winner

--SELECT within SELECT tutorial

SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')
SELECT name FROM world WHERE continent = 'europe' AND gdp/population >( SELECT gdp/population FROM world WHERE name = 'United Kingdom')
SELECT name, continent FROM world WHERE continent = (SELECT continent FROM world WHERE name = 'argentina') OR continent = (SELECT continent FROM world WHERE name = 'australia') ORDER BY name ASC
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'canada') AND population < (SELECT population FROM world WHERE name = 'poland')
<<<<<<< HEAD
SELECT name, concat(ROUND(population/ (SELECT population FROM world WHERE name = 'Germany') * 100), '%' )FROM world WHERE continent = 'europe'
=======
SELECT name, concat(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100), '%' )FROM world WHERE continent = 'europe'
SELECT name From world WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'europe')
SELECT continent, name, area FROM world WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent)
--SKIPPED 8 SELECT continent, name FROM world GROUP BY continent, name [(SELECT DISTINCT continent FROM world)] only selects continents

--The JOIN operation

SELECT matchid, player FROM goal JOIN eteam ON goal.teamid = eteam.id WHERE teamid = 'ger'
SELECT DISTINCT id, stadium, team1, team2 FROM game JOIN goal on game.id = goal.matchid WHERE matchid = 1012
SELECT player, teamid, stadium, mdate FROM game JOIN goal ON game.id = goal.matchid WHERE teamid = 'ger'
SELECT team1, team2, player FROM game JOIN goal ON game.id = goal.matchid WHERE player LIKE 'mario%'
SELECT player, teamid, coach, gtime FROM goal JOIN eteam on goal.teamid = eteam.id WHERE gtime <= 10
SELECT mdate, teamname FROM game JOIN eteam ON  game.team1 = eteam.id where coach = 'Fernando Santos'
SELECT player FROM goal JOIN game ON goal.matchid = game.id WHERE stadium = 'National Stadium, Warsaw'

--More JOIN operations

SELECT id, title FROM movie WHERE yr = 1962
SELECT yr FROM movie WHERE title = 'citizen kane'
SELECT id, title, yr FROM movie WHERE title LIKE "star trek%"
SELECT id FROM actor WHERE name = 'glenn close' 
SELECT id FROM movie WHERE title = 'casablanca'
SELECT name FROM actor JOIN casting ON actor.id = casting.actorid WHERE movieid = 11768
SELECT name FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON movie.id = casting.movieid WHERE title = "Alien" 
SELECT title FROM movie JOIN casting ON movie.id = casting.movieid JOIN actor ON actor.id = casting.actorid WHERE name = 'Harrison Ford'
SELECT title FROM movie JOIN casting ON movie.id = casting.movieid JOIN actor ON actor.id = casting.actorid WHERE ord <> 1 AND name = 'harrison ford'
SELECT title, name FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON movie.id =casting.movieid WHERE yr = 1962 and ord = 1

--Using NULL

SELECT name FROM teacher WHERE dept IS NULL
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON teacher.dept=dept.id
SELECT teacher.name, dept.name FROM teacher LEFT JOIN dept ON teacher.dept=dept.id
SELECT teacher.name, dept.name FROM dept LEFT JOIN teacher ON teacher.dept = dept.id
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON teacher.dept = dept.id 
SELECT COUNT(teacher.name), COUNT(mobile) FROM teacher
SELECT dept.name, COUNT(teacher.name)  FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id GROUP BY dept.name
SELECT name, CASE WHEN dept = 1 THEN 'Sci' WHEN dept = 2 THEN 'Sci' WHEN dept IS NULL THEN 'Art' END FROM teacher
SELECT name, CASE WHEN dept = 1 THEN 'Sci' WHEN dept = 2 THEN 'Sci' WHEN dept = 3 THEN 'Art' WHEN dept IS NULL THEN 'None' END FROM teacher

--NSS Tutorial

SELECT a_strongly_agree FROM nss WHERE question = 'Q01' AND institution = 'Edinburgh Napier University' AND subject = '(8) Computer Science'
SELECT institution, subject FROM nss WHERE question = 'Q15' AND score >= 100
SELECT institution, score FROM nss WHERE question = 'Q15' AND subject = '(8) Computer Science' AND score < 50
SELECT subject, SUM(response) FROM nss WHERE question='Q22' AND subject in ('(8) Computer Science', '(H) Creative Arts and Design') GROUP BY subject
SELECT subject , SUM(response * a_strongly_agree)/100 FROM nss WHERE question = 'Q22' AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design') GROUP BY subject
-- SKIPPED 6 SELECT subject , ROUND(SUM(response)/SUM(a_strongly_agree)) FROM nsd WHERE question = 'Q22' AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design') GROUP BY subject
-- SKIPPED 7 SELECT institution, SUM(score) FROM nss WHERE question = 'Q22'  AND institution LIKE "%manchester%" GROUP BY institution
-- SKIPPED 8

--SELF JOIN

SELECT COUNT(*) FROM stops
SELECT id FROM stops WHERE name = "craiglockhart"
SELECT id, name FROM stops JOIN route ON stops.id = route.stop WHERE num = 4
SELECT company, num, COUNT(*) FROM route WHERE company = 'LRT'  AND stop = 149 OR stop = 53 GROUP BY company, num HAVING COUNT(stop) = 2
SELECT a.company, a.num, a.stop, b.stop FROM route a JOIN route b ON a.company = b.company AND a.num = b.num WHERE a.stop = 53 AND b.stop = 149
SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON a.company = b.company AND a.num = b.num JOIN stops stopa ON a.stop = stopa.id JOIN stops stopb ON b.stop = stopb.id WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road'
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON a.company = b.company AND a.num = b.num JOIN stops stopa ON a.stop = stopa.id JOIN stops stopb ON b.stop=stopb.id WHERE stopa.name = 'Haymarket' AND stopb.name = 'Leith'
SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON a.company=b.company AND a.num=b.num JOIN stops stopa ON a.stop=stopa.id JOIN stops stopb ON b.stop = stopb.id WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'
-- SKIPPED 9 AND 10

--DDL Student Records

--CREATE student 

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	matric_no CHAR(8) PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE
);

--ADD students to DataBase

INSERT INTO student VALUES(40001010, 'Daniel', 'Radcliffe', 1989-07-23)
INSERT INTO student VALUES(40001011, 'Emma', 'Watson', 1990-04-15)
INSERT INTO student VALUES(40001012, 'Rupert', 'Grint', 1988-10-24)

--CREATE module

DROP TABLE IF EXISTS module;
CREATE TABLE module (
	module_code CHAR(8) PRIMARY KEY, 
	module_title VARCHAR(50) NOT NULL, 
	level INTEGER NOT NULL,
	credits INTEGER NOT NULL DEFAULT 20
);

--ADD modules

INSERT INTO module VALUES('HUF07101', 'Herbology', 07)
INSERT INTO module VALUES('SLY07102', 'Defense Against the Dark Arts', 07)
INSERT INTO module VALUES('HUF08102', 'Herbology', 08)

--CREATE registration

DROP TABLE IF EXISTS registration;
CREATE TABLE registration (
	matric_no CHAR(8), 
	module_code CHAR(8), 
	result DECIMAL(4,1),
	PRIMARY KEY (matric_no, module_code),
	FOREIGN KEY (matric_no) REFERENCES student(matric_no),
	FOREIGN KEY (module_code) REFERENCES `module`(module_code)
);

--ADD data

INSERT INTO registration VALUES('HUF07101', 'Herbology', 07)
INSERT INTO registration VALUES('HUF07101', 'Herbology', 07)
INSERT INTO registration VALUES('HUF07101', 'Herbology', 07)
>>>>>>> bd0a692fc70956d955740679dc3ae7978682d8fc
