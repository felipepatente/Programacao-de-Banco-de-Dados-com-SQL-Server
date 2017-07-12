-- 1 - No banco de dados dos piratas, crie uma trigger que:

-- a) Impede que uma data de Saque seja posterior à data atual.
CREATE TRIGGER tr_ProtegerDataSaque ON Expedicao
FOR INSERT, UPDATE
AS
	IF (SELECT DATEDIFF(DAY,'00010101',DtSaque) FROM inserted) > DATEDIFF(DAY,'00010101',GETDATE())
	BEGIN
		RAISERROR('Data invalida',10,1,5)
		ROLLBACK
	END



-- b) Impede que seja inserida uma expedição para um vilarejo com menos de 100 habitantes
GO
CREATE TRIGGER tr_ImpedirInseirExpedicaoComVilarejoMenorQue100Habitante ON Expedicao
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


-- 2 - Crie uma view que traz o id, o nome de um navio e sua tripulação.

SELECT * FROM Navio;
SELECT * FROM Pirata;

GO
CREATE VIEW vw_PiratasNavios
AS
	SELECT p.id, n.nome AS 'Navio', p.nome AS 'Piratas'
	FROM Pirata AS p
	INNER JOIN Navio AS n
	ON p.navio = n.id
GO


-- 3 - Crie uma tabela chamada "LogVilarejo" com os campos id, idVilarejo, nomeAnterior, nomeNovo, e máquina
-- Toda vez que a tabela vilarejo sofrer um update, insira um registro na logvilarejo com os detalhes desta alteração.

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

-- 4 - Crie uma procedure que recebe o código de um navio e exibe o total arrecadado em todas as expedições realizadas por ele.
GO
CREATE PROCEDURE pr_TotalArrecadado
(@id INT)
AS
SELECT SUM(ValorSaque)
FROM Expedicao
WHERE Navio = @id;
GO

-- 5 - Crie uma procedure que recebe os parametros necessários para inserir um vilarejo e um pirata que nasceu lá. Você deverá fazer os 2 
-- inserts dentro da procedure. Seria correto utilizar uma transação?
GO
CREATE PROCEDURE pr_InserirPirataVilareijo
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








