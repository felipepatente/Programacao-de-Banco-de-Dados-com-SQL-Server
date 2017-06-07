CREATE TABLE produto(
	nome varchar(50),
	quantidadeMin INT
);

CREATE TABLE estoque(
	quantidade INT
);


GO
CREATE TRIGGER tr_InserirQuantidade ON produto
FOR INSERT, UPDATE
AS
	DECLARE @quantidade INT
	SELECT @quantidade = quantidadeMin FROM inserted
	INSERT estoque(quantidade) VALUES (@quantidade * 2)


SELECT * FROM produto;
SELECT * FROM estoque;

INSERT INTO produto (nome,quantidadeMin)
VALUES ('Felipe',40);


INSERT INTO produto (nome,quantidadeMin)
VALUES ('Vassoura',30),
	   ('Messa',20);

GO
CREATE TRIGGER tr_VerQuantidade ON produto
FOR INSERT, UPDATE
AS
	IF (SELECT quantidadeMin FROM inserted) <= 50
	BEGIN
		RAISERROR('Valor Invalido',10,1,5)
		ROLLBACK
	END	



INSERT INTO produto (nome,quantidadeMin)
VALUES ('Roupa',80);

GO
ALTER TRIGGER tr_VerQuantidade ON produto
FOR INSERT, UPDATE
AS
	IF (SELECT quantidadeMin FROM inserted) = 50
	BEGIN
		RAISERROR('Valor Invalido',10,1,5)
		ROLLBACK
	END	



INSERT INTO produto (nome,quantidadeMin)
VALUES ('Roupa',30);


INSERT INTO produto (nome,quantidadeMin)
VALUES ('Roupa',50);


SELECT * FROM produto;

GO
DECLARE @nome VARCHAR(50), @quantidadeMin INT

DECLARE POR_CURSOR CURSOR
FOR		SELECT nome, quantidadeMin
		FROM produto

OPEN POR_CURSOR

FETCH NEXT FROM POR_CURSOR
INTO @nome, @quantidadeMin

WHILE (@@FETCH_STATUS = 0)
BEGIN
	SELECT @nome + ' tem quantidade de ' + CAST(@quantidadeMin AS VARCHAR) AS 'Resultado'
		FETCH NEXT FROM POR_CURSOR
		INTO @nome, @quantidadeMin
END
CLOSE POR_CURSOR
DEALLOCATE POR_CURSOR
GO









