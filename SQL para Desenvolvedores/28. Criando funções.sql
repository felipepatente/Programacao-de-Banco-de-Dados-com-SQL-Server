CREATE FUNCTION Mascarar(@data VARCHAR(255), @quantidadeCaracteres int)
RETURNS VARCHAR(255)
AS
BEGIN 
	RETURN LEFT(@data, @quantidadeCaracteres) + '**** ****'
END

GO

CREATE FUNCTION ContarRegistros()
RETURNS INT
AS
BEGIN 
	RETURN (SELECT COUNT(*) FROM Categorias)
END

GO


CREATE FUNCTION GetCategoriaById(@id int)
RETURNS TABLE
AS
	RETURN (SELECT * FROM Categorias WHERE Id = @id)

GO


select dbo.Mascarar('RAFAEL ALMEIDA', 4)
select dbo.Mascarar(descricao, 4) from Categorias (nolock)
SELECT dbo.ContarRegistros()
SELECT * FROM dbo.GetCategoriaById(1)