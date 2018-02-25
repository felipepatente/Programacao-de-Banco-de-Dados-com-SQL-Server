CREATE TABLE CONDICOES(
	VARCHARA VARCHAR(50),
	VARCHARB VARCHAR(50),
	INT1 INT,
	INT2 INT
);

-------------------------------------------------------------------------------------------------------

CREATE TRIGGER tr_INSERIRPAR ON CONDICOES
FOR INSERT, UPDATE 
AS
BEGIN
	DECLARE @NUM INT
	DECLARE @INT1 INT

	SELECT  @NUM = INT1
	FROM inserted

	IF (@NUM > 5) 
	BEGIN
		SET @NUM = @NUM * 2
		INSERT INTO CONDICOES (INT1, INT2) VALUES (@INT1, @NUM)
	END
END

-------------------------------------------------------------------------------------------------------

GO
ALTER TRIGGER tr_INSERIRPAR ON CONDICOES
INSTEAD OF INSERT, UPDATE 
AS
BEGIN
	DECLARE @NUM INT
	DECLARE @INT1 INT

	SELECT  @NUM = INT1
	FROM inserted

	IF (@NUM > 5) 
		BEGIN
			SET @NUM = @NUM * 2			
		END
	ELSE IF (@NUM >= 0 AND @NUM < 5)
		BEGIN
			SET @NUM = @NUM * 3
		END
	ELSE
		BEGIN
			SET @NUM = 1000
		END

	INSERT INTO CONDICOES (INT1, INT2) VALUES (@INT1, @NUM)

END
GO

-------------------------------------------------------------------------------------------------------

GO
CREATE TRIGGER tr_INSERIR_DIA_SEMANA ON CONDICOES
FOR INSERT, UPDATE
AS
BEGIN

	DECLARE @DIA VARCHAR(50)
	DECLARE @DIAINT INT
	
	SELECT @DIA = 
	CASE INT1  
		WHEN 1 THEN 'DOMINGO'
		WHEN 2 THEN 'SEGUNDA'
		WHEN 3 THEN 'TERCA'
		WHEN 4 THEN 'QUARTA'
		WHEN 5 THEN 'QUINTA'
		WHEN 6 THEN 'SEXTA'
		WHEN 7 THEN 'SABADO'
		ELSE 'NÃO EXISTE ESTE DIA'
	END
	FROM inserted

	INSERT INTO CONDICOES (VARCHARA) VALUES (@DIA)
	
END
GO

-------------------------------------------------------------------------------------------------------

GO
CREATE TRIGGER tr_INSERIR_VALORES ON CONDICOES
FOR INSERT, UPDATE
AS
BEGIN

	DECLARE @DIA VARCHAR(50)
	DECLARE @DIAINT INT
	
	SELECT @DIAINT = 
	CASE INT1  
		WHEN 1 THEN 2 * INT1
		WHEN 2 THEN 3 * INT1
		WHEN 3 THEN 4 * INT1
		WHEN 4 THEN 5 * INT1
		WHEN 5 THEN 6 * INT1
		WHEN 6 THEN 7 * INT1
		WHEN 7 THEN 8 * INT1
		ELSE 0
	END
	FROM inserted

	INSERT INTO CONDICOES (VARCHARA) VALUES (@DIAINT)
	
END
GO

-------------------------------------------------------------------------------------------------------

INSERT INTO CONDICOES(INT1) VALUES(20)
SELECT * FROM CONDICOES

-------------------------------------------------------------------------------------------------------

GO
ALTER PROCEDURE pr_INSERIR_VALORES
(@VARCHARA VARCHAR(50), @VARCHARB VARCHAR(50), @INT1 INT, @INT2 INT)
AS
BEGIN
	DECLARE @CONT INT = 1

	WHILE @CONT < @INT2
		BEGIN
			
			IF @INT1 IS NOT NULL
			BEGIN 
				INSERT INTO CONDICOES(VARCHARA, VARCHARB, INT1, INT2) VALUES (@VARCHARA, @VARCHARB, @CONT, @INT2)
				SET @CONT = @CONT + 1
				PRINT @CONT
			END

		END
END

-------------------------------------------------------------------------------------------------------

EXEC pr_INSERIR_VALORES @VARCHARA = 'FELIPE', @VARCHARB = 'PATENTE', @INT1 = 0, @INT2 = 50
SELECT * FROM CONDICOES

-------------------------------------------------------------------------------------------------------

--Variaveis do cursor
DECLARE @VARCHAR1 VARCHAR(50),
		@VARCHAR2 VARCHAR(50),
		@INT3 INT,
		@INT5 INT;

--Criando (declarando) um cursor
DECLARE cur_CursorVariaveis CURSOR
FOR SELECT VARCHARA, VARCHARB, INT1, INT2 FROM CONDICOES

--Abrindo o cursor
OPEN cur_CursorVariaveis

--Selecionar os dados
FETCH NEXT FROM cur_CursorVariaveis
INTO @VARCHAR1, @VARCHAR2, @INT3, @INT5

--Iteração entre os dados retornados pelo cursor
WHILE @@FETCH_STATUS = 0
BEGIN
	
	--Pegar os proximos dados
	FETCH NEXT FROM cur_CursorVariaveis
	INTO @VARCHAR1, @VARCHAR2, @INT3, @INT5

	SELECT @VARCHAR1, @VARCHAR2, @INT3, @INT5

END

--Fechando e deslocando o cursor da memória
CLOSE cur_CursorVariaveis
DEALLOCATE cur_CursorVariaveis

-------------------------------------------------------------------------------------------------------

CREATE TABLE SOMA(
	VALOR1 INT,
	VALOR2 INT,
	SOMA INT
);

-------------------------------------------------------------------------------------------------------

GO
CREATE PROCEDURE pr_SOMAR
(@VALOR1 INT, @VALOR2 INT)
AS
BEGIN
	DECLARE @SOMA INT = @VALOR1 + @VALOR2;
	INSERT INTO SOMA(VALOR1, VALOR2, SOMA) VALUES (@VALOR1, @VALOR2, @SOMA);
END
GO

-------------------------------------------------------------------------------------------------------

DECLARE @VALOR1 INT,
		@VALOR2 INT

DECLARE cur_Valores CURSOR
FOR SELECT INT1, INT2 FROM CONDICOES

OPEN cur_Valores

FETCH NEXT FROM cur_Valores
INTO  @VALOR1, @VALOR2

WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH NEXT FROM cur_Valores
	INTO @VALOR1, @VALOR2

	EXEC pr_SOMAR @VALOR1 = @VALOR1, @VALOR2 = @VALOR2;

END

CLOSE cur_Valores
DEALLOCATE cur_Valores

-------------------------------------------------------------------------------------------------------

SELECT * FROM SOMA






































