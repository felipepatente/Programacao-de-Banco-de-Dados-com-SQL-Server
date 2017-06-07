SELECT * FROM Expedicao;
SELECT * FROM Navio;
SELECT * FROM Pirata;
SELECT * FROM Vilarejo;

INSERT INTO Navio(id,nome, qtdVelas, anoFabricacao, Cancao)
VALUES (1,'Perola Negra',25,'19990210','la la la')


INSERT INTO Vilarejo (id,nome, qtdHabitantes)
VALUES (1,'Jardim Jacira',25);


INSERT INTO Pirata (id,nome, dtNasc, vilarejo, descritivo, navio)
VALUES (1,'Felipe','19930326',1,'Bagunçado',1);

INSERT INTO Expedicao(idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (1,1,1,'20021226',25.25);

--  Impede que uma data de Saque seja posterior à data atual.
GO
CREATE TRIGGER tr_ProtegerDataSaque ON Expedicao
FOR INSERT, UPDATE
AS
	IF (SELECT DATEDIFF(DAY,'00010101',DtSaque) FROM inserted) > DATEDIFF(DAY,'00010101',GETDATE())
	BEGIN
		RAISERROR('Data invalida',10,1,5)
		ROLLBACK
	END 


INSERT INTO Expedicao(idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (2,1,1,'20170526',25.25);

INSERT INTO Expedicao(idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (3,1,1,'20170527',25.25);


-- b) Impede que seja inserida uma expedição para um vilarejo com menos de 100 habitantes
SELECT * FROM Expedicao;
SELECT * FROM Vilarejo;

GO
ALTER TRIGGER tr_ImpedirInseirExpedicaoComVilarejoMenorQue100Habitante ON Expedicao
FOR INSERT, UPDATE
AS
	IF (SELECT V.qtdHabitantes 
		FROM inserted AS i
		INNER JOIN Vilarejo AS v
		ON i.Vilarejo = v.id) <= 100

		BEGIN
			RAISERROR('Não é permitida a inserção de expedição com vilareijos com menos de 100 habitantes',10,5,1);
			ROLLBACK;
		END
	

SELECT * FROM Vilarejo;

INSERT INTO Vilarejo (id, nome, qtdHabitantes)
VALUES (2,'Calu',150);

INSERT INTO Vilarejo (id, nome, qtdHabitantes)
VALUES (3,'Angela',100);

SELECT * FROM Expedicao;

INSERT INTO Expedicao(idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (4,1,2,'20170526',25.25);

INSERT INTO Expedicao(idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (5,1,1,'20170526',25.25);



-- 2 - Crie uma view que traz o id, o nome de um navio e sua tripulação.
SELECT * FROM Navio;
SELECT * FROM Pirata;

INSERT INTO Navio(id,nome,qtdVelas,anoFabricacao,Cancao)
VALUES(2,'Holandes Voador',12,'20021225','la la la')

INSERT INTO Pirata(id,nome,dtNasc,vilarejo,descritivo,navio)
VALUES(2,'Dave','19880525',1,'tentacolos',2);

INSERT INTO Pirata(id,nome,dtNasc,vilarejo,descritivo,navio)
VALUES(3,'Jack','19880525',1,'cheira a rum',1);

GO
CREATE VIEW vw_PiratasNavios
AS
	SELECT p.id, n.nome AS 'Navio', p.nome AS 'Piratas'
	FROM Pirata AS p
	INNER JOIN Navio AS n
	ON p.navio = n.id
GO

SELECT * FROM vw_PiratasNavios;

-- 3 - Crie uma tabela chamada "LogVilarejo" com os campos id, idVilarejo, nomeAnterior, nomeNovo, e máquina
-- Toda vez que a tabela vilarejo sofrer um update, insira um registro na logvilarejo com os detalhes desta alteração.

SELECT * FROM VIlarejo;

CREATE TABLE LogVilarejo(
	id INT PRIMARY KEY IDENTITY(1,1),
	idVilarejo INT,
	nomeAnterior VARCHAR(50),
	nomeNovo VARCHAR(50),
	maquina VARCHAR(100),

	CONSTRAINT fk_LogVilarejo FOREIGN KEY (idVilarejo) REFERENCES vilarejo (id)
);

GO
ALTER TRIGGER tr_AtualizarLogVilareijo ON Vilarejo
FOR UPDATE
AS
	INSERT INTO LogVilarejo(idVilarejo, nomeAnterior, nomeNovo, maquina)
	SELECT i.id, d.nome, i.nome, HOST_NAME()
	FROM inserted as i
	INNER JOIN deleted as d
	ON i.id = d.id
GO
	
UPDATE Vilarejo SET nome = 'Santo Amaro' WHERE id = 3;

SELECT * FROM LogVilarejo;
SELECT * FROM Vilarejo;


-- 4 - Crie uma procedure que recebe o código de um navio e exibe o total arrecadado em todas as expedições realizadas por ele.
GO
CREATE PROCEDURE pr_TotalArrecadado
(@id INT)
AS
SELECT SUM(ValorSaque)
FROM Expedicao
WHERE Navio = @id;
GO


SELECT * FROM Navio;
SELECT * FROM Expedicao;

INSERT INTO Expedicao(idExpedicao, Navio, Vilarejo, DtSaque, ValorSaque)
VALUES (6,2,2,'20170526',50);

EXEC pr_TotalArrecadado 2;


-- 6 - Crie uma procedure que recebe os parametros necessários para inserir um vilarejo e um pirata que nasceu lá. Você deverá fazer os 2 
-- inserts dentro da procedure. Seria correto utilizar uma transação?
GO
ALTER PROCEDURE pr_InserirPirataVilareijo
(@idVilarejo INT, @nomeVilarejo VARCHAR(50), @qtdHabitantes INT,
@idPirata INT, @nomePirata VARCHAR(50), @dtNac DATE, @vilareijo INT, @descritivo VARCHAR(50), @navio INT)
AS

BEGIN TRANSACTION
INSERT INTO Vilarejo(id,nome,qtdHabitantes)
VALUES(@idVilarejo,@nomeVilarejo, @qtdHabitantes);

INSERT INTO Pirata(id,nome,dtNasc,vilarejo,descritivo,navio)
VALUES(@idPirata,@nomePirata,@dtNac,@vilareijo,@descritivo,@navio);

IF @@ERROR = 0
BEGIN
	COMMIT
END
ELSE
BEGIN
	ROLLBACK
END 
GO

SELECT * FROM Vilarejo;
SELECT * FROM Pirata;


EXEC pr_InserirPirataVilareijo 11, 'Vila Mariana', 200, 10, 'Natalie', '20021205', 1, 'Sujo', 1;


