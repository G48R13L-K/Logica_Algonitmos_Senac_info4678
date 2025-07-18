--2602 - Select Básico
select name from customers where state = 'RS'


--2603 - Endereço dos Clientes
select name, street from customers where city = 'Porto Alegre'


--2604 - Menores que 10 ou Maiores que 100     
select id, name from products where price < 10 or price >100


--2605 - Representantes Executivos
select 
    products.name, 
    providers.name
from 
    products,
    providers 
where 
    products.id_providers = providers.id
    and
    products.id_categories = 6


--2606 - Categorias
SELECT  
products.id,
 products.name
FROM 
  products,
  categories 
WHERE 
    categories.id = products.id_categories
    and
    categories.name LIKE 'super%';


--2607 - Cidades em Ordem Alfabética
select
 distinct city 
 from
 providers
 order by
 city


--2608 - Maior e Menor Preço
select
 max(price),
 min(price)
from
 products


--2609 - Produtos por Categorias
select 
    categories.name,
    sum(products.amount)
from
    products,
    categories
where
    products.id_categories = categories.id
group by
    categories.name


--2614 - Locações de Setembro
SELECT
  c.name,
  r.rentals_date
FROM
  customers AS c
JOIN
  rentals AS r
  ON c.id = r.id_customers
WHERE
  EXTRACT(YEAR FROM r.rentals_date) = 2016
  AND EXTRACT(MONTH FROM r.rentals_date) = 9;


--2610 - Valor Médio dos Produtos
    select
        Round(AVG(price),2)
    from
        products


--2611 - Filmes de Ação
select
    movies.id,
    movies.name
from
    movies,
    genres
where
    genres.id = movies.id_genres
    and genres.description = 'Action'


--2613 - Filmes em Promoção
select
    movies.id,
    movies.name
from
    movies,
    prices
where
    prices.id = movies.id_prices and
    prices.value < 2


--2615 - Expandindo o Negocio
select
    distinct customers.city
from
    customers


--2616 - Nenhuma Locação
SELECT customers.id, customers.name
FROM customers 
LEFT JOIN locations ON customers.id = locations.id_customers
WHERE locations.id_customers IS NULL
ORDER BY customers.id;


--2617 - Fornecedor Ajax SA
select
    products.name,
    providers.name
from
    products,
    providers
where
    products.id_providers = providers.id
and
    providers.name = 'Ajax SA'


--2618 - Produtos Importados
select
    products.name,
    providers.name,
    categories.name
from
    products,
    providers,
    categories
where
    categories.id = products.id_categories
and
    products.id_providers = providers.id
and
    categories.name = 'Imported'
and 
    providers.name = 'Sansul SA'


--2619 - Super Luxo
select
    products.name,
    providers.name,
    products.price
from
    products,
    providers,
    categories
where
    categories.id = products.id_categories
and
    products.id_providers = providers.id
and
    categories.name = 'Super Luxury'
and
    products.price > 1000 


--2620 - Pedidos no Primeiro Semestre
SELECT 
    customers.name, 
    orders.id
FROM 
    customers
JOIN 
    orders ON orders.id_customers = customers.id
WHERE 
    orders.orders_date BETWEEN '2016-01-01' AND '2016-06-30';


--2621 - Quantidades Entre 10 e 20
select
    products.name
from
    products,
    providers
where
    providers.id = products.id_providers
and
    products.amount > 10 and products.amount < 20
and 
    providers.name LIKE 'P%'


--2625 - Máscara de CPF
select
    CONCAT(
    SUBSTRING(natural_person.cpf, 1, 3),'.', 
    SUBSTRING(natural_person.cpf, 4, 3),'.', 
    SUBSTRING(natural_person.cpf, 7, 3),'-', 
    SUBSTRING(natural_person.cpf, 10, 2)) as CPF
from
    natural_person
    


--2737 - Advogados
SELECT 
    X.name,
    X.customers_number
FROM (
    SELECT 
        name,
        customers_number
    FROM lawyers
    WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)

    UNION ALL

    SELECT 
        name,
        customers_number
    FROM lawyers
    WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers)

    UNION all

    SELECT 
        'Average' AS name,
        CAST(AVG(customers_number) AS INT) AS customers_number
    FROM lawyers
) X


--2738 - Concurso
select
    candidate.name,
Round(((math*2)+(specific*3)+(project_plan*5))/10, 2) as avg
from
candidate,
score
where 
    candidate.id = score.candidate_id
order by avg DESC


--2739 - Dia de Pagamento
SELECT 
name,
cast(EXTRACT(DAY FROM payday)as integer) AS day
FROM loan;


--2740 - Liga
SELECT 
    CASE
        WHEN position < 4 THEN CONCAT('Podium: ', team)
        WHEN position > 13 THEN CONCAT('Demoted: ', team)
    END AS team
FROM
    league
WHERE   
    league.position < 4 OR league.position>13;


--2741 - Notas dos Alunos
    SELECT 
    CONCAT('Approved: ', name) as name,
    grade AS grade
FROM 
    students
WHERE 
    grade >= 7
ORDER BY 
    grade DESC;


--2742 - O Multiverso de Richard
select
    life_registry.name,
    round(life_registry.omega*1.618,3) as "Fator N"
from
    dimensions,
    life_registry
where
    dimensions.id = life_registry.dimensions_id
and
    (dimensions.name = 'C875' or dimensions.name= 'C774')
and 
    life_registry.name like 'Richard%' 
order by
    life_registry.omega ASC


--2743 - Quantidade de Caracteres
select
    name,
    CHAR_LENGTH(name) as length
from
    people
order by
    length desc


--2744 - Senhas
