-- 1  Escreva uma consulta que exibe o nome, sobrenome e o telefone de todos os autores
SELECT au_fname, au_lname, phone
FROM authors


-- 2 Escreva uma consulta que exibe o titulo, o preço, e o preço aumentado em 10% de todos os 
-- livros do banco de dados. Coloque alias de coluna no preço calculado.
SELECT title, price, price * 1.10 AS [Preço Aumentado]
FROM titles;

-- 3 - Selecione todos os autores da California
SELECT *
FROM authors
WHERE state = 'CA';

-- 4 - Selecione todos os livros com preco menor ou igual a 20 de computação popular.
SELECT * 
FROM titles
WHERE price <= 20 AND type = 'popular_comp';

-- 5 - Selecione todos os autores cujo nome comece com a letra M e morem em Oakland, 
-- também aqueles cujo nome comece com A e more em Berkeley.
SELECT * 
FROM authors
WHERE (au_fname LIKE 'M%' AND city = 'Oakland') OR (au_fname LIKE 'A%' AND city = 'Berkeley');


-- 6 - Selecione todos os autores cujo sobrenome comece com G e a terceira letra seja E.
SELECT *
FROM authors
WHERE au_lname LIKE 'G_E%';


-- 7 - Selecione todos os livros que tenham vendido entre 1000 e 5000 exemplares no ano.
-- (Você obtém esta informação na coluna ytd_sales).
SELECT *
FROM titles
WHERE ytd_sales BETWEEN 1000 AND 5000;


