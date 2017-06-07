-- Bath
SELECT * FROM authors;
SELECT * FROM publishers;

-- Script
SELECT * FROM authors;
GO
SELECT * FROM publishers
GO


-- VARIAVES GLOBAIS

-- Retorna o n�mero de tentativas de conex�o, bem-sucedidas ou n�o, desde a �ltima inicializa��o do SQL Server.
SELECT @@CONNECTIONS AS 'Tentativas de Conex�o'

--Retorna o tempo que o SQL Server gastou desde que foi iniciado pela �ltima vez. Resultado � em incrementos de tempo de CPU, ou "tiques" e 
--� cumulativo para todas as CPUs, portanto pode exceder o tempo decorrido real. Multiplique por@TIMETICKS para converter em microssegundos.
SELECT @@CPU_BUSY AS 'Tempo Gasto'

--Retorna o n�mero de linhas de qualifica��o atualmente no �ltimo cursor aberto na conex�o. Para melhorar o desempenho, 
--o SQL Server pode popular cursores est�ticos e conjuntos de chaves grandes assincronamente. @@CURSOR_ROWS pode ser chamado para 
--determinar se o n�mero de linhas que se qualificam para um cursor � recuperado no momento @@CURSOR_ROWS � chamado.
SELECT @@CURSOR_ROWS AS 'N�mero de Linhas de Qualifica��o'

--Retorna o valor atual, para uma sess�o de SET DATEFIRST.
SELECT @@DATEFIRST

--Retorna o valor do tipo de dados timestamp atual para o banco de dados atual. Este carimbo de data e hora � garantido como exclusivo 
--no banco de dados.
SELECT @@DBTS

--Para obter o ID de ordem de classifica��o SQL, use SERVERPROPERTY ('SqlSortOrder'). A lista de ordens de classifica��o para produtos antigos 
--SQL 7.0 ainda est� dispon�vel em locais como aqui. Hoje em dia, embora todo mundo chama de "cola��o do servidor".
SELECT @@DEF_SORTORDER_ID

--Retorna o identificador de idioma local (ID) do idioma que est� sendo usado no momento.
SELECT @@DEFAULT_LANGID

--Retorna o n�mero do erro da �ltima instru��o Transact-SQL executada.
SELECT @@ERROR

--Retorna o status do �ltimo cursor que a instru��o FETCH emitiu em rela��o a qualquer cursor atualmente aberto pela conex�o.
SELECT @@FETCH_STATUS

--� uma fun��o de sistema que retorna o �ltimo valor de identidade inserido.
SELECT @@IDENTITY

--Retorna o tempo que o SQL Server ficou ocioso desde que foi iniciado pela �ltima vez. O resultado � indicado em incrementos de tempo
--de CPU, ou "tiques", sendo cumulativo para todas as CPUs, portanto pode exceder o tempo decorrido real. Multiplique por@TIMETICKS 
--para converter em microssegundos.
SELECT @@IDLE

--Retorna o tempo que o SQL Server gastou para executar opera��es de entrada e sa�da desde que o SQL Server foi iniciado pela �ltima vez. 
--O resultado � indicado em incrementos de tempo de CPU ("tiques"), sendo cumulativo para todas as CPUs, portanto pode exceder o tempo decorrido 
--real. Multiplique por@TIMETICKS para converter em microssegundos.
SELECT @@IO_BUSY

--Retorna o ID (identificador) do idioma local que est� sendo usado atualmente.
SELECT @@LANGID


--Retorna a configura��o de tempo limite do bloqueio atual em milissegundos para a sess�o atual.
SELECT @@LOCK_TIMEOUT

--Retorna o n�mero de m�ximo de conex�es de usu�rio simult�neas permitidas em uma inst�ncia do SQL Server. 
--O n�mero retornado n�o � necessariamente o n�mero configurado no momento.
SELECT @@MAX_CONNECTIONS

--Retorna o n�vel de precis�o usado por decimal e num�ricos tipos de dados como definido atualmente no servidor.
SELECT @@MAX_PRECISION

SELECT @@MICROSOFTVERSION

--Retorna o n�vel aninhando da execu��o de procedimento armazenado atual (inicialmente 0) no servidor local.
SELECT @@NESTLEVEL

--Retorna informa��es sobre as op��es SET atuais.
SELECT @@OPTIONS

--Retorna o n�mero de pacotes de entrada lidos na rede pelo SQL Server desde a �ltima vez em que foi iniciado
SELECT @@PACK_RECEIVED

--Retorna o n�mero de pacotes de sa�da gravados na rede pelo SQL Server desde que foi iniciado pela �ltima vez.
SELECT @@PACK_SENT

--Retorna o n�mero de erros de pacote de rede que ocorreram em conex�es SQL Server desde a �ltima vez em que o SQL Server foi iniciado.
SELECT @@PACKET_ERRORS

--Retorna o identificador de objeto (ID) do m�dulo Transact-SQL atual. Um m�dulo Transact-SQL pode ser um procedimento armazenado, 
--fun��o definida pelo usu�rio ou acionador. @@ PROCID n�o pode ser especificado em m�dulos CLR ou o provedor de acesso de dados em processo.
SELECT @@PROCID

--Retorna o nome do servidor de banco de dados SQL Server remoto como ele aparece no registro de login.
SELECT @@REMSERVER

--Retorna o n�mero de linhas afetadas pela �ltima instru��o. Se o n�mero de linhas for maior que 2 bilh�es, use ROWCOUNT_BIG.
SELECT @@ROWCOUNT

--Retorna o nome do servidor local que est� executando o SQL Server.
SELECT @@SERVERNAME

--Retorna o nome da chave do Registro na qual o SQL Server est� sendo executado. @@SERVICENAME retornar� 'MSSQLSERVER' se a inst�ncia atual 
--for a inst�ncia padr�o, a fun��o retornar� o nome da inst�ncia se a inst�ncia atual for uma inst�ncia nomeada.
SELECT @@SERVICENAME

--Retorna a ID de sess�o do processo de usu�rio atual.
SELECT @@SPID

--Retorna o valor atual da op��o TEXTSIZE.
SELECT @@TEXTSIZE

--Retorna o n�mero de microssegundos por tique.
SELECT @@TIMETICKS

--Retorna o n�mero de erros de grava��o de disco encontrados pelo SQL Server desde a �ltima vez que o SQL Server foi iniciado.
SELECT @@TOTAL_ERRORS

--Retorna o n�mero de leituras de disco, n�o leituras de cache, por SQL Server, desde que o SQL Server foi iniciado pela �ltima vez.
SELECT @@TOTAL_READ

--Retorna o n�mero de grava��es em disco do SQL Server desde que o SQL Server foi iniciado pela �ltima vez.
SELECT @@TOTAL_WRITE

--Retorna o n�mero de instru��es BEGIN TRANSACTION que ocorreram na conex�o atual.
SELECT @@TRANCOUNT

--Retorna informa��es de compila��o e sistema para a instala��o atual do SQL Server.
SELECT @@VERSION

SELECT MAX(price) FROM titles;


--USANDO VARIAVEIS DE ESCOPO COM E CONDI��O IF
DECLARE @valor INT
SELECT @valor =  MAX(price) FROM titles;

IF (@valor > 20)
BEGIN
	SELECT 'Maior que 20'
END
ELSE
BEGIN
	SELECT 'Menor que 20'
END
GO

--USANDO VARIAVEIS DE ESCOPO COM E CONDI��O IF
DECLARE @valor MONEY
SELECT @valor =  SUM(price) FROM titles;

IF(@valor > 200)
BEGIN
	INSERT INTO titles(title_id, title, pub_id,price,pubdate) 
	VALUES (60,'Jogo Maior que 200','0736', @valor,'20020512');
END
ELSE
BEGIN
	INSERT INTO titles(title_id, title, pub_id,price,pubdate) 
	VALUES (60,'Jogo Menor ou Igual que 200','0736', @valor,'20020512');
END
GO

SELECT * FROM titles;
SELECT * FROM publishers;


--CONDI��O ENQUANTO
WHILE((SELECT MAX(price) FROM titles) < 5000)
BEGIN 
	UPDATE titles SET price = price * 1.50
END
GO


WHILE((SELECT MAX(price) FROM titles) > 100)
BEGIN 
	UPDATE titles SET price = price * 0.50
END
GO

--CRIANDO UMA TABELA APARTIR DE VALORES DE OUTRAS TABELAS
SELECT t.title AS 'Titulo', t.type AS 'Tipo', t.price AS 'Pre�o'
INTO novaTabela
FROM titles AS t

SELECT * 
FROM novaTabela;

DELETE FROM novaTabela WHERE Pre�o  IS NULL;


--ATUALIZANDO VALORES QUE BATEM COM VALORES DE OUTRAS TABELAS DE OUTROS BANCOS
UPDATE n SET Titulo = 'Valor Alterado'
FROM novaTabela AS n
INNER JOIN cadastro..provisoria AS c
ON n.Tipo = c.Tipo;

--APAGANDO VALORES QUE BATEM COM VALORES DE OUTRAS TABELAS DE OUTROS BANCOS
DELETE FROM n
FROM novaTabela AS n
INNER JOIN cadastro..provisoria AS c
ON n.Pre�o = c.Pre�o;















