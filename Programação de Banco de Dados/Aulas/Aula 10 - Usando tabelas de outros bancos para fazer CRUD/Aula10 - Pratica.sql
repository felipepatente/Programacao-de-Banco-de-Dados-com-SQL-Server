SELECT * FROM tblcliente;


CREATE TABLE provisoria(
	Titulo VARCHAR(80) NOT NULL,
	Tipo CHAR(12) NOT NULL,
	Preço MONEY NOT NULL
);

INSERT INTO provisoria(Titulo,Tipo,Preço)
SELECT Titulo, Tipo, Preço FROM pubs..novaTabela;

SELECT * FROM provisoria;

UPDATE provisoria SET Preço = 0 
WHERE preço >= 1;

