SELECT * FROM Categorias (NOLOCK)
SELECT * FROM Cursos (NOLOCK)

--INSERT INTO Categorias(Descricao) VALUES('Categoria Test');

SELECT CR.Descricao Curso, CA.Descricao Categoria
FROM		Categorias	(NOLOCK) CA
RIGHT JOIN	Cursos		(NOLOCK) CR ON CA.Id = CR.CategoriaId