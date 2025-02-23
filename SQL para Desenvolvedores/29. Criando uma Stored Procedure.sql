CREATE PROCEDURE PesquisarCategoriaPorId(@id int)
AS
BEGIN
	SELECT * FROM Categorias WHERE Id = @id
END
GO

CREATE PROC PersistirDadosEmCategorias(@Descricao varchar(255))
AS
BEGIN

	IF(@Descricao IS NULL) 
	BEGIN
		RAISERROR('Descrição não é valida', 16, 1)
		RETURN
	END

	INSERT INTO Categorias (Descricao, CadastradoEm) VALUES (@Descricao, GETDATE())
END
GO

EXEC dbo.PesquisarCategoriaPorId @id = 1
EXEC dbo.PersistirDadosEmCategorias @Descricao = 'Procedure'
EXEC dbo.PersistirDadosEmCategorias @Descricao = NULL

select * from Categorias (nolock)