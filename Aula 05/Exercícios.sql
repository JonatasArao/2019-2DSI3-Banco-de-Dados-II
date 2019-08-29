USE world;

/* Exercicio 11 */
SELECT
CO.Name 'País',
CL.Language 'Idioma'
FROM
country CO, countrylanguage CL
WHERE 
CL.CountryCode = CO.Code;

/* Exercicio 12 */
SELECT
CI.Name 'Cidade',
CL.Language 'Língua do País'
FROM
city CI, countrylanguage CL, country CO
WHERE
CL.CountryCode = CO.Code AND
CI.CountryCode = CO.Code;

/* Exercicio 13 */
SELECT
CO.Name 'País',
CI.Name 'Cidade',
CI.District 'Distrito'
FROM
country CO, city CI
WHERE
CI.CountryCode = CO.Code;

/* Exercicio 14 */
SELECT
CO.Name 'País',
CL.Language 'Idioma'
FROM
country CO, countrylanguage CL
WHERE 
CL.CountryCode = CO.Code AND
CL.Language LIKE 'Portuguese';

/* Exercicio 15 */
SELECT
CO.Name 'País',
CL.Language 'Idioma'
FROM
country CO, countrylanguage CL
WHERE 
CL.CountryCode = CO.Code AND
CL.Language LIKE 'English' AND
CL.IsOfficial LIKE 'T';

/* Exercicio 16 */
SELECT
CO.Name 'País',
CL.Language 'Idioma'
FROM
country CO, countrylanguage CL
WHERE 
CL.CountryCode = CO.Code AND
CL.IsOfficial LIKE 'T' AND
CL.Percentage < 50;

/* Exercicio 17 */
SELECT
Region 'Região',
SUM(Population) 'População Total'
FROM
country
GROUP BY Region;

/* Exercicio 18 */
SELECT
SUM(Population) 'População Total da América'
FROM
country
WHERE
Continent LIKE '%America';

/* Exercicio 19 */
SELECT
SUM(CO.Population) 'Total da População que fala Português'
FROM
country CO, countrylanguage CL
WHERE 
CL.CountryCode = CO.Code AND
CL.Language LIKE 'Portuguese';

/* Exercicio 20 */
SELECT
CL.Language 'Idioma',
SUM(CO.Population) 'Total da População'
FROM
country CO, countrylanguage CL
WHERE 
CL.CountryCode = CO.Code
GROUP BY CL.Language;

/* Exercicio 21 */
SELECT
CO.Region 'Região',
COUNT(CI.Name) 'Total de Cidades'
FROM
country CO, city CI
WHERE
CI.CountryCode = CO.Code
GROUP BY CO.Region;

/* Exercicio 22 */
SELECT
CO.Name 'País',
COUNT(CL.Language) 'Total dos Idiomas Falados'
FROM
country CO, countrylanguage CL
WHERE
CL.CountryCode = CO.Code
GROUP BY CO.Name;

/* Exercicio 23 */
SELECT
COUNT(Name) 'Quantidade de Países não independentes'
FROM
country
WHERE
IndepYear IS NULL;

/* Exercicio 24 */
SELECT
District 'Distrito' ,
COUNT(Population) 'População Total'
FROM
city
GROUP BY District;

/* Exercicio 25 */
SELECT
COUNT(CO.Name) 'Paises com Espanhol como Lg.Oficial'
FROM
country CO, countrylanguage CL
WHERE
CL.CountryCode = CO.Code AND
CL.Language LIKE 'Spanish' AND
CL.IsOfficial LIKE 'T';

/* Exercicio 26 */
SELECT
CL.Language 'Idioma',
COUNT(CO.Name) 'Paises como Lg.Oficial'
FROM
country CO, countrylanguage CL
WHERE
CL.CountryCode = CO.Code AND
CL.IsOfficial LIKE 'T'
GROUP BY CL.Language;

/* Exercicio 27 */
SELECT
COUNT(Continent) 'Qtd. Países registrados na América'
FROM
country
WHERE
Continent LIKE '%America';

/* Exercicio 28 */
SELECT
Name 'País com maior população'
FROM
country
WHERE
Population = (SELECT MAX(Population) FROM country);

/* Exercicio 29 */
SELECT
Name 'País com menor população'
FROM
country
WHERE
Population = (SELECT MIN(Population) FROM country);

/* Exercicio 30 */
SELECT
CO.Region 'Região',
COUNT(CI.Population) 'Total da População'
FROM
country CO, city CI
WHERE
CI.CountryCode = CO.Code
GROUP BY CO.Region
ORDER BY COUNT(CI.Population);

/* Exercicio 31 */
SELECT
CL.Language 'Idioma',
COUNT(CO.Name) 'Paises como Lg. Não-Oficial'
FROM
country CO, countrylanguage CL
WHERE
CL.CountryCode = CO.Code AND
CL.IsOfficial LIKE 'F'
GROUP BY CL.Language
ORDER BY COUNT(CO.Name) DESC;
