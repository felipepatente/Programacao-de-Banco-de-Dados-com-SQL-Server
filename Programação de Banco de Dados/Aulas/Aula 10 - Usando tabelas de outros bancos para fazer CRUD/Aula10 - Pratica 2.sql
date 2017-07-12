-- Bath
SELECT * FROM authors;
SELECT * FROM publishers;

-- Script
SELECT * FROM authors;
GO
SELECT * FROM publishers
GO


-- VARIAVES GLOBAIS

-- Retorna o número de tentativas de conexão, bem-sucedidas ou não, desde a última inicialização do SQL Server.
SELECT @@CONNECTIONS AS 'Tentativas de Conexão'

--Retorna o tempo que o SQL Server gastou desde que foi iniciado pela última vez. Resultado é em incrementos de tempo de CPU, ou "tiques" e 
--é cumulativo para todas as CPUs, portanto pode exceder o tempo decorrido real. Multiplique por@TIMETICKS para converter em microssegundos.
SELECT @@CPU_BUSY AS 'Tempo Gasto'

--Retorna o número de linhas de qualificação atualmente no último cursor aberto na conexão. Para melhorar o desempenho, 
--o SQL Server pode popular cursores estáticos e conjuntos de chaves grandes assincronamente. @@CURSOR_ROWS pode ser chamado para 
--determinar se o número de linhas que se qualificam para um cursor é recuperado no momento @@CURSOR_ROWS é chamado.
SELECT @@CURSOR_ROWS AS 'Número de Linhas de Qualificação'

--Retorna o valor atual, para uma sessão de SET DATEFIRST.
SELECT @@DATEFIRST

--Retorna o valor do tipo de dados timestamp atual para o banco de dados atual. Este carimbo de data e hora é garantido como exclusivo 
--no banco de dados.
SELECT @@DBTS

--Para obter o ID de ordem de classificação SQL, use SERVERPROPERTY ('SqlSortOrder'). A lista de ordens de classificação para produtos antigos 
--SQL 7.0 ainda está disponível em locais como aqui. Hoje em dia, embora todo mundo chama de "colação do servidor".
SELECT @@DEF_SORTORDER_ID

--Retorna o identificador de idioma local (ID) do idioma que está sendo usado no momento.
SELECT @@DEFAULT_LANGID

--Retorna o número do erro da última instrução Transact-SQL executada.
SELECT @@ERROR

--Retorna o status do último cursor que a instrução FETCH emitiu em relação a qualquer cursor atualmente aberto pela conexão.
SELECT @@FETCH_STATUS

--É uma função de sistema que retorna o último valor de identidade inserido.
SELECT @@IDENTITY

--Retorna o tempo que o SQL Server ficou ocioso desde que foi iniciado pela última vez. O resultado é indicado em incrementos de tempo
--de CPU, ou "tiques", sendo cumulativo para todas as CPUs, portanto pode exceder o tempo decorrido real. Multiplique por@TIMETICKS 
--para converter em microssegundos.
SELECT @@IDLE

--Retorna o tempo que o SQL Server gastou para executar operações de entrada e saída desde que o SQL Server foi iniciado pela última vez. 
--O resultado é indicado em incrementos de tempo de CPU ("tiques"), sendo cumulativo para todas as CPUs, portanto pode exceder o tempo decorrido 
--real. Multiplique por@TIMETICKS para converter em microssegundos.
SELECT @@IO_BUSY

--Retorna o ID (identificador) do idioma local que está sendo usado atualmente.
SELECT @@LANGID


--Retorna a configuração de tempo limite do bloqueio atual em milissegundos para a sessão atual.
SELECT @@LOCK_TIMEOUT

--Retorna o número de máximo de conexões de usuário simultâneas permitidas em uma instância do SQL Server. 
--O número retornado não é necessariamente o número configurado no momento.
SELECT @@MAX_CONNECTIONS

--Retorna o nível de precisão usado por decimal e numéricos tipos de dados como definido atualmente no servidor.
SELECT @@MAX_PRECISION

SELECT @@MICROSOFTVERSION

--Retorna o nível aninhando da execução de procedimento armazenado atual (inicialmente 0) no servidor local.
SELECT @@NESTLEVEL

--Retorna informações sobre as opções SET atuais.
SELECT @@OPTIONS

--Retorna o número de pacotes de entrada lidos na rede pelo SQL Server desde a última vez em que foi iniciado
SELECT @@PACK_RECEIVED

--Retorna o número de pacotes de saída gravados na rede pelo SQL Server desde que foi iniciado pela última vez.
SELECT @@PACK_SENT

--Retorna o número de erros de pacote de rede que ocorreram em conexões SQL Server desde a última vez em que o SQL Server foi iniciado.
SELECT @@PACKET_ERRORS

--Retorna o identificador de objeto (ID) do módulo Transact-SQL atual. Um módulo Transact-SQL pode ser um procedimento armazenado, 
--função definida pelo usuário ou acionador. @@ PROCID não pode ser especificado em módulos CLR ou o provedor de acesso de dados em processo.
SELECT @@PROCID

--Retorna o nome do servidor de banco de dados SQL Server remoto como ele aparece no registro de login.
SELECT @@REMSERVER

--Retorna o número de linhas afetadas pela última instrução. Se o número de linhas for maior que 2 bilhões, use ROWCOUNT_BIG.
SELECT @@ROWCOUNT

--Retorna o nome do servidor local que está executando o SQL Server.
SELECT @@SERVERNAME

--Retorna o nome da chave do Registro na qual o SQL Server está sendo executado. @@SERVICENAME retornará 'MSSQLSERVER' se a instância atual 
--for a instância padrão, a função retornará o nome da instância se a instância atual for uma instância nomeada.
SELECT @@SERVICENAME

--Retorna a ID de sessão do processo de usuário atual.
SELECT @@SPID

--Retorna o valor atual da opção TEXTSIZE.
SELECT @@TEXTSIZE

--Retorna o número de microssegundos por tique.
SELECT @@TIMETICKS

--Retorna o número de erros de gravação de disco encontrados pelo SQL Server desde a última vez que o SQL Server foi iniciado.
SELECT @@TOTAL_ERRORS

--Retorna o número de leituras de disco, não leituras de cache, por SQL Server, desde que o SQL Server foi iniciado pela última vez.
SELECT @@TOTAL_READ

--Retorna o número de gravações em disco do SQL Server desde que o SQL Server foi iniciado pela última vez.
SELECT @@TOTAL_WRITE

--Retorna o número de instruções BEGIN TRANSACTION que ocorreram na conexão atual.
SELECT @@TRANCOUNT

--Retorna informações de compilação e sistema para a instalação atual do SQL Server.
SELECT @@VERSION

SELECT MAX(price) FROM titles;


--USANDO VARIAVEIS DE ESCOPO COM E CONDIÇÃO IF
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

--USANDO VARIAVEIS DE ESCOPO COM E CONDIÇÃO IF
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


--CONDIÇÃO ENQUANTO
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
SELECT t.title AS 'Titulo', t.type AS 'Tipo', t.price AS 'Preço'
INTO novaTabela
FROM titles AS t

SELECT * 
FROM novaTabela;

DELETE FROM novaTabela WHERE Preço  IS NULL;


--ATUALIZANDO VALORES QUE BATEM COM VALORES DE OUTRAS TABELAS DE OUTROS BANCOS
UPDATE n SET Titulo = 'Valor Alterado'
FROM novaTabela AS n
INNER JOIN cadastro..provisoria AS c
ON n.Tipo = c.Tipo;

--APAGANDO VALORES QUE BATEM COM VALORES DE OUTRAS TABELAS DE OUTROS BANCOS
DELETE FROM n
FROM novaTabela AS n
INNER JOIN cadastro..provisoria AS c
ON n.Preço = c.Preço;















