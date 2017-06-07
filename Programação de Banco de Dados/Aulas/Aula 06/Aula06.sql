-- 1 - Crie uma consulta que calcule e exiba quantos dias se passaram desde o seu nascimento.
SELECT DATEDIFF(DAY,'19940709',GETDATE());

-- 2 - Exiba o nome completo de todos os autores concatenados em uma �nica coluna, e a cidade e o 
-- estado que vivem, no formato CIDADE - UF em outra.
SELECT AU_FNAME + ' ' + AU_LNAME AS 'Nome', CITY + ' - ' + STATE AS 'CIDADE - UF'
FROM authors;

-- 3 - Exiba os 10 primeiros caracteres do t�tulo de todos os livros cujo pre�o seja maior que 10 e o tipo n�o comece com "T".
SELECT SUBSTRING(title, 1,10)
FROM titles
WHERE price > 10 AND NOT type LIKE 'T%';


-- 4 - Exiba uma lista de todos os titulos, o nome por extenso do m�s de sua publica��o e quantos anos se passaram
-- desde que ele foi publicado.
SELECT title, DATENAME(MONTH, pubdate) AS 'M�S DE PUBLICA��O', DATEDIFF(YEAR,pubdate,GETDATE()) AS 'Anos'
FROM titles

-- 5 - Exiba todos os titulos, tipo, e o pre�o no formato "R$ 0,00" (com o s�mbolo de real na frente).
SELECT title, type, 'R$ ' + CAST (price AS VARCHAR) AS 'Pre�o'
FROM titles

-- 6 - Quantas editoras existem no banco de dados?
SELECT COUNT(*)
FROM publishers;

-- 7 - Qual o pre�o m�dio dos livros de psicologia?
SELECT AVG(price)
FROM titles
WHERE type = 'psychology'

-- 8 - Exiba todos os livros, colocando no atributo pre�o o texto "N�o Informado" quando este for nulo.
SELECT title, ISNULL(CAST(price AS VARCHAR), 'N�o Informado') AS 'Price'
FROM titles;


-- Aula de Programa��o de Banco de Dados

-- Exibir o tipo (livro) e o pre�o media de cada tipo
SELECT type, AVG(price) AS 'Pre�o M�dio'
FROM titles
GROUP BY type;

-- Exibir o tipo e o maior pre�o de cada tipo
SELECT type, MAX(price) AS 'Maior Pre�o'
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

-- Exibir o pub_id e o pre�o mais caro de cada pub_id (editora). Ordenando apartir do maior valor
SELECT pub_id, MAX(price) AS 'Pre�o'
FROM titles
GROUP BY pub_id
ORDER BY MAX(price) desc;



