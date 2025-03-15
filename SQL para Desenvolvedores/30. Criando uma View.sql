CREATE OR ALTER VIEW vwCursos 
AS
	SELECT C.Descricao, CA.Descricao Categoria
	FROM		Cursos	   (NOLOCK) C
	INNER JOIN  Categorias (NOLOCK) CA ON C.CategoriaId = CA.Id
GO

SELECT * FROM vwCursos
SELECT * FROM vwCursos WHERE Descricao = 'EF Core'
DROP VIEW vwCursos