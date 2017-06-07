-- 1 - Quantos autores moram em cada estado? Exiba uma lista que contem a sigla do estado em uma coluna e a 
-- quantidade de autores na outra.
SELECT state, COUNT(*) AS 'Quantidade'
FROM authors
GROUP BY state;


-- 2 - Agrupe e conte os autores pela primeira letra do seu sobrenome. Exiba em ordem decrescente.
SELECT SUBSTRING(au_lname,1,1) AS '1° Letra do Nome', COUNT(*) AS 'Quantidade'
FROM authors
GROUP BY SUBSTRING(au_lname,1,1)
ORDER BY SUBSTRING(au_lname,1,1) DESC;



-- 3 - Exiba com um único select, quantas cidades diferentes existem no cadastro de autores. (Quantas, e não quais).
SELECT COUNT(DISTINCT city) AS 'Quantidade de Cidades'
FROM authors;



-- 4 - Exiba o preço do livro mais barato de cada editora (nome da editora e preço).
SELECT p.pub_name, MIN(t.price) AS 'Livro mais Barato'
FROM publishers AS p
INNER JOIN titles AS t
ON p.pub_id = t.pub_id
GROUP BY P.pub_name;


-- 5 - Utilizando agora as tabelas Employee (Empregado) e Jobs (Trabalhos), exiba uma relação de todos os empregados 
-- e suas profissões, ordenados pela data de contratação.
SELECT e.fname, j.job_desc, e.hire_date
FROM employee AS e
INNER JOIN jobs AS j
ON e.job_id = j.job_id
ORDER BY e.hire_date;



-- 6 - Exiba agora uma relação com todos os Jobs, e ao lado os funcionários associados a ele, caso existam.
SELECT j.job_desc, e.fname
FROM jobs AS j
INNER JOIN employee AS e
ON j.job_id = e.job_id
ORDER BY e.hire_date;


-- 7 - Exiba quais autores vivem na mesma cidade de uma editora.
SELECT au_fname, au_lname, pub_name
FROM authors a
INNER JOIN publishers p
ON a.city = p.city;



-- 8 - Desafio: Quais editoras publicaram livros que foram vendidos por lojas com algum tipo de desconto? E qual 
-- foi o desconto total praticado por cada uma dessas editoras?
SELECT p.pub_name, SUM(d.discount) AS 'Total'
FROM discounts AS d
INNER JOIN stores AS so
ON d.stor_id = so.stor_id
INNER JOIN sales AS sa
ON so.stor_id = sa.stor_id
INNER JOIN titles AS t
ON sa.title_id = t.title_id
INNER JOIN publishers AS p
ON t.pub_id = p.pub_id
GROUP BY p.pub_name
