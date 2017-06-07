SELECT * FROM Pirata;

CREATE TABLE logs(
	id INT PRIMARY KEY IDENTITY(1,1),
	idAlterado INT,
	tabela VARCHAR(20),
	data DATE,
	maquina VARCHAR(50)
);


SELECT * FROM Vilarejo;
INSERT INTO Vilarejo VALUES (1,'JACIRA',45)

SELECT * FROM Navio;
INSERT INTO Navio VALUES (1,'PEROLA NEGERA', 28, '20021426','LA LA LA');


SELECT * FROM Pirata;
INSERT INTO Pirata (ID, nome, dtNasc, vilarejo, descritivo, navio) VALUES (1,'Felipe','20020215',1,'velho',1);


SELECT * FROM Pirata;


GO
ALTER TRIGGER tr_LogPirata ON pirata
FOR UPDATE, INSERT 
AS
INSERT INTO logs (idAlterado, tabela, data, maquina) 
SELECT id, 'Pirata', GETDATE(), HOST_NAME()
FROM inserted

SELECT * FROM logs;



GO
CREATE TRIGGER tr_LogVilareijo ON Vilarejo
FOR UPDATE, INSERT 
AS
INSERT INTO logs (idAlterado, tabela, data, maquina) 
SELECT id, 'Vilareijo', GETDATE(), HOST_NAME()
FROM inserted


GO
ALTER TRIGGER tr_LogVilareijo ON Vilarejo
FOR UPDATE, INSERT 
AS
select * from inserted


SELECT * FROM Vilarejo;
INSERT INTO Vilarejo VALUES (3,'Angela',50);

SELECT * FROM Vilarejo;

SELECT * FROM logs;


GO
CREATE TRIGGER tr_LogNavio ON navio
FOR UPDATE, INSERT
AS
INSERT INTO logs (idAlterado, tabela, data, maquina)
SELECT id, 'Navio', GETDATE(), HOST_NAME()
FROM inserted;


SELECT * FROM Navio;
INSERT INTO Navio VALUES (2,'PEROLA NEGERA', 28, '20021426','LA LA LA');

SELECT * FROM logs;

GO
CREATE TRIGGER tr_LogExpedicao ON Expedicao
FOR UPDATE, INSERT
AS
INSERT INTO logs (idAlterado,tabela,data,maquina)
SELECT idExpedicao, 'Expedição',GETDATE(),HOST_NAME()
FROM inserted;


SELECT * FROM  Expedicao;
INSERT INTO Expedicao (idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (1,1,1,'20020215',25);

SELECT * FROM logs;




SELECT * FROM Vilarejo;

GO
CREATE TRIGGER tr_ProtegeVilareijo ON vilarejo
FOR  UPDATE, DELETE
AS
IF EXISTS (SELECT id FROM deleted WHERE id <= 5)
BEGIN
	ROLLBACK
	RAISERROR ('Os 5 primeiros não pode ser inserido ou alterado',10,1,5)
END



DELETE FROM Vilarejo WHERE id = 2;
