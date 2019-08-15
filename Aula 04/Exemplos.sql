USE world;

SHOW TABLES;

SELECT * FROM country;

SELECT * FROM city;

SELECT * FROM countrylanguage;

SELECT
Name 'País',
Continent 'Continente',
Region 'Região'
FROM
country
WHERE
Continent = 'Asia' AND
Name LIKE '%A_' AND
Population BETWEEN 50000000 AND 100000000;