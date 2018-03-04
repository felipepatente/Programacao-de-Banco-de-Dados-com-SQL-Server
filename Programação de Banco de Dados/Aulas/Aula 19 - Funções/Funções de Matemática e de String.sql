

------------------------------------------------------FUN��ES DE STRING------------------------------------------------------

--Retorna o valor do c�digo ASCII do caractere mais � esquerda de uma express�o de caractere.
SELECT ASCII('A')--Resultado: 65


--Converte um int c�digo ASCII em um caractere.
SELECT CHAR(78)--Resultado: N


--Pesquisa uma express�o para outra e retorna sua posi��o inicial, se for localizada.
DECLARE @document VARCHAR(50) = 'APRENDENDO FUN��ES SQL SERVER';
SELECT CHARINDEX('SQL',@document);--Resultado: 20


--Retorna uma cadeia de caracteres que � o resultado da concatena��o de dois ou mais valores.
DECLARE @variavel VARCHAR(50);
SELECT @variavel = CONCAT('Feliz ','Aniversario ','Filho');
SELECT @variavel


--Concatena um n�mero vari�vel de argumentos com um delimitador especificado no argumento 1�. (CONCAT_WS indica concatenar com separador.)
SELECT DIFFERENCE('green','green');--Resultado: 4


--Retorna um valor formatado com o formato e a cultura opcional especificados no SQL Server 2017. 
--Use a fun��o FORMAT para formata��o com reconhecimento de localidade de valores de data/hora e n�mero como cadeias de caracteres. 
--Para convers�es de tipos de dados gerais, use CAST ou CONVERT.
DECLARE @d DATETIME = '10/01/2011';  
SELECT FORMAT ( @d, 'd', 'en-US' ) AS 'US English Result'  


--Retorna a parte da esquerda de uma cadeia de caracteres com o n�mero de caracteres especificado.
SELECT LEFT('Joao da Silva',6);--Resultado: Joao d


--Retorna o n�mero de caracteres da express�o da cadeia de caracteres especificada, excluindo espa�os em branco � direita.
SELECT LEN('TAMANHO DA PALAVRA');--Resultado: 18


--Retorna uma express�o de caractere depois de converter para min�sculas os dados de caracteres em mai�sculas.
SELECT LOWER('MAIS');--Resultado: mais


--Retorna uma express�o de caractere depois de remover espa�os em branco � esquerda.
SELECT LTRIM(' O QUE')--Resultado:O QUE


--Retorna o caractere Unicode com o c�digo inteiro especificado, como definido pelo padr�o do Unicode.
SELECT NCHAR(25365)

--Retorna a posi��o inicial da primeira ocorr�ncia de um padr�o em uma express�o espec�fica ou zeros, 
--se o padr�o n�o for encontrado, em todos os tipos de dados de caractere e de texto v�lidos.
SELECT PATINDEX('%mais%','mais n�o foi assim');--Resultado: 1


--Retorna uma cadeia de caracteres Unicode com os delimitadores adicionados para tornar a cadeia de caracteres de entrada um 
--identificador delimitado v�lido do SQL Server.
SELECT QUOTENAME('abc[]def');

--Substitui todas as ocorr�ncias de um valor da cadeia de caracteres especificado por outro valor de cadeia de caracteres.
SELECT REPLACE('Mais - suco - por - favor','-','*')--Resultado: Mais * suco * por * favor;


--Repete um valor da cadeia de caracteres um n�mero especificado de vezes.
SELECT REPLICATE(' O que voc� fez','3')--Resultado: O que voc� fez O que voc� fez O que voc� fez


--Retorna a ordem inversa de um valor da cadeia de caracteres.
SELECT REVERSE('roma');--Resultado: amor


--Retorna a parte da direita de uma cadeia de caracteres com o n�mero de caracteres especificado.
SELECT RIGHT('ontem eu fui em casa',6)--Resultado: m casa


--Retorna uma cadeia de caracteres ap�s truncar todos os espa�os � direita.
SELECT RTRIM('Serio   ');--Resultado: Serio


--Retorna um c�digo de quatro caracteres (SOUNDEX) para avaliar a semelhan�a de duas cadeias de caracteres.
SELECT SOUNDEX('amor'), SOUNDEX('roma');--Resultado: A560 R500

--Retorna dados de caractere convertidos de dados num�ricos.
SELECT STR(123.45, 6, 1);--Resultado: 123.5

--A fun��o STUFF insere uma cadeia de caracteres em outra cadeia de caracteres. 
--Ela exclui um comprimento especificado de caracteres da primeira cadeia na posi��o inicial e, em seguida, insere a segunda cadeia 
--na primeira, na posi��o inicial.
SELECT STUFF ('N�o aaa roma', 5 , 3 ,'fui a')--Resultado: N�o fui a roma


--Retorna parte de uma express�o de caractere, bin�ria, de texto ou de imagem no SQL Server.
SELECT SUBSTRING('Ontem fui a uma festa',6,16);--Resultado: fui a uma festa


--Retorna o valor inteiro, como definido pelo padr�o Unicode, para o primeiro caractere da express�o de entrada.
SELECT UNICODE('A');--Resultado: 65


--Retorna uma express�o de caractere com dados de caractere em min�sculas convertidos em mai�sculas.
SELECT UPPER('n�o fui');--N�O FUI



------------------------------------------------------FUN��ES DE MATEMATICA------------------------------------------------------

--Uma fun��o matem�tica que retorna o valor absoluto (positivo) da express�o num�rica especificada.
SELECT ABS(-58)--Resultado: 58

--Retorna o valor constante de PI.
SELECT PI()--Resultado: 3,14159265358979


--Retorna o �ngulo correspondente em graus para um �ngulo especificado em radiano.
SELECT DEGREES((PI()/2))--Resultado: 90


--RAND(): Retorna um valor float pseudoaleat�rio de 0 a 1, exclusivo.
SELECT FORMAT(RAND() * 100,'###')


--Uma fun��o matem�tica que retorna o �ngulo, em radiano, cujo cosseno � a express�o float especificada; tamb�m chamada 
--de arco-cosseno.
SELECT ACOS(-1)--Resultado: 3,14159265358979


--Retorna o valor exponencial da express�o float especificada.
SELECT EXP(1)--Resultado: 2,71828182845905


--Retorna um valor num�rico, arredondado, para o comprimento ou precis�o especificados.
SELECT ROUND(123.9994, 3), ROUND(123.9995, 3);--Resultado: 123.9990	124.0000


--Retorna o �ngulo, em radiano, cujo seno � a express�o float especificada. Isso tamb�m � chamado de arco seno.
DECLARE @angle DECIMAL
SET @angle = -1.01
SELECT 'The ASIN of the angle is: ' + CONVERT(VARCHAR, ASIN(@angle))
GO --Resultado: The ASIN of the angle is: -1.5708

--Retorna o maior inteiro menor ou igual � express�o num�rica especificada.
SELECT FLOOR(123.45), FLOOR(-123.45), FLOOR($123.45);--Resultado: 1	123	-124	123,00


--Retorna o sinal positivo (+1), zero (0) ou sinal negativo (-1) da express�o especificada.
--O exemplo a seguir retorna os valores SIGN de n�meros de -1 a 1.
DECLARE @value real
SET @value = -1
WHILE @value < 2
   BEGIN
      SELECT SIGN(@value)
      SET NOCOUNT ON
      SELECT @value = @value + 1
      SET NOCOUNT OFF
   END
SET NOCOUNT OFF
GO

--Retorna o �ngulo, em radiano, cuja tangente � uma express�o float especificada. Tamb�m � chamado de arco-tangente.
--O exemplo a seguir usa uma express�o float e retorna o ATAN do �ngulo especificado.
SELECT 'The ATAN of -45.01 is: ' + CONVERT(varchar, ATAN(-45.01))
SELECT 'The ATAN of -181.01 is: ' + CONVERT(varchar, ATAN(-181.01))
SELECT 'The ATAN of 0 is: ' + CONVERT(varchar, ATAN(0))
SELECT 'The ATAN of 0.1472738 is: ' + CONVERT(varchar, ATAN(0.1472738))
SELECT 'The ATAN of 197.1099392 is: ' + CONVERT(varchar, ATAN(197.1099392))
GO


--Retorna o logaritmo natural da express�o float especificada no SQL Server.
DECLARE @var float = 10;
SELECT 'The LOG of the variable is: ' + CONVERT(VARCHAR, LOG(@var));
GO

--Retorna o seno trigonom�trico do �ngulo especificado, em radianos, e em uma express�o num�rica aproximada float.
--O exemplo a seguir calcula o SIN para um �ngulo especificado.
DECLARE @angle FLOAT;
SET @angle = 45.175643;
SELECT 'The SIN of the angle is: ' + CONVERT(VARCHAR,SIN(@angle));
GO


--Retorna o �ngulo, em radianos, entre o eixo x positivo e o raio a partir da origem at� o ponto (y, x), 
--em que x e y s�o os valores das duas express�es flutuantes especificadas.
--O exemplo a seguir calcula o ATN2 para os componentes x e y especificados.
DECLARE @x float = 35.175643, @y float = 129.44;
SELECT 'The ATN2 of the angle is: ' + CONVERT(varchar,ATN2(@x,@y ));
GO


--Retorna o logaritmo na base 10 da express�o float especificada.
DECLARE @var FLOAT;
SET @var = 145.175643;
SELECT 'The LOG10 of the variable is: ' + CONVERT(VARCHAR,LOG10(@var));
GO


--Retorna o seno trigonom�trico do �ngulo especificado, em radianos, e em uma express�o num�rica aproximada float.
--O exemplo a seguir calcula o SIN para um �ngulo especificado.
DECLARE @angle FLOAT;
SET @angle = 45.175643;
SELECT 'The SIN of the angle is: ' + CONVERT(VARCHAR,SIN(@angle));
GO


--Retorna a raiz quadrada do valor flutuante especificado.
DECLARE @myvalue FLOAT;
SET @myvalue = 1.00;
WHILE @myvalue < 10.00
   BEGIN
      SELECT @myvalue AS 'VALOR', SQRT(@myvalue) AS 'RAIZ';
      SET @myvalue = @myvalue + 1
   END;
GO


--Retorna o menor inteiro maior que ou igual a express�o num�rica especificada.
SELECT CEILING($123.45), CEILING($-123.45), CEILING($0.0);
GO


--Retorna o quadrado do valor flutuante especificado.
DECLARE @valor FLOAT
SET @valor = 1.00
WHILE @valor < 10.00
BEGIN
	SELECT @valor AS 'VALOR', SQUARE(@valor) AS 'RAIZ QUADRADA'
	SET @valor = @valor + 1;
END
GO



--� uma fun��o matem�tica que retorna o cosseno trigonom�trico do �ngulo especificado, em radianos, na express�o especificada.
DECLARE @angle FLOAT;
SET @angle = 14.78;
SELECT 'The COS of the angle is: ' + CONVERT(VARCHAR,COS(@angle));
GO


--Retorna o valor da express�o especificada elevada � pot�ncia especificada.
DECLARE @input1 FLOAT;
DECLARE @input2 FLOAT;
SET @input1= 2;
SET @input2 = 2.5;
SELECT POWER(@input1, 3) AS Result1, POWER(@input2, 3) AS Result2;


--Retorna a tangente da express�o de entrada.
--O exemplo a seguir retorna a tangente de PI()/2.
SELECT TAN(PI()/2);


--Uma fun��o matem�tica que retorna a cotangente trigonom�trica do �ngulo especificado, em radianos, na express�o 
--float especificada.
DECLARE @angle float;
SET @angle = 124.1332;
SELECT 'The COT of the angle is: ' + CONVERT(varchar,COT(@angle));
GO


--Retorna radianos quando uma express�o num�rica, em graus, � inserida.
-- First value is -45.01.
DECLARE @angle float
SET @angle = -45.01
SELECT 'The RADIANS of the angle is: ' +
   CONVERT(varchar, RADIANS(@angle))
GO















