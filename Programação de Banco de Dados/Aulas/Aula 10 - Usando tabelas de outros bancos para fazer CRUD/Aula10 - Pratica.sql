SELECT * FROM tblcliente;


CREATE TABLE provisoria(
	Titulo VARCHAR(80) NOT NULL,
	Tipo CHAR(12) NOT NULL,
	Pre�o MONEY NOT NULL
);

INSERT INTO provisoria(Titulo,Tipo,Pre�o)
SELECT Titulo, Tipo, Pre�o FROM pubs..novaTabela;

SELECT * FROM provisoria;

UPDATE provisoria SET Pre�o = 0 
WHERE pre�o >= 1;

