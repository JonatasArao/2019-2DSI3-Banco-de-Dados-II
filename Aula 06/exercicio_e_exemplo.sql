USE sakila;	

/*	I)	Filme/ Ator	*/
SELECT
	FI.title 'Filme',
    CONCAT(AC.first_name,' ', AC.last_name) 'Ator'
FROM
	film FI
	INNER JOIN
	film_actor FA ON (FI.film_id = FA.film_id)
    INNER JOIN
    actor AC ON (FA.actor_id = AC.actor_id)
;
    
/*	II) Cliente/Endereço/Cidade/País	*/
SELECT
	CONCAT(CTM.first_name,' ', CTM.last_name) 'Cliente',
	AD.address 'Endereço',
    CT.city 'Cidade',
    CO.country 'País'
FROM
	customer CTM
INNER JOIN
	address AD ON(CTM.address_id = AD.address_id)
INNER JOIN
	city CT ON(AD.city_id = CT.city_id)
INNER JOIN
	country CO ON(CT.country_id = CO.country_id)
;

/* III) Filme/Ator/ Categoria */
SELECT
	FI.title 'Filme',
    CONCAT(AC.first_name,' ', AC.last_name) 'Ator',
    CAT.name 'Categoria'
FROM
	film FI
	INNER JOIN
	film_actor FA ON(FA.film_id = FI.film_id)
	INNER JOIN
	actor AC ON(FA.actor_id = AC.actor_id)
    INNER JOIN
    film_category FCA ON(FI.film_id = FCA.film_id)
    INNER JOIN
    category CAT ON(FCA.category_id = CAT.category_id)
;

/*	IV) Filme/ Id. da Cópia/ Loja	*/    
	

/*	V) Cliente/ Nome do Filme Alugado pelo Cliente/ Loja */


/*	32) EXIBIR O NOME DO FILME E A QUANTIDADE DE ATORES QUE TRABALHARAM NO FILME	*/
SELECT
	FI.Title 'Filme',
    COUNT(AC.actor_id) 'Quantidade de Atores'
FROM
	film FI
	INNER JOIN
	film_actor FA ON (FI.film_id = FA.film_id)
    INNER JOIN
    actor AC ON (AC.actor_id = FA.actor_id)
    GROUP BY FI.film_id
;
    
/*	33) EXIBIR O NOME DO ATOR/ATRIZ E A QUANTIDADE DE FILMES QUE ELE/ELA TRABALHOU	*/
SELECT
	CONCAT(AC.first_name,' ',AC.last_name) 'Ator/Atriz',
    COUNT(FI.film_id) 'Quantidade de Filmes'
FROM
	actor AC 
    INNER JOIN
    film_actor FA ON(AC.actor_id = FA.actor_id)
    INNER JOIN
    film FI ON(FI.film_id = FA.film_id)
    GROUP BY AC.actor_id
;

/*	34) EXIBIR O NOME DA CATEGORIA E A QUANTIDADE DE FILMES CADASTRADOS PARA AQUELA CATEGORIA	*/
SELECT
	CA.name 'Categoria',
    COUNT(FI.film_id) 'Quantidade de Filmes'
FROM
	category CA 
    INNER JOIN
    film_category FC ON(CA.category_id = FC.category_id)
    INNER JOIN
    film FI ON(FC.film_id = FI.film_id)
    GROUP BY CA.category_id
;

/*	35) EXIBIR O NOME DO ATOR/ATRIZ E A QUANTIDADE DE CATEGORIAS DIFERENTES DE FILMES QUE ELE/ELA PARTICIPOU	*/
SELECT
	CONCAT(AC.first_name,' ',AC.last_name) 'Ator',
    COUNT(DISTINCT CT.category_id) 'Quantidade de Categorias'
FROM
	actor AC
    INNER JOIN
    film_actor FA ON(AC.actor_id = FA.actor_id)
    INNER JOIN
    film FI ON(FI.film_id = FA.film_id)
    INNER JOIN
    film_category FC ON(FC.film_id = FI.film_id)
    INNER JOIN
    category CT ON(CT.category_id = FC.category_id)
	GROUP BY AC.actor_id
;

/*	36) EXIBIR O NOME DO CLIENTE E A QUANTIDADE DE FILMES QUE CADA CLIENTE ALUGOU EM ORDEM DECRESCENTE	*/
SELECT
	CS.customer_id,
	CONCAT(CS.first_name,' ',CS.last_name) 'Cliente',
    COUNT(RE.customer_id) 'Quantidade de Filmes Alugados'
FROM
	customer CS
    LEFT JOIN /* Pode haver clientes que não alugaram ainda */
    rental RE ON(CS.customer_id = RE.customer_id)
GROUP BY CS.customer_id
ORDER BY COUNT(RE.customer_id) DESC
;

/*	37) EXIBIR O ID DA LOJA E A QUANTIDADE DE FILMES EXISTENTES EM CADA LOJA	*/
SELECT
	ST.store_id 'Id da Loja',
    COUNT(DISTINCT IV.film_id) 'Quantidade de Filmes na Loja'
FROM
	store ST
    INNER JOIN
    inventory IV ON(ST.store_id = IV.store_id)
GROUP BY ST.store_id;

/*	38) EXIBIR O NOME DO FILME E A QUANTIDADE DE CÓPIAS EXISTENTES EM CADA LOJA	*/
SELECT
	FI.title 'Filme',
    ST.store_id 'Id da Loja',
    COUNT(IV.store_id) 'Quantidade de cópias da loja'
FROM 
	film FI
    LEFT JOIN
    inventory IV ON(FI.film_id = IV.film_id)
    LEFT JOIN
    store ST ON(IV.store_id = ST.store_id)
GROUP BY FI.film_id, ST.store_id
;    

/*	39) EXIBIR O NOME DO CLIENTE E O VALOR QUE CADA CLIENTE JÁ GASTOU EM LOCAÇÕES EM ORDEM CRESCENTE	*/
SELECT
	CONCAT(CS.first_name,' ',CS.last_name) 'Cliente',
    SUM(PY.amount) 'Gastos do Cliente'
FROM
	customer CS
    LEFT JOIN /* Pode haver clientes cadastrados que não gastaram ainda */
    payment PY ON(CS.customer_id = PY.customer_id)
GROUP BY CS.customer_id
ORDER BY SUM(PY.amount) ASC
;

/*	40) EXIBIR O ID DA LOJA E O VALOR RECEBIDO POR CADA LOJA COM AS LOCAÇÕES	*/
SELECT
	ST.store_id 'Id. da Loja',
    SUM(PY.amount) 'Valor recebido pela loja'
FROM
	store ST
    INNER JOIN
    staff SF ON(ST.store_id = SF.store_id)
    INNER JOIN
    payment PY ON(SF.staff_id = PY.staff_id)
GROUP BY ST.store_id
;    

/*	41) EXIBIR O NOME DO FILME E O VALOR ARRECADADO COM A LOCAÇÃO DE CADA FILME	*/
SELECT
	FI.title 'Filme',
    SUM(PY.amount) 'Valor Arrecadado'
FROM 
	film FI
    LEFT JOIN
    inventory IV ON(FI.film_id = IV.film_id)
    LEFT JOIN
    rental RT ON(IV.inventory_id = RT.inventory_id)
    LEFT JOIN
    payment PY ON(RT.rental_id = PY.rental_id)
GROUP BY FI.film_id
;   

/*	42)EXIBIR O NOME DO CLIENTE, FILME, DATA DE LOCAÇÃO SOMENTE DOS FILMES COM LOCAÇÃO EM ABERTO	*/
SELECT
	CONCAT(CS.first_name,' ',CS.last_name) 'Cliente',
    FI.title 'Filme',
    RT.rental_date 'Data de Locação',
    RT.return_date 'Retorno'
FROM
	customer CS
    INNER JOIN
    rental RT ON(CS.customer_id = RT.customer_id AND RT.return_date IS NULL)
    INNER JOIN
    inventory IV ON(RT.inventory_id = IV.inventory_id)
    INNER JOIN 
    film FI ON(IV.film_id = FI.film_id)
GROUP BY CS.customer_id
;

/*	43) EXIBIR A QUANTIDADE DE FILMES COM LOCAÇÕES EM ABERTO	*/
SELECT
    FI.title 'Filme',
    COUNT(RT.rental_id) 'Quantidade de Filmes em Aberto'
FROM
	film FI
    INNER JOIN
    inventory IV ON(FI.film_id = IV.film_id)
    INNER JOIN
    rental RT ON(IV.inventory_id = RT.inventory_id AND RT.return_date IS NULL)
GROUP BY FI.title
;

/*	44) EXIBIR A QUANTIDADE DE FILMES ALUGADOS EM MAIO/2006	*/
SELECT
    COUNT(FI.title) 'Quantidade de filmes alugados em Maio de 2006'
FROM
	film FI
    INNER JOIN
    inventory IV ON(FI.film_id = IV.film_id)
    INNER JOIN
    rental RT ON(IV.inventory_id = RT.inventory_id AND RT.rental_date LIKE '2006-06%')
;

/*	45) EXIBIR O ID DA LOJA E A QUANTIDADE DE LOCAÇÕES EFETUADAS POR CADA LOJA	*/
SELECT
	ST.store_id 'Id. da Loja',
    COUNT(RT.rental_id) 'Qtd. Locações Efetuadas'
FROM
	store ST
    INNER JOIN
    inventory IV ON(IV.store_id = ST.store_id)
    INNER JOIN
    rental RT ON(RT.inventory_ID = IV.inventory_ID)
GROUP BY ST.store_id
;  

/*	46) EXIBIR O ID DA LOJA E A QUANTIDADE DE CLIENTES DE CADA LOJA	*/
SELECT
	ST.store_id 'Id. da Loja',
    COUNT(CT.customer_id) 'Qtd. Clientes de cada loja'
FROM
	store ST
    INNER JOIN
    customer CT ON(ST.store_id = CT.store_id)
GROUP BY ST.store_id
;  

/*	47) EXIBIR O NOME DO FILME E O VALOR TOTAL RECEBIDO PELA LOCAÇÃO, SOMENTE DO FILME QUE MAIS FOI ALUGADO	*/
SELECT
	FI.title 'Filme',
    SUM(PY.amount) 'Valor Arrecadado'
FROM
	film FI
    INNER JOIN
    inventory IV ON(FI.film_id = IV.film_id)
    INNER JOIN
    rental RT ON(IV.inventory_id = RT.inventory_id)
    INNER JOIN
    payment PY ON(PY.rental_id = RT.rental_id)
;