--1) Liste todos os aviões indicando seu id, nome, número de lugares e autonomia.
SELECT * FROM Aviao;
SELECT * FROM Modelo;

SELECT Aviao.matricula, Modelo.nome, Modelo.num_lugares, Modelo.autonomia FROM Aviao, Modelo  
WHERE Aviao.id_modelo = Modelo.id_modelo;

SELECT a.matricula, m.nome, m.num_lugares, m.autonomia FROM Aviao a, Modelo m 
WHERE a.id_modelo = m.id_modelo;   

--2) Liste todos os aviões indicando seu id, nome, número de lugares e autonomia, 
--apenas para aviões que possuam mais de 150 lugares. Ordene por ordem crescente 
--de número de lugares.

SELECT a.matricula, m.nome, m.num_lugares, m.autonomia FROM Aviao a, Modelo m 
WHERE a.id_modelo = m.id_modelo AND
      m.num_lugares > 150
ORDER BY m.num_lugares;

SELECT a.matricula, m.nome, m.num_lugares, m.autonomia 
FROM Aviao a INNER JOIN Modelo m ON a.id_modelo = m.id_modelo    
WHERE m.num_lugares > 150
ORDER BY m.num_lugares;

--3) Exiba o nome dos modelos que não possuem aviões
SELECT nome FROM Modelo
WHERE id_modelo NOT IN (
    SELECT id_modelo FROM Aviao
);

SELECT M.nome FROM Modelo m LEFT JOIN Aviao a ON m.id_modelo = a.id_modelo    
WHERE a.matricula IS NULL;

--4) Exiba uma lista de com o nome de cada piloto e a quantidade de voos em que ele está alocado
SELECT p.nome, COUNT(*) AS qtde FROM Piloto p INNER JOIN Voo v ON p.num_licen = v.num_licen
GROUP BY p.nome;

--5)Qual é o nome do piloto que possui mais dependentes?
SELECT NOME FROM Piloto
WHERE num_licen = (
                    SELECT num_licen FROM Dependente
                    GROUP BY num_licen
                    ORDER BY COUNT(*) DESC
                    FETCH FIRST 1 ROWS ONLY
    			  );

SELECT p.nome FROM Piloto p INNER JOIN Dependente d ON p.num_licen = d.num_licen
GROUP BY p.nome
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROWS ONLY;

