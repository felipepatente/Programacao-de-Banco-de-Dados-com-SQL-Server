SELECT * FROM Pirata;
SELECT * FROM Expedicao;
SELECT * FROM Navio;
SELECT * FROM Vilarejo;

GO
DECLARE @x TABLE (id INT)
INSERT INTO Vilarejo (id,nome, qtdHabitantes) 
output inserted.id INTO @x
VALUES (4,'Perola Negra',25);
DECLARE @vilareijo INT =  (SELECT id FROM @x)

DECLARE @y TABLE (id INT)
INSERT INTO Navio (id,nome,qtdVelas,anoFabricacao,Cancao)
output inserted.id INTO @y
VALUES (2,'Chapeu',25,'20020512','la la la')
DECLARE @navio INT =  (SELECT id FROM @y)

INSERT INTO Expedicao(idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (2,@navio, @vilareijo,'20020412',25)
GO


declare @x int
insert into Navio
(id,nome,qtdVelas, anoFabricacao, Cancao)
output inserted.id
values
(5,'Perna de pau',26,'20020512','la la la')
GO

GO
CREATE PROCEDURE pr_SelecionarPiratasVilareijos
AS
SELECT p.nome AS 'Nome Pirata', dtNasc, descritivo, v.nome AS 'Nome Vilareijo', v.qtdHabitantes
FROM Pirata AS p
INNER JOIN Vilarejo AS v
ON p.id = v.id
GO

EXECUTE pr_SelecionarPiratasVilareijos;



GO
ALTER PROCEDURE pr_SelecionarPiratasVilareijos
AS
SELECT p.nome AS 'Nome Pirata', dtNasc, descritivo, v.nome AS 'Nome Vilareijo', v.qtdHabitantes
FROM Pirata AS p
INNER JOIN Vilarejo AS v
ON p.id = v.id
WHERE p.nome = 'Lufy'
GO

EXECUTE pr_SelecionarPiratasVilareijos;

GO
ALTER PROCEDURE pr_SelecionarPiratasVilareijos
(@nome VARCHAR(10))
AS
SELECT p.nome AS 'Nome Pirata', dtNasc, descritivo, v.nome AS 'Nome Vilareijo', v.qtdHabitantes
FROM Pirata AS p
INNER JOIN Vilarejo AS v
ON p.id = v.id
WHERE p.nome LIKE '%' + @nome + '%'
GO

EXECUTE pr_SelecionarPiratasVilareijos 'u';



GO
ALTER PROCEDURE pr_SelecionarPiratasVilareijos
(@nome VARCHAR(10) = '%')
WITH ENCRYPTION
AS
SELECT p.nome AS 'Nome Pirata', dtNasc, descritivo, v.nome AS 'Nome Vilareijo', v.qtdHabitantes
FROM Pirata AS p
INNER JOIN Vilarejo AS v
ON p.id = v.id
WHERE p.nome LIKE '%' + @nome + '%'
GO


EXECUTE pr_SelecionarPiratasVilareijos 'u';

GO
CREATE PROCEDURE pr_QuantidadeHabitantes
AS
SELECT SUM(qtdHabitantes) AS 'Quantidade de Habitantes' 
FROM Vilarejo;
GO

EXECUTE pr_QuantidadeHabitantes;







