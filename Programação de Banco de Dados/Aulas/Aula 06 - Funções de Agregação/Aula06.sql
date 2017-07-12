-- 1 - Crie uma consulta que calcule e exiba quantos dias se passaram desde o seu nascimento.
SELECT DATEDIFF(DAY,'19940709',GETDATE());

-- 2 - Exiba o nome completo de todos os autores concatenados em uma única coluna, e a cidade e o 
-- estado que vivem, no formato CIDADE - UF em outra.
SELECT AU_FNAME + ' ' + AU_LNAME AS 'Nome', CITY + ' - ' + STATE AS 'CIDADE - UF'
FROM authors;

-- 3 - Exiba os 10 primeiros caracteres do título de todos os livros cujo preço seja maior que 10 e o tipo não comece com "T".
SELECT SUBSTRING(title, 1,10)
FROM titles
WHERE price > 10 AND NOT type LIKE 'T%';


-- 4 - Exiba uma lista de todos os titulos, o nome por extenso do mês de sua publicação e quantos anos se passaram
-- desde que ele foi publicado.
SELECT title, DATENAME(MONTH, pubdate) AS 'MÊS DE PUBLICAÇÃO', DATEDIFF(YEAR,pubdate,GETDATE()) AS 'Anos'
FROM titles

-- 5 - Exiba todos os titulos, tipo, e o preço no formato "R$ 0,00" (com o símbolo de real na frente).
SELECT title, type, 'R$ ' + CAST (price AS VARCHAR) AS 'Preço'
FROM titles

-- 6 - Quantas editoras existem no banco de dados?
SELECT COUNT(*)
FROM publishers;

-- 7 - Qual o preço médio dos livros de psicologia?
SELECT AVG(price)
FROM titles
WHERE type = 'psychology'

-- 8 - Exiba todos os livros, colocando no atributo preço o texto "Não Informado" quando este for nulo.
SELECT title, ISNULL(CAST(price AS VARCHAR), 'Não Informado') AS 'Price'
FROM titles;


-- Aula de Programação de Banco de Dados

-- Exibir o tipo (livro) e o preço media de cada tipo
SELECT type, AVG(price) AS 'Preço Médio'
FROM titles
GROUP BY type;

-- Exibir o tipo e o maior preço de cada tipo
SELECT type, MAX(price) AS 'Maior Preço'
FROM titles
GROUP BY type;

-- Exibir o tipo, e a quatidade de cada tipo. Ordenado apartir do maior valor
SELECT type, COUNT(*) AS 'Quantidade'
FROM titles
GROUP BY type
ORDER BY COUNT(*) DESC;

-- Exibir o estado e a quantidade de autores daquele estado, ordenado apartir do maior valor
SELECT state, COUNT(*) AS 'Quantidade de Autores'
FROM authors
GROUP BY state
ORDER BY COUNT(*) DESC;

-- Exibir o pub_id e o preço mais caro de cada pub_id (editora). Ordenando apartir do maior valor
SELECT pub_id, MAX(price) AS 'Preço'
FROM titles
GROUP BY pub_id
ORDER BY MAX(price) desc;



