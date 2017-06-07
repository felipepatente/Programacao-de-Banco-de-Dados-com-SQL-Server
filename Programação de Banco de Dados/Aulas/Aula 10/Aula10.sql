SELECT * FROM Expedicao;
SELECT * FROM Navio;
SELECT * FROM Pirata;
SELECT * FROM Vilarejo;

SELECT * FROM pubs..titles;


INSERT INTO Expedicao (Navio,Vilarejo,DtSaque,ValorSaque)
VALUES (1,2,'20021226',48);

INSERT INTO Vilarejo (nome,qtdHabitantes)
VALUES ('Itapecerica',1200),
	   ('Morumbi',6500),
	   ('Pinheiros',7000);


INSERT INTO Vilarejo (nome,qtdHabitantes)
SELECT top 10 type, ytd_sales
FROM pubs..titles;

SELECT n.nome, e.DtSaque
FROM Navio AS n
INNER JOIN Expedicao AS e
ON n.id = e.Navio
WHERE 30 <= (SELECT DATEDIFF(YEAR,e.DtSaque,GETDATE()));

SELECT n.nome, e.DtSaque
FROM Navio AS n
INNER JOIN Expedicao AS e
ON n.id = e.Navio
WHERE DATEDIFF(YEAR,e.DtSaque,GETDATE()) >= 30;

