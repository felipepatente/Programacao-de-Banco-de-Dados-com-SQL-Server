

------------------------------------------------------FUNÇÕES DE STRING------------------------------------------------------

--Retorna o valor do código ASCII do caractere mais à esquerda de uma expressão de caractere.
SELECT ASCII('A')--Resultado: 65


--Converte um int código ASCII em um caractere.
SELECT CHAR(78)--Resultado: N


--Pesquisa uma expressão para outra e retorna sua posição inicial, se for localizada.
DECLARE @document VARCHAR(50) = 'APRENDENDO FUNÇÕES SQL SERVER';
SELECT CHARINDEX('SQL',@document);--Resultado: 20


--Retorna uma cadeia de caracteres que é o resultado da concatenação de dois ou mais valores.
DECLARE @variavel VARCHAR(50);
SELECT @variavel = CONCAT('Feliz ','Aniversario ','Filho');
SELECT @variavel


--Concatena um número variável de argumentos com um delimitador especificado no argumento 1º. (CONCAT_WS indica concatenar com separador.)
SELECT DIFFERENCE('green','green');--Resultado: 4


--Retorna um valor formatado com o formato e a cultura opcional especificados no SQL Server 2017. 
--Use a função FORMAT para formatação com reconhecimento de localidade de valores de data/hora e número como cadeias de caracteres. 
--Para conversões de tipos de dados gerais, use CAST ou CONVERT.
DECLARE @d DATETIME = '10/01/2011';  
SELECT FORMAT ( @d, 'd', 'en-US' ) AS 'US English Result'  


--Retorna a parte da esquerda de uma cadeia de caracteres com o número de caracteres especificado.
SELECT LEFT('Joao da Silva',6);--Resultado: Joao d


--Retorna o número de caracteres da expressão da cadeia de caracteres especificada, excluindo espaços em branco à direita.
SELECT LEN('TAMANHO DA PALAVRA');--Resultado: 18


--Retorna uma expressão de caractere depois de converter para minúsculas os dados de caracteres em maiúsculas.
SELECT LOWER('MAIS');--Resultado: mais


--Retorna uma expressão de caractere depois de remover espaços em branco à esquerda.
SELECT LTRIM(' O QUE')--Resultado:O QUE


--Retorna o caractere Unicode com o código inteiro especificado, como definido pelo padrão do Unicode.
SELECT NCHAR(25365)

--Retorna a posição inicial da primeira ocorrência de um padrão em uma expressão específica ou zeros, 
--se o padrão não for encontrado, em todos os tipos de dados de caractere e de texto válidos.
SELECT PATINDEX('%mais%','mais não foi assim');--Resultado: 1


--Retorna uma cadeia de caracteres Unicode com os delimitadores adicionados para tornar a cadeia de caracteres de entrada um 
--identificador delimitado válido do SQL Server.
SELECT QUOTENAME('abc[]def');

--Substitui todas as ocorrências de um valor da cadeia de caracteres especificado por outro valor de cadeia de caracteres.
SELECT REPLACE('Mais - suco - por - favor','-','*')--Resultado: Mais * suco * por * favor;


--Repete um valor da cadeia de caracteres um número especificado de vezes.
SELECT REPLICATE(' O que você fez','3')--Resultado: O que você fez O que você fez O que você fez


--Retorna a ordem inversa de um valor da cadeia de caracteres.
SELECT REVERSE('roma');--Resultado: amor


--Retorna a parte da direita de uma cadeia de caracteres com o número de caracteres especificado.
SELECT RIGHT('ontem eu fui em casa',6)--Resultado: m casa


--Retorna uma cadeia de caracteres após truncar todos os espaços à direita.
SELECT RTRIM('Serio   ');--Resultado: Serio


--Retorna um código de quatro caracteres (SOUNDEX) para avaliar a semelhança de duas cadeias de caracteres.
SELECT SOUNDEX('amor'), SOUNDEX('roma');--Resultado: A560 R500

--Retorna dados de caractere convertidos de dados numéricos.
SELECT STR(123.45, 6, 1);--Resultado: 123.5

--A função STUFF insere uma cadeia de caracteres em outra cadeia de caracteres. 
--Ela exclui um comprimento especificado de caracteres da primeira cadeia na posição inicial e, em seguida, insere a segunda cadeia 
--na primeira, na posição inicial.
SELECT STUFF ('Não aaa roma', 5 , 3 ,'fui a')--Resultado: Não fui a roma


--Retorna parte de uma expressão de caractere, binária, de texto ou de imagem no SQL Server.
SELECT SUBSTRING('Ontem fui a uma festa',6,16);--Resultado: fui a uma festa


--Retorna o valor inteiro, como definido pelo padrão Unicode, para o primeiro caractere da expressão de entrada.
SELECT UNICODE('A');--Resultado: 65


--Retorna uma expressão de caractere com dados de caractere em minúsculas convertidos em maiúsculas.
SELECT UPPER('não fui');--NÃO FUI



------------------------------------------------------FUNÇÕES DE MATEMATICA------------------------------------------------------

--Uma função matemática que retorna o valor absoluto (positivo) da expressão numérica especificada.
SELECT ABS(-58)--Resultado: 58

--Retorna o valor constante de PI.
SELECT PI()--Resultado: 3,14159265358979


--Retorna o ângulo correspondente em graus para um ângulo especificado em radiano.
SELECT DEGREES((PI()/2))--Resultado: 90


--RAND(): Retorna um valor float pseudoaleatório de 0 a 1, exclusivo.
SELECT FORMAT(RAND() * 100,'###')


--Uma função matemática que retorna o ângulo, em radiano, cujo cosseno é a expressão float especificada; também chamada 
--de arco-cosseno.
SELECT ACOS(-1)--Resultado: 3,14159265358979


--Retorna o valor exponencial da expressão float especificada.
SELECT EXP(1)--Resultado: 2,71828182845905


--Retorna um valor numérico, arredondado, para o comprimento ou precisão especificados.
SELECT ROUND(123.9994, 3), ROUND(123.9995, 3);--Resultado: 123.9990	124.0000


--Retorna o ângulo, em radiano, cujo seno é a expressão float especificada. Isso também é chamado de arco seno.
DECLARE @angle DECIMAL
SET @angle = -1.01
SELECT 'The ASIN of the angle is: ' + CONVERT(VARCHAR, ASIN(@angle))
GO --Resultado: The ASIN of the angle is: -1.5708

--Retorna o maior inteiro menor ou igual à expressão numérica especificada.
SELECT FLOOR(123.45), FLOOR(-123.45), FLOOR($123.45);--Resultado: 1	123	-124	123,00


--Retorna o sinal positivo (+1), zero (0) ou sinal negativo (-1) da expressão especificada.
--O exemplo a seguir retorna os valores SIGN de números de -1 a 1.
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

--Retorna o ângulo, em radiano, cuja tangente é uma expressão float especificada. Também é chamado de arco-tangente.
--O exemplo a seguir usa uma expressão float e retorna o ATAN do ângulo especificado.
SELECT 'The ATAN of -45.01 is: ' + CONVERT(varchar, ATAN(-45.01))
SELECT 'The ATAN of -181.01 is: ' + CONVERT(varchar, ATAN(-181.01))
SELECT 'The ATAN of 0 is: ' + CONVERT(varchar, ATAN(0))
SELECT 'The ATAN of 0.1472738 is: ' + CONVERT(varchar, ATAN(0.1472738))
SELECT 'The ATAN of 197.1099392 is: ' + CONVERT(varchar, ATAN(197.1099392))
GO


--Retorna o logaritmo natural da expressão float especificada no SQL Server.
DECLARE @var float = 10;
SELECT 'The LOG of the variable is: ' + CONVERT(VARCHAR, LOG(@var));
GO

--Retorna o seno trigonométrico do ângulo especificado, em radianos, e em uma expressão numérica aproximada float.
--O exemplo a seguir calcula o SIN para um ângulo especificado.
DECLARE @angle FLOAT;
SET @angle = 45.175643;
SELECT 'The SIN of the angle is: ' + CONVERT(VARCHAR,SIN(@angle));
GO


--Retorna o ângulo, em radianos, entre o eixo x positivo e o raio a partir da origem até o ponto (y, x), 
--em que x e y são os valores das duas expressões flutuantes especificadas.
--O exemplo a seguir calcula o ATN2 para os componentes x e y especificados.
DECLARE @x float = 35.175643, @y float = 129.44;
SELECT 'The ATN2 of the angle is: ' + CONVERT(varchar,ATN2(@x,@y ));
GO


--Retorna o logaritmo na base 10 da expressão float especificada.
DECLARE @var FLOAT;
SET @var = 145.175643;
SELECT 'The LOG10 of the variable is: ' + CONVERT(VARCHAR,LOG10(@var));
GO


--Retorna o seno trigonométrico do ângulo especificado, em radianos, e em uma expressão numérica aproximada float.
--O exemplo a seguir calcula o SIN para um ângulo especificado.
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


--Retorna o menor inteiro maior que ou igual a expressão numérica especificada.
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



--É uma função matemática que retorna o cosseno trigonométrico do ângulo especificado, em radianos, na expressão especificada.
DECLARE @angle FLOAT;
SET @angle = 14.78;
SELECT 'The COS of the angle is: ' + CONVERT(VARCHAR,COS(@angle));
GO


--Retorna o valor da expressão especificada elevada à potência especificada.
DECLARE @input1 FLOAT;
DECLARE @input2 FLOAT;
SET @input1= 2;
SET @input2 = 2.5;
SELECT POWER(@input1, 3) AS Result1, POWER(@input2, 3) AS Result2;


--Retorna a tangente da expressão de entrada.
--O exemplo a seguir retorna a tangente de PI()/2.
SELECT TAN(PI()/2);


--Uma função matemática que retorna a cotangente trigonométrica do ângulo especificado, em radianos, na expressão 
--float especificada.
DECLARE @angle float;
SET @angle = 124.1332;
SELECT 'The COT of the angle is: ' + CONVERT(varchar,COT(@angle));
GO


--Retorna radianos quando uma expressão numérica, em graus, é inserida.
-- First value is -45.01.
DECLARE @angle float
SET @angle = -45.01
SELECT 'The RADIANS of the angle is: ' +
   CONVERT(varchar, RADIANS(@angle))
GO















