SELECT cr.Descricao Curso, ca.Descricao Categoria
FROM		Cursos		(NOLOCK) cr
INNER JOIN	Categorias  (NOLOCK) ca ON cr.CategoriaId = ca.Id