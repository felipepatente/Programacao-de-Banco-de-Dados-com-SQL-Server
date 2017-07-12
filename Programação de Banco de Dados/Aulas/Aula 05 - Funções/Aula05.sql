SELECT title, price
FROM titles
-- Ordena pela coluna price, depois pela coluna title
ORDER BY price, title;

-- o DISTINCT impede que traz valores repetidos
SELECT DISTINCT (type)
FROM titles;
-- Começa pelo valor 1. O exemplo abaixo indica que vai pegar a 1° letra e andar duas casas 'Sen'
SELECT SUBSTRING('Senac',1,3);

-- Tambem pode ser feito com colunas
SELECT SUBSTRING(title,1,3) AS Titulo
FROM titles;

-- Começa a contar pelo valor 1
SELECT LEN('Senac');

-- Tambem pode ser feito com colunas
SELECT title, LEN(title) AS [Tamanho da Palavra]
FROM titles

-- Arredonda o valor para cima, neste caso 5
SELECT CEILING(4.1);

-- Arredonda o valor para baixo, neste caso 34
SELECT FLOOR(34.1);

-- Raiz quadrada
SELECT SQRT(25);

-- Seno de 4
SELECT SIN(4);

-- Coseno de 4
SELECT COS(4);

-- Pega a data atual do sistema (servidor)
SELECT GETDATE();

-- Pega o dia atual
SELECT DAY(GETDATE()) AS [Dia atual];

-- Pega a coluna title, e seu ano de publicação
SELECT title, YEAR(pubdate)
FROM  titles;

-- Pega o nome do mês 
SELECT DATENAME(MONTH,GETDATE()) AS [Mês];

-- Pega o nome do dia da semana
SELECT DATENAME(WEEKDAY,(GETDATE())) AS [Dia];

--Pega a quantidade de dias desde a data que esta no parametro
SELECT DATEDIFF(DAY,'19970324', GETDATE());

-- Pega a quantidade de anos desde a data que esta no parametro
SELECT DATEDIFF(YEAR,'19970324', GETDATE());

-- Adiciona 38 dias na data
SELECT DATEADD(DAY,38,GETDATE());

-- Diminui 15 dias na data
SELECT DATEADD(DAY,-15,GETDATE());

SELECT 'A' + '3';

-- Faz a conversão do inteiro 3 para uma VARCHAR 3
SELECT 'A' + CAST(3 AS VARCHAR);

-- Pega a coluna title junto da coluna price que esta concatenando com a string 'R$' e renomeando a coluna (na hora de exibir) pra Preço
SELECT title, 'R$ ' + CAST(price AS VARCHAR) AS [Preço]
FROM titles;

-- Apresenta a data no formato britanico (por causa do codigo 103)
SELECT CONVERT(VARCHAR, GETDATE(), 103);

SELECT title, ISNULL(price,0)
FROM titles
ORDER BY price;













