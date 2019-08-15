USE world;

/* Exercício 01 */
SELECT
Code 'Sigla',
Name 'País',
IndepYear 'Ano de Independência'
FROM country;

/* Exercício 02 */
SELECT
Code 'Sigla',
Name 'País'
FROM 
country
WHERE
IndepYear IS NULL;

/* Exercício 03 */
SELECT
CountryCode 'Sigla do País',
Language 'Língua'
FROM
countrylanguage;

/* Exercício 04 */
SELECT
CountryCode 'Sigla do País',
Language 'Língua'
FROM
countrylanguage
WHERE
IsOfficial LIKE 'T';

/* Exercício 05 */
SELECT
Name 'País',
Region 'Região',
GovernmentForm 'Forma de Governo'
FROM 
country
WHERE
Continent = 'Europe';

/* Exercício 06 */
SELECT
Name 'País',
Population 'População'
FROM
country
WHERE
Continent LIKE '%America';

/* Exercício 07 */
SELECT
Name 'Nome da Cidade',
Population 'População'
FROM
city
WHERE
Population < 200000;

/* Exercício 08 */
SELECT
Name 'País'
FROM
country
WHERE
Population > 200000000 AND
Name LIKE '%n%';

/* Exercício 09 */
SELECT
Name 'País',
Region 'Região',
GovernmentForm 'Forma de Governo',
HeadOfState 'Chefe de Estado'
FROM 
country;

/* Exercício 10 */
SELECT
Name 'País'
FROM
country
WHERE
LifeExpectancy > 70;