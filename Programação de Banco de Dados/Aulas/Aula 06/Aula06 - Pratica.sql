-- Exibir o tipo (livro) e o preço medio de cada tipo
SELECT type, AVG(price) AS 'Preço Médio'
FROM titles
GROUP BY type;

-- Exibir o tipo e o maior preço de cada tipo
SELECT type, MAX(price) AS 'Maior Preço de cada Tipo'
FROM titles
GROUP BY type;


-- Exibir o tipo, e a quantidade de cada tipo. Ordenado apartir do maior valor.
SELECT type, COUNT(*) AS 'Quantidade'
FROM titles
GROUP BY type
ORDER BY COUNT(*) DESC;


-- Exibir o estado e a quantidade de autores daquele estado, ordenado apartir do maior valor
SELECT state, COUNT(*) AS 'Quantidade'
FROM authors
GROUP BY state
ORDER BY COUNT(*) DESC;


-- Exibir o pub_id e o preço mais caro de cada pub_id (edtitora). Ordenado apartir do maior valor
SELECT pub_id, MAX(price)  AS 'Preço'
FROM titles
GROUP BY pub_id
ORDER BY MAX(price) DESC;


-- Exibir o tipo e a soma de cada tipo, ordenado pelo maior valor
SELECT type, SUM(price) AS 'Soma'
FROM titles
GROUP BY type
ORDER BY SUM(price) DESC;



-- Exibir as editoras e seus livros escritos, assim como seu pais, seu estado e o preço dos livros
SELECT p.pub_name, t.title, t.price, p.state, p.country
FROM titles AS t
INNER JOIN publishers AS P
ON t.pub_id = p.pub_id;

-- Com FULL
SELECT p.pub_id, p.pub_name, t.title, t.price, p.state, p.country
FROM titles AS t
FULL JOIN publishers AS P
ON t.pub_id = p.pub_id;


-- Com LEFT
SELECT p.pub_id, p.pub_name, t.title, t.price, p.state, p.country
FROM titles AS t
LEFT JOIN publishers AS P
ON t.pub_id = p.pub_id;


-- Com RIGHT
SELECT p.pub_id, p.pub_name, t.title, t.price, p.state, p.country
FROM titles AS t
RIGHT JOIN publishers AS P
ON t.pub_id = p.pub_id;

-- Exibir o nome do autor, seu telefone e os livros escritos por esses autores
SELECT a.au_fname, a.phone, t.title
FROM titles AS t
INNER JOIN titleauthor AS ta
ON t.title_id = ta.title_id
INNER JOIN authors AS a
ON ta.au_id = a.au_id


-- Exibir o titulo e a quantidade de autores que escreveram esses livros, ordenando do maior para o menor
SELECT t.title, COUNT(*)
FROM titles AS t
INNER JOIN titleauthor AS ta
ON t.title_id = ta.title_id
INNER JOIN authors AS a
ON ta.au_id = a.au_id
GROUP BY t.title
ORDER BY COUNT(*) DESC;





