select * from Categorias;

BEGIN TRAN

INSERT INTO Categorias(Descricao, CadastradoEm) VALUES ('Categoria Nova 1', GETDATE());
INSERT INTO Categorias(Descricao, CadastradoEm) VALUES ('Categoria Nova 2', GETDATE());

SAVE TRANSACTION AtualizacaoPoint

UPDATE Categorias SET Descricao = 'Aplicacação WEB' WHERE Descricao = 'WEB'

ROLLBACK TRAN AtualizacaoPoint
COMMIT