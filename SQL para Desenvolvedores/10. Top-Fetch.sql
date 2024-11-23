--SELECT TOP 4 * FROM Alunos ORDER BY Id

--TRAZ O PERCENTUAL
--SELECT TOP 10 PERCENT * FROM Alunos ORDER BY Id

/*
ORDER BY � obrigat�rio ao usar as cl�usulas OFFSET e FETCH
OFFSET 2 ROWS: Ignora os 2 primeiros registros da lista ordenada.
FETCH FIRST 2 ROWS ONLY: Retorna apenas os pr�ximos 2 registros ap�s os ignorados pelo OFFSET
*/

SELECT * FROM Alunos ORDER BY Id 
OFFSET 2 ROWS
FETCH FIRST 2 ROWS ONLY