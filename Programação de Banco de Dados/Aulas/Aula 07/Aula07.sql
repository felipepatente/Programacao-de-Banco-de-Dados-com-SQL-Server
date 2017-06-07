-- 2 - Agrupe e conte os autores pela primeira letra do seu sobrenome. Exiba em ordem decrescente.
SELECT SUBSTRING(au_lname,1,1), COUNT(*)
FROM authors
GROUP BY SUBSTRING(au_lname,1,1)
ORDER BY SUBSTRING(au_lname,1,1) DESC;


-- 3 - Exiba com um único select, quantas cidades diferentes existem no cadastro de autores. (Quantas, e não quais).
SELECT COUNT(DISTINCT city) AS 'Quantidade de Cidades'
FROM authors;

-- 4 - Exiba o preço do livro mais barato de cada editora (nome da editora e preço).
SELECT pub_name, MIN(price)
FROM titles t 
INNER JOIN publishers P
ON t.pub_id = p.pub_id
GROUP BY pub_name;


-- 5 - Utilizando agora as tabelas Employee (Empregado) e Jobs (Trabalhos), exiba uma relação de todos os empregados 
-- e suas profissões, ordenados pela data de contratação.
SELECT fname, lname, job_desc
FROM employee AS e
INNER JOIN jobs AS j
ON e.job_id = j.job_id
ORDER BY e.hire_date;


-- 6 - Exiba agora uma relação com todos os Jobs, e ao lado os funcionários associados a ele, caso existam.
SELECT fname, lname, job_desc
FROM employee AS e
RIGHT JOIN jobs AS j
ON e.job_id = j.job_id
ORDER BY e.hire_date;


-- 7 - Exiba quais autores vivem na mesma cidade de uma editora.
SELECT au_fname, au_lname, pub_name
FROM authors a
INNER JOIN publishers p
ON a.city = p.city;


-- Consulta sem INNER JOIN 
SELECT title, pub_name
FROM titles t, publishers p
WHERE t.pub_id = p.pub_id;




-- SUBQUERIES - multiConsulta
-- Exibir o titulo do livro mais caro, usando sub consultas
SELECT title
FROM titles
WHERE price IN (SELECT MAX(price) 
				FROM titles);

-- Exibir todos os livros e seus preços que tenha os preços maiores do que os livros do tipo type 'business'. Usando sub consultas
SELECT title, price
FROM titles
WHERE price > ALL (SELECT price 
					FROM titles
					WHERE type = 'business');


-- Mesmo caso de cima
SELECT title, price
FROM titles
WHERE price >  (SELECT MAX(price) 
					FROM titles
					WHERE type = 'business')
		   
-- Trazer todos os dados dos autores que moram na mesma cidade do que uma editora. Usando sub consulta
SELECT * 
FROM authors
WHERE city IN 
			(SELECT DISTINCT city 
			FROM publishers);


-- Exibir o tipo e sua media que sejam maior do que 20
SELECT type, AVG(price) AS 'Média Preço'
FROM titles
GROUP BY type
HAVING AVG(price) > 20;


-- Exibir os titulos dos livros cujas editoras residem em 'Berkeley'. Usando INNER JOIN
SELECT title
FROM titles AS t
INNER JOIN publishers AS p
ON t.pub_id = p.pub_id
WHERE p.city = 'Berkeley'


-- Exibir os titulos dos livros cujas editoras residem em 'Berkeley'. Usando sub consulta
SELECT title
FROM titles
WHERE pub_id IN (SELECT pub_id FROM publishers WHERE city = 'Berkeley');



-- Exibir os tipos e titulos dos livros cujo preço seja maior que a media do proprio tipo. Usando sub consulta
SELECT type, t1.title
FROM titles AS t1
WHERE price > ALL (SELECT AVG(t2.price)
				FROM titles AS t2
				WHERE t2.type = t1.type);



-- Exiba todos os autores que vivem na mesma cidade que outro autor - Não exibir o mesmo autor duas vezes
SELECT a1.au_fname, a2.au_fname, a1.city
FROM authors AS a1
INNER JOIN authors AS a2
ON a1.city = a2.city 
WHERE a1.au_fname <> a2.au_fname;

