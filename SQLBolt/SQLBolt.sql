-- https://sqlbolt.com/

-- Lesson 1

  SELECT title FROM movies;
  SELECT director FROM movies;
  SELECT title, director FROM movies;
  SELECT title, year FROM movies;
  SELECT * FROM movies;

-- Lesson 2

  SELECT * FROM movies WHERE id = 6;
  SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;
  SELECT * FROM movies WHERE year not BETWEEN 2000 AND 2010;
  SELECT * FROM movies LIMIT 5;

-- Lesson 3

  SELECT * FROM movies WHERE title LIKE "%toy%";
  SELECT * FROM movies WHERE director LIKE "%john lass%";
  SELECT * FROM movies WHERE director not LIKE "%john lass%";
  SELECT * FROM movies WHERE title LIKE "%wall%";

-- Lesson 4

  SELECT director FROM movies ORDER BY director ASC;
  SELECT * FROM movies ORDER BY year DESC LIMIT 4;
  SELECT * FROM movies ORDER BY title ASC LIMIT 5;
  SELECT * FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;

-- Lesson 5

  SELECT city, population FROM north_american_cities WHERE country LIKE "%canada%";
  SELECT * FROM north_american_cities WHERE country LIKE "%united states%" ORDER BY latitude DESC;
  SELECT * FROM north_american_cities WHERE longitude < -87.629798  ORDER BY longitude ASC;
  SELECT * FROM north_american_cities WHERE country LIKE "%mexico%" ORDER BY population DESC Limit 2 ;
  SELECT * FROM north_american_cities WHERE country LIKE "%united states%" ORDER BY population DESC LIMIT 2 OFFSET 2;

-- Lesson 6

  SELECT * FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;
  SELECT * FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id WHERE international_sales > domestic_sales;
  SELECT * FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id ORDER BY rating DESC;

-- Lesson 7

  SELECT DISTINCT building FROM buildings JOIN employees ON employees.building = buildings.Building_name;
  SELECT building_name, capacity FROM buildings;
  SELECT DISTINCT building_name, role FROM buildings LEFT JOIN employees ON buildings.building_name = employees.building;

-- Lesson 8

  SELECT name, role FROM employees LEFT JOIN buildings ON employees.building = buildings.building_name WHERE building_name IS NULL;
  SELECT * FROM Buildings LEFT JOIN employees ON employees.building = buildings.building_name WHERE name IS NULL;

-- Lesson 9  

  SELECT title, (domestic_sales + international_sales)/1000000 AS combined_sales FROM boxoffice JOIN movies on boxoffice.movie_id = movies.id;
  SELECT title, (rating * 10) AS rating FROM boxoffice JOIN movies on boxoffice.movie_id = movies.id;
  SELECT * FROM boxoffice JOIN movies on boxoffice.movie_id = movies.id WHERE year % 2 = 0;
-- Lesson 10

  SELECT MAX(years_employed) FROM employees;
  SELECT role, AVG(years_employed) FROM employees GROUP BY role;
  SELECT building, SUM(years_employed) FROM employees GROUP BY building;

-- Lesson 11

  SELECT count() FROM employees where role like "%artist%";
  SELECT role, count() FROM employees group by role;
  SELECT role, SUM(years_employed) AS years FROM employees GROUP BY role HAVING role LIKE "%engineer%";

-- Lesson 12

  SELECT director, count() AS movies FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id GROUP BY director;
  SELECT director, SUM(domestic_sales), SUM(international_sales), SUM(domestic_sales + international_sales) AS combined FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id group by director;

-- Lesson 13

  INSERT INTO movies VALUES (4, "Toy Story 4", "Jonhn Lasseter", 2000, 90)
  INSERT INTO boxoffice VALUES (4, 8.7, 340, 270)

-- Lesson 14

  UPDATE movies SET director = 'John Lasseter' WHERE id = 2;
  UPDATE movies SET year = 1999 WHERE id = 3;
  UPDATE movies SET title = 'Toy Story 3', director = 'Lee Unkrich' WHERE id = 11;

-- Lesson 15

  DELETE FROM movies WHERE year < 2005;
  DELETE FROM movies WHERE director = "Andrew Stanton";

-- Lesson 16

  CREATE TABLE database (
    name TEXT,
    version FLOAT,
    download_count INTEGER 
);

-- Lesson 17

  ALTER TABLE movies ADD aspect_ratio FLOAT
  ALTER TABLE movies ADD language TEXT DEFAULT English

-- Lesson 18

  DROP TABLE IF EXISTS movies;
  DROP TABLE IF EXISTS boxoffice;






























