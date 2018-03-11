GO
DECLARE @AUX VARCHAR(50)
SELECT SOMA, (SELECT
					CASE 
						WHEN SOMA % 2 = 0 THEN						
							'PAR'							
						ELSE
							'IMPAR'						
					END
				FROM SOMA
				WHERE VALOR1 = 2								
			) AS SITUACAO				
FROM SOMA
WHERE VALOR1 = 2
GO

CREATE TABLE TEMP(
	CONT INT
);

GO
DECLARE @INDEX INT = 1

WHILE @INDEX <= 50
	BEGIN
		INSERT INTO TEMP (CONT) VALUES (@INDEX)
		SET @INDEX = @INDEX + 1;
	END

GO

CREATE TABLE MULTIPLICACAO2(
	VALOR INT,
	MULTIPLICACAO INT
);

CREATE TABLE MULTIPLICACAO3(
	VALOR INT,
	MULTIPLICACAO INT
);

------------------------------------------------------------

GO
DECLARE @VALOR1 INT,
		@RESULTADO INT;


DECLARE cur_VALORES_RETORNADOS CURSOR
FOR 
	SELECT VALOR1
	FROM SOMA

OPEN cur_VALORES_RETORNADOS

FETCH NEXT FROM cur_VALORES_RETORNADOS
INTO @VALOR1

WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH NEXT FROM cur_VALORES_RETORNADOS
	INTO @VALOR1

	IF @VALOR1 % 2 = 0
		BEGIN
			SET @RESULTADO = @VALOR1 * 2;
			INSERT INTO MULTIPLICACAO2(VALOR,MULTIPLICACAO) VALUES (@VALOR1,@RESULTADO);
		END
	ELSE
	BEGIN
		SET @RESULTADO = @VALOR1 * 3;
		INSERT INTO MULTIPLICACAO3(VALOR,MULTIPLICACAO) VALUES (@VALOR1,@RESULTADO);
	END

END

CLOSE cur_VALORES_RETORNADOS
DEALLOCATE cur_VALORES_RETORNADOS

GO


SELECT * FROM MULTIPLICACAO3;
DELETE FROM MULTIPLICACAO3



--Faça um algoritmo que leia a idade de uma pessoa expressa em anos, meses e dias e mostre-a expressa apenas em dias.
GO
DECLARE @ANOS INT = 24;
DECLARE @MESES INT = 3;
DECLARE @DIAS INT = 58;

DECLARE @IDADE_DIAS FLOAT = (@ANOS * 360) + (@MESES * 30) + @DIAS;

SELECT @IDADE_DIAS AS 'TOTAL DE DIAS'
GO

--Faça um algoritmo que leia a idade de uma pessoa expressa em dias e mostre-a expressa em anos, meses e dias.
GO
DECLARE @DIAS INT = 8788;
DECLARE @ANOS INT = @DIAS / 360;
DECLARE @MESES INT = (@DIAS % 360) / 30;
DECLARE @DIA INT = ((@DIAS % 360) % 30);

SELECT @ANOS AS 'ANOS', @MESES AS 'MESES', @DIA AS 'DIAS'
GO

--Escreva um algoritmo que leia três números inteiros e positivos (A, B, C) e calcule a seguinte expressão:
--D = R + S
--_________, ONDE R = (A + B)² E S = (B + C)²
--    2
GO
DECLARE @A INT = 2,
		@B INT = 1,
		@C INT = 3;

DECLARE @R INT = SQUARE(@A + @B);
DECLARE @S INT = SQUARE(@B + @C);
DECLARE @D INT = (@R + @S) / 2;

SELECT @D
GO

--Elaborar um algoritmo que lê 3 valores a,b,c. A seguir, encontre o maior dos 3 valores e o escreva com a mensagem : "É o maior ".
GO
DECLARE @A INT = 10;
DECLARE @B INT = 35;
DECLARE @C INT = 25;

IF @A > @B AND @A > @C
	BEGIN
		SELECT 'É o maior: ' + CAST(@A AS VARCHAR(50))
	END
ELSE
	IF @B > @C
		BEGIN
			SELECT 'É o maior: ' + CAST(@B AS VARCHAR(50))
		END
ELSE
	BEGIN
		SELECT 'É o maior: ' + CAST(@C AS VARCHAR(50))
	END
GO

--Elaborar um algoritmo que lê 2 valores a e b e os escreve com a mensagem: "São múltiplos" ou "Não são múltiplos".
GO
DECLARE @A INT = 31;
DECLARE @B INT = 15;

IF (@A % @B) = 0
	BEGIN
		SELECT 'SÃO MULTIPLOS'
	END
ELSE
	BEGIN
		SELECT 'NÃO SÃO MULTIPLOS'
	END
GO


--Elabore um algoritmo que dada a idade de um nadador classifica-o em uma das seguintes categorias: 
--infantil A = 5 - 7 anos
--infantil B = 8-10 anos
--juvenil A = 11-13 anos
--juvenil B = 14-17 anos
--adulto = maiores de 18 anos

DECLARE @IDADE INT = 25;

IF @IDADE >= 5 AND @IDADE <= 7
	BEGIN
		SELECT 'INFANTIL A'
	END
ELSE IF @IDADE >= 8 AND @IDADE <= 10
	BEGIN
		SELECT 'INFANTIL B'
	END
ELSE IF @IDADE >= 11 AND @IDADE <= 13
	BEGIN
		SELECT 'JUVENIL A'
	END
ELSE IF @IDADE >= 14 AND @IDADE <= 17
	BEGIN
		SELECT 'JUVENIL B'
	END
ELSE
	SELECT 'ADULTO'
GO













