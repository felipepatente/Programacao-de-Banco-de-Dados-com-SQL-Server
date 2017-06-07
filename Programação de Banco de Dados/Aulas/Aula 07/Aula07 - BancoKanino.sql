-- Banco Kanino
SELECT nomeProduto, precProduto - ISNULL (descontoPromocao, 0) AS 'Preço de Venda', nomeCategoria
FROM Produto AS p
INNER JOIN Categoria AS c
ON p.idCategoria = c.idCategoria
WHERE nomeCategoria NOT LIKE '%A%' OR nomeCategoria  LIKE '% %';