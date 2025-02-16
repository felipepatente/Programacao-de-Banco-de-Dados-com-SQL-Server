select * from Categorias;

BEGIN TRAN

UPDATE Categorias SET Descricao = UPPER(Descricao) WHERE Id > 0
DELETE Categorias WHERE Id = 4

--ROLLBACK
COMMIT