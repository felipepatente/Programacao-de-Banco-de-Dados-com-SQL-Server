SELECT Descricao FROM Cursos (NOLOCK) WHERE Id = 1
UNION
SELECT Descricao FROM Categorias (NOLOCK) WHERE Id = 2
UNION
SELECT 'Valor dinamico'
UNION
SELECT 'Valor dinamico'