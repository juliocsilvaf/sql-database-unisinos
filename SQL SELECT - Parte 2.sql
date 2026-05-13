SELECT COUNT(*) FROM Aviao
WHERE id_modelo = 1;

SELECT MAX(autonomia) FROM Modelo;

SELECT MIN(num_lugares) FROM Modelo;

SELECT SUM(autonomia) FROM Modelo;

SELECT AVG(autonomia) AS "Média" FROM Modelo;

SELECT * FROM Modelo
ORDER BY autonomia;

SELECT * FROM Modelo
ORDER BY autonomia DESC
FETCH FIRST 3 ROWS ONLY;

-- EM SQLSERVER FICARIA ASSIM
/* 
SELECT TOP 3 * FROM Modelo
ORDER BY autonomia DESC
*/

SELECT COUNT(*) FROM Voo
WHERE partida = 'Porto Alegre';

SELECT COUNT(*) FROM Voo
WHERE partida = 'São Paulo';

SELECT partida, COUNT(*) AS qtde FROM Voo
GROUP BY partida HAVING COUNT(*) > 1;

--Qual é o destino que mais possui voos?

SELECT destino, COUNT(*) FROM Voo
GROUP BY destino
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROWS ONLY;

--Qual é o nome do piloto que possui mais dependentes
SELECT NOME FROM Piloto
WHERE num_licen = (
                    SELECT num_licen FROM Dependente
                    GROUP BY num_licen
                    ORDER BY COUNT(*) DESC
                    FETCH FIRST 1 ROWS ONLY
    			  );
