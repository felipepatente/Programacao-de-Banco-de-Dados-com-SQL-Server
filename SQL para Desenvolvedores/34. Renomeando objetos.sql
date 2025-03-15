ALTER TABLE Categorias ADD Teste VARCHAR(100)
SELECT * FROM Categorias (NOLOCK)

EXEC sp_rename 'dbo.categorias.teste', 'Observacao', 'COLUMN'

EXEC sp_rename 'dbo.TabelaTeste', 'TabelaAlterada'