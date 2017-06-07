CREATE TABLE cliente(
	nome VARCHAR(50),
	sobrenome VARCHAR(50)
);

-- Inserindo varios valores de uma vez
INSERT INTO cliente (nome,sobrenome)
VALUES ('Felipe','Patnte'),
	   ('Mariana','Andrade'),
	   ('Monica', 'Patente'),
	   ('Lucas','Santos');

INSERT INTO cliente (nome, sobrenome)
VALUES ('Igor',null),
	   ('João',null);

SELECT * FROM cliente;