SELECT * FROM Categorias (NOLOCK)
SELECT * FROM Cursos (NOLOCK)

SELECT CR.Descricao Curso, CA.Descricao Categoria
FROM		Categorias	(NOLOCK) CA
FULL JOIN	Cursos		(NOLOCK) CR ON CA.Id = CR.CategoriaId