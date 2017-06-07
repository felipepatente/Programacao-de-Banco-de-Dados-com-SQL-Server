CREATE TABLE cliente(
	nome VARCHAR(50),
	sobrenome VARCHAR(50)
);


-- Inserindo junto com um select
INSERT INTO cliente (nome, sobrenome)
SELECT nome, sobrenome
FROM Banco2..cliente;

SELECT * FROM cliente;


-- Criando uma tabela na hora do select
SELECT nome, sobrenome
INTO notaTabela
FROM Banco2..cliente
WHERE sobrenome IS NULL;

SELECT * FROM notaTabela;


SELECT nome, sobrenome
INTO notaTabela2
FROM Banco2..cliente
WHERE sobrenome IS NOT NULL;

SELECT * FROM notaTabela2;

-- Atualizando os valores conforme os valores de uma tabela em outro banco
UPDATE cliente SET sobrenome = 'Alterado'
FROM cliente as c1 INNER JOIN Banco2..cliente AS c2
ON c1.nome = c2.nome;

SELECT * FROM cliente;

-- Deletando conforme os valores de outra tabela em outro banco
DELETE FROM cliente
FROM cliente AS c1 INNER JOIN Banco2..cliente AS c2
ON c1.nome = c2.nome;

CREATE TABLE conta(
	valor DECIMAL(5)
);

INSERT INTO conta (valor) 
VALUES (25),
	   (29),
	   (30),
	   (80);

SELECT * FROM conta;


-- Condição de decisão if-else
GO
DECLARE @media DECIMAL
SELECT @media = AVG(valor) 
FROM conta;

IF(@media > 42)
BEGIN
	SELECT 'Parte 1 do select'
END

ELSE
BEGIN
	SELECT 'Parte 2 do select'
END
GO

GO
DECLARE @soma DECIMAL
SELECT @soma = SUM(valor)
FROM conta;

IF(@soma > 200)
BEGIN
	SELECT 'Maior que 200'
	SELECT @soma
END

ELSE
BEGIN
	SELECT 'Menor que 200'
	SELECT @soma
END

-- Exemplos de loops whiles
GO
DECLARE @soma DECIMAL
SELECT @soma = SUM(valor)
FROM conta

WHILE(@soma >= 0)
BEGIN
	PRINT @soma
	SET @soma = @soma - 1
END


GO
WHILE((SELECT SUM(valor) FROM conta) < 800)
BEGIN
	UPDATE conta SET valor = valor + 1;
    SELECT SUM(valor) FROM conta;
END

CREATE table carro(
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50)
);

-- Pegando o ultimo id gerado
INSERT INTO carro (nome)
VALUES ('Punto'),
	   ('Hr-v'),
	   ('Honda Civic');

DECLARE @id INT
SELECT @id = SCOPE_IDENTITY()
SELECT @id;

SELECT * FROM cliente;

INSERT INTO cliente (nome, sobrenome)
VALUES ('Felipe','Patente'),
	   ('Lucas', 'Patente'),
	   ('Thiago','Ribeiro'),
	   ('Roberto', null);


-- Criando uma procedure sem parametros
GO
CREATE PROCEDURE pr_SelecionarCliente
AS
SELECT nome, sobrenome
FROM cliente


EXECUTE pr_SelecionarCliente;


-- Criando uma procedure com parametros
GO
CREATE PROCEDURE pr_SelecinarCliente2
(@nome VARCHAR(50) = NULL)
AS

SELECT nome, sobrenome
FROM cliente
WHERE nome = @nome OR @nome IS NULL


EXECUTE pr_SelecinarCliente2;

GO
ALTER PROCEDURE pr_SelecinarCliente2
(@nome VARCHAR(50) = NULL)
AS

SELECT nome, sobrenome
FROM cliente
WHERE nome = @nome OR sobrenome IS NOT NULL

EXECUTE pr_SelecinarCliente2;

-- Criando uma procedure com encriptação
GO
CREATE PROCEDURE pr_SelecionarCliente3
(@nome VARCHAR(50))
WITH ENCRYPTION
AS
SELECT nome, sobrenome
FROM cliente
WHERE nome = @nome;


EXECUTE pr_SelecionarCliente3 'Felipe';


CREATE TABLE livro(
	tipo VARCHAR(50),
	preco DECIMAL(5)
);

INSERT INTO livro (tipo, preco)
VALUES ('Negocios',25),
	   ('Negocios',40),
	   ('Negocios',35), 
	   ('Negocios',55),
	   ('Didatico',40),
	   ('Didatico',50),
	   ('Didatico',60),
	   ('Didatico',25),
	   ('Literatura',25),
	   ('Literatura',40),
	   ('Literatura',80),
	   ('Literatura',56),
	   ('Literatura',48);

SELECT * FROM livro;

-- Criando uma procedure com output
GO
CREATE PROCEDURE pr_GetMediaTipo
@tipo VARCHAR(50),
@media DECIMAL OUTPUT
AS
SELECT @media = AVG(preco)
FROM livro
WHERE tipo = @tipo
GO

DECLARE @media MONEY
EXECUTE pr_GetMediaTipo 'Literatura', @media OUTPUT;
SELECT @media;

--Criando uma trigger para disparar na inserção e atualização
GO
CREATE TRIGGER tr_ValidarPreco ON livro
FOR INSERT, UPDATE
AS
IF(SELECT preco FROM inserted) < 0
BEGIN
	RAISERROR('Preço invalido',10,1,5)
	ROLLBACK
END


GO
ALTER TRIGGER tr_ValidarPreco ON livro
FOR INSERT, UPDATE
AS
IF(SELECT i.preco FROM inserted AS i) <= 0
BEGIN
	RAISERROR('Preço invalido',10,1,5)
	ROLLBACK
END


INSERT INTO livro (tipo, preco)
values ('Literatura', -12),
	   ('Literatura', 10),
	   ('Literatura', -52),
	   ('Literatura', -66),
	   ('Literatura', -74);

CREATE TABLE produto(
	id INT PRIMARY KEY IDENTITY(1,1),
	quantMin INT
);

CREATE TABLE estoque(
	id INT PRIMARY KEY IDENTITY(1,1),
	idProduto INT NOT NULL,
	quantidadeEstoque INT,

	CONSTRAINT fk_estoque FOREIGN KEY (idProduto) REFERENCES produto (id)
);

GO
CREATE TRIGGER tr_InserirQuantidadeEstoque ON produto
FOR INSERT
AS
INSERT INTO estoque (idProduto,quantidadeEstoque)
SELECT id, quantMin * 2
FROM inserted



INSERT INTO produto(quantMin) 
VALUES (40),
	   (80),
	   (30);

SELECT * FROM estoque;

SELECT p.quantMin, e.quantidadeEstoque
FROM produto AS p INNER JOIN estoque AS e
ON p.id = e.idProduto

CREATE TABLE produto(
	id INT PRIMARY KEY IDENTITY(1,1),
	quantMin INT
);

-- Criando um cursor que percorre uma tabela
DECLARE @id INT, @quantidade INT

DECLARE pir_cursor CURSOR
FOR SELECT id, quantMin
	FROM produto

OPEN pir_cursor

FETCH NEXT FROM pir_cursor
INTO @id, @quantidade

WHILE(@@FETCH_STATUS = 0)
BEGIN
	SELECT @id, @quantidade

	FETCH NEXT FROM pir_cursor
	INTO @id, @quantidade
END

CLOSE pir_cursor
DEALLOCATE pir_cursor


-- Criando um loop que percorre uma tabela
GO
DECLARE @id INT, @quantidade INT, @quant INT, @count INT
SET @count = 1

SELECT @quant = COUNT(*) FROM produto;

WHILE(@count <= @quant)
BEGIN
	SELECT @id = id, @quantidade = quantMin
	FROM produto
	WHERE id = @count
	
	PRINT CAST(@id AS VARCHAR) + ' - ' + CAST(@quantidade AS VARCHAR)

	SET @count = @count + 1
END


















