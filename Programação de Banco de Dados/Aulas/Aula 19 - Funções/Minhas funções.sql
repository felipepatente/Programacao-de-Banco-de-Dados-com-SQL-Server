--CRIANDO UMA FUN��O
GO
CREATE FUNCTION maiorQueValor(@valor int)
RETURNS TABLE
AS
RETURN (SELECT * 
		FROM SOMA
		WHERE SOMA >= @valor)
GO
--INVOCANDO UMA FUN��O
SELECT * FROM maiorQueValor(98);

--CRIANDO UMA FUN��O PARA CALCULO DO FATORIAL
GO
CREATE FUNCTION getFatorial(@valor int)
	RETURNS INT
		BEGIN
			DECLARE @f INT = 1;
			DECLARE @cont INT = 1;

			WHILE @cont <= @valor
				BEGIN
					SET @f = @f * @cont;
					SET @cont = @cont + 1;
				END
			RETURN @f
		END
GO

--INVOCANDO UMA FUN��O
SELECT dbo.getFatorial(5)










