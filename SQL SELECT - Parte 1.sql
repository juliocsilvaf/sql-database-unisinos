SELECT * FROM Piloto;

SELECT num_licen, nome FROM Piloto;

SELECT DISTINCT data FROM Voo
ORDER BY data DESC;

SELECT * FROM Aviao
WHERE matricula = 'CD3F456';

SELECT * FROM Aviao
WHERE id_modelo = 2 OR
      id_modelo = 3;

SELECT * FROM Aviao
WHERE id_modelo IN (2, 3);

SELECT * FROM Aviao
WHERE id_modelo NOT IN (2, 3);

SELECT * FROM Aviao
WHERE id_modelo BETWEEN 2 AND 4;

SELECT * FROM Voo
WHERE num_licen = 123456 AND
      (partida = 'Porto Alegre' OR
      partida = 'São Paulo');

SELECT * FROM Voo
WHERE num_licen = 123456 AND
      partida IN ('Porto Alegre', 'São Paulo');

SELECT * FROM Voo
WHERE partida NOT like '__r%';
