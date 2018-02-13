CREATE TABLE Fornecedor(
	IdFornecedor INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(60),
	CNPJ VARCHAR(20)
);


CREATE TABLE Produto(
	IdProduto INT PRIMARY KEY IDENTITY(1,1),
	IdFornecedor INT NOT NULL,
	PrecoDeCusto DECIMAL(5,2),
	PrecoDeVenda DECIMAL(5,2),
	Estoque INT 

	CONSTRAINT fkProduto_Fornecedor FOREIGN KEY (IdFornecedor) REFERENCES Fornecedor (IdFornecedor) 
);


INSERT INTO Fornecedor (Nome,CNPJ) VALUES ('Fornecedor1','2514.3622.3625')
INSERT INTO Fornecedor (Nome,CNPJ) VALUES ('Fornecedor2','4859.8495.2565')
INSERT INTO Fornecedor (Nome,CNPJ) VALUES ('Fornecedor3','1548.6329.1524')
INSERT INTO Fornecedor (Nome,CNPJ) VALUES ('Fornecedor4','5142.3624.6224')

SELECT * FROM Fornecedor;

INSERT INTO Produto(IdFornecedor,PrecoDeCusto,PrecoDeVenda,Estoque)
VALUES(1,2.5,4.5,5);

INSERT INTO Produto(IdFornecedor,PrecoDeCusto,PrecoDeVenda,Estoque)
VALUES(1,4.5,8,10);

INSERT INTO Produto(IdFornecedor,PrecoDeCusto,PrecoDeVenda,Estoque)
VALUES(2,10,20,15);

INSERT INTO Produto(IdFornecedor,PrecoDeCusto,PrecoDeVenda,Estoque)
VALUES(3,3,3,14);

INSERT INTO Produto(IdFornecedor,PrecoDeCusto,PrecoDeVenda,Estoque)
VALUES(2,15,30,12);

SELECT * FROM Produto;


SELECT f.Nome, p.PrecoDeCusto, p.PrecoDeVenda, p.Estoque
FROM Fornecedor AS f
INNER JOIN Produto AS p
ON f.IdFornecedor = p.IdFornecedor


SELECT f.Nome, p.PrecoDeCusto, p.PrecoDeVenda, p.Estoque
FROM Fornecedor AS f
LEFT JOIN Produto AS p
ON f.IdFornecedor = p.IdFornecedor


SELECT f.Nome, p.PrecoDeCusto, p.PrecoDeVenda, p.Estoque
FROM Fornecedor AS f
RIGHT JOIN Produto AS p
ON f.IdFornecedor = p.IdFornecedor


GO
CREATE TRIGGER tr_ProtegerDataSaque ON Expedicao
FOR INSERT, UPDATE
AS
	IF (SELECT DATEDIFF(DAY,'00010101',DtSaque) FROM inserted) > DATEDIFF(DAY,'00010101',GETDATE())
	BEGIN
		RAISERROR('Data invalida',10,1,5)
		ROLLBACK
	END 



GO
ALTER TRIGGER tr_ProtegerValores ON Produto
FOR INSERT, UPDATE
AS
	IF (SELECT i.PrecoDeVenda FROM inserted AS i) <=  (SELECT  i.PrecoDeCusto FROM inserted AS i) 
	BEGIN
		RAISERROR('Valores errados',10,1,5)
		ROLLBACK
	END 


INSERT INTO Produto(IdFornecedor,PrecoDeCusto,PrecoDeVenda,Estoque)
VALUES(3,8,20,14);

SELECT * FROM Produto


GO
CREATE PROCEDURE pr_InserirProduto
(@idFornecedor INT, @PrecoDeCusto DECIMAL(5,2), @PrecoDeVenda DECIMAL(5,2), @estoque INT)
AS

INSERT INTO Produto(IdFornecedor,PrecoDeCusto,PrecoDeVenda,Estoque)
VALUES(@idFornecedor,@PrecoDeCusto,@PrecoDeVenda,@estoque * 2);



EXEC pr_InserirProduto  1,5.2,50,10;

GO
CREATE VIEW produtoFornecedor
AS
SELECT f.Nome, p.PrecoDeCusto, p.PrecoDeVenda, p.Estoque
FROM Fornecedor AS f
INNER JOIN Produto AS p
ON f.IdFornecedor = p.IdFornecedor
GO

SELECT *
FROM produtoFornecedor







