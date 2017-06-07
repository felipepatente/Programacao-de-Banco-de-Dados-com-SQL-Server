-- 1 - Crie uma consulta que calcule e exiba quantos dias se passaram desde o seu nascimento.
SELECT DATEDIFF(DAY,'19930326',GETDATE());

-- 2 - Exiba o nome completo de todos os autores concatenados em uma única coluna, e a cidade e o 
-- estado que vivem, no formato CIDADE - UF em outra.
SELECT au_fname + ' ' + au_lname AS [Nome Completo], city + ' - ' + state AS [Cidade - UF]
FROM authors;

-- 3 - Exiba os 10 primeiros caracteres do título de todos os livros cujo preço seja maior que 10 e o tipo não comece com "T".
SELECT SUBSTRING(title,1,10), type, price
FROM titles
WHERE ytd_sales > 10 AND type NOT LIKE 'T%'; 


-- 4 - Exiba uma lista de todos os titulos, o nome por extenso do mês de sua publicação e quantos anos se passaram
-- desde que ele foi publicado.
SELECT title, DATENAME(MONTH,pubdate) AS [Mês de Publicação], DATEDIFF(YEAR,pubdate,GETDATE()) AS [Anos]
FROM titles

-- 5 - Exiba todos os titulos, tipo, e o preço no formato "R$ 0,00" (com o símbolo de real na frente).
SELECT title, 'R$ ' + CAST(price AS VARCHAR) AS [Preço]
FROM titles

-- 6 - Quantas editoras existem no banco de dados?
SELECT COUNT(*) AS [Quantidade de Editora]
FROM publishers;

-- 7 - Qual o preço médio dos livros de psicologia?
SELECT AVG(price) AS [Media dos Preços do Livro de Psychology ]
FROM titles
WHERE type = 'psychology';


-- 8 - Exiba todos os livros, colocando no atributo preço o texto "Não Informado" quando este for nulo.
SELECT title, ISNULL(CAST(price AS VARCHAR), 'Não Informado') AS 'Price'
FROM titles;