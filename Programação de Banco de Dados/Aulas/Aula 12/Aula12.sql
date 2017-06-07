CREATE VIEW vw_Stores
AS
SELECT stor_id AS 'ID', stor_name AS 'NOME', stor_address AS 'ENDEREÇO', city AS 'CIDADE', state AS 'ESTADO'
FROM stores
GO

INSERT INTO vw_Stores (ID, NOME, ENDEREÇO, CIDADE, ESTADO)
VALUES ('256','Americanas','Rua Tulipa, 25','São Paulo','SP');

SELECT * FROM vw_Stores;


SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM stores;

GO
CREATE VIEW cidades
AS
SELECT city FROM authors
UNION
SELECT city FROM publishers
UNION
SELECT city FROM stores;
GO

GO
ALTER VIEW cidades
AS
SELECT city FROM authors WHERE city IS NOT NULL
UNION
SELECT city FROM publishers WHERE city IS NOT NULL
UNION
SELECT city FROM stores WHERE city IS NOT NULL;
GO

SELECT * FROM cidades
