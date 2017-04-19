--SQLZOO.net/wiki




--SELECT basics

SELECT population FROM world WHERE name = 'Germany'
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark')
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000

--SELECT name
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
SELECT  name FROM world WHERE concat(name, ' ', 'city') = capital
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
SELECT name, concat(ROUND(population/ (SELECT population FROM world WHERE name = 'Germany') * 100), '%' )FROM world WHERE continent = 'europe'
