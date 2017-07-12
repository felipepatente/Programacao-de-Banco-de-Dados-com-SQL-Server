-- Crie uma view com dados dos pokemons
--SELECT * FROM Categoria
SELECT * FROM Fraqueza;
SELECT * FROM Habilidade;
SELECT * FROM HabilidadePokemon;
SELECT * FROM Pokemon;
SELECT * FROM Sexo;
SELECT * FROM Tipo;
SELECT * FROM TipoPokemon;

GO
CREATE VIEW vw_dadosPokemon
AS

SELECT p.codPokemon, p.nome, s.tipoSexo, c.nmCategoria, p2.nome AS 'Evolui de', h.nmHabilidade, t.nmTipo AS 'Tipo', tf.nmTipo AS 'Fraqueza'
FROM Pokemon AS p
INNER JOIN sexo AS s ON p.sexo = s.sexo
INNER JOIN Categoria AS c ON p.codCategoria = c.codCategoria
LEFT JOIN HabilidadePokemon hp ON p.codPokemon = hp.codHabilidade
LEFT JOIN Habilidade AS h ON hp.codHabilidade = h.codHabilidade
LEFT JOIN TipoPokemon tp ON p.codPokemon = tp.codPokemon
LEFT JOIN Tipo AS t ON tp.codTipo = t.codTipo
LEFT JOIN Fraqueza f ON p.codPokemon = f.codPokemon
LEFT JOIN tipo AS tf ON f.CodTipo = tf.codTipo
LEFT JOIN Pokemon AS p2 ON p.evoluiDe = p2.codPokemon

SELECT * FROM vw_dadosPokemon;

-- Uma proc que recebe um código de um tipo, e retorna os bichos deste tipo
GO
CREATE PROCEDURE pr_tipoPokemon
(@codTipo INT)
AS
SELECT nome
FROM Pokemon AS p INNER JOIN TipoPokemon AS tp
ON p.codPokemon = tp.codPokemon
WHERE codTipo = @codTipo

EXEC pr_tipoPokemon 212

-- Uma proc que retorna 2 resultSets de um IdPokemon:
--1 Todas habilidades quie ele tem
-- 2 todas habilidades que ele nao tem
GO
CREATE PROCEDURE pr_HabilidadesPokemon
(@codPokemon INT)
AS
SELECT h.codHabilidade, h.nmHabilidade
FROM Habilidade AS h INNER JOIN HabilidadePokemon AS hp
ON h.codHabilidade = hp.codHabilidade
WHERE hp.codPokemon = @codPokemon

SELECT h.codHabilidade, h.nmHabilidade
FROM Habilidade AS h
WHERE codHabilidade NOT IN (SELECT codHabilidade
							FROM HabilidadePokemon
							WHERE codPokemon = @codPokemon)

EXEC pr_HabilidadesPokemon 17


