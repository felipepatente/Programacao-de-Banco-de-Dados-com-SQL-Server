INSERT INTO Navio
(nome,qtdVelas,anoFabricacao,Cancao)
output inserted.id
VALUES
('Perola Negra',5,1992,'la la la la la la');

SELECT * FROM Pirata;

DECLARE @x table (id int)

INSERT INTO Navio
(nome,qtdVelas,anoFabricacao,Cancao)
output inserted.id INTO @x
VALUES
('Perola Negra',5,1992,'la la la la la la')

SELECT id FROM @x;
GO


INSERT INTO Navio
(nome,qtdVelas,anoFabricacao,Cancao)
VALUES
('Perola Negra',5,1992,'la la la la la la')

SELECT SCOPE_IDENTITY();
GO

INSERT INTO Pirata
(nome,dtNasc)
VALUES
('Pirata Patente2',GETDATE())

SELECT * FROM Navio;
SELECT * FROM Expedicao;

SELECT MAX(id) FROM Pirata;
GO


CREATE PROCEDURE pr_SelecionarPiratas 

AS

SELECT id, nome, CONVERT(varchar, dtNasc, 103)
FROM Pirata

sp_helptext pr_SelecionarPiratas 


ALTER PROCEDURE pr_SelecionarPiratas 

AS

SELECT id, nome, CONVERT(varchar, dtNasc, 103)
FROM Pirata


































