/*Desafio Banco De Dados*/

DROP TABLE IF EXISTS dbo.ArtigoPC;
DROP TABLE IF EXISTS dbo.Artigos;
DROP TABLE IF EXISTS dbo.PalavraChave;
DROP TABLE IF EXISTS dbo.Area;
DROP TABLE IF EXISTS dbo.Publicacao;
GO

CREATE TABLE Publicacao(
Titulo VARCHAR(200),
Editora VARCHAR(100),
ISSN VARCHAR(20) PRIMARY KEY,
URL VARCHAR(255)
);

CREATE TABLE Artigos(
Ano INTEGER,
Npaginas INTEGER,
ID INTEGER PRIMARY KEY,
Titulo VARCHAR(200),
fk_Publicacao_ISSN VARCHAR(20),
fk_Area_ID_Area INTEGER
);

CREATE TABLE Area(
ID_Area INTEGER PRIMARY KEY,
Descricao VARCHAR(100)
);

CREATE TABLE PalavraChave(
ID_PC INTEGER PRIMARY KEY,
DescricaoPC VARCHAR(100)
);

CREATE TABLE ArtigoPC(
fk_Artigos_ID INTEGER,
fk_PalavraChave_ID_PC INTEGER
);

ALTER TABLE Artigos 
	ADD CONSTRAINT FK_Artigos_2
	FOREIGN KEY (fk_Publicacao_ISSN)
	REFERENCES Publicacao (ISSN)
	ON DELETE CASCADE;

ALTER TABLE Artigos 
	ADD CONSTRAINT FK_Artigos_3
	FOREIGN KEY (fk_Area_ID_Area)
	REFERENCES Area (ID_Area)
	ON DELETE CASCADE;

ALTER TABLE ArtigoPC 
	ADD CONSTRAINT FK_ArtigoPC_1
	FOREIGN KEY (fk_Artigos_ID)
	REFERENCES Artigos (ID)
	ON DELETE CASCADE;

ALTER TABLE ArtigoPC
	ADD CONSTRAINT FK_ArtigoPC_2
	FOREIGN KEY (fk_PalavraChave_ID_PC)
	REFERENCES PalavraChave (ID_PC)
	ON DELETE CASCADE;

/* Publicação (5) */
INSERT INTO Publicacao (ISSN, Titulo, Editora, URL) VALUES
('3456-7890', 'O impacto da IA na Medicina', 'AI Press', 'Link');
INSERT INTO Publicacao (ISSN, Titulo, Editora, URL) VALUES
('2345-6789', 'Algoritmos Genéticos para Otimização', 'TechPress', 'Link');
INSERT INTO Publicacao (ISSN, Titulo, Editora, URL) VALUES
('4567-8901', 'A evolução da Internet das Coisas', 'TechPress', 'Link');
INSERT INTO Publicacao (ISSN, Titulo, Editora, URL) VALUES
('5678-9012', 'Blockchain na Segurança Cibernética', 'SecureData', 'Link');
INSERT INTO Publicacao (ISSN, Titulo, Editora, URL) VALUES
('7890-1234', 'Big Data na análise de tendências', 'DataPress', 'Link');

/* Área (5) */
INSERT INTO Area (ID_Area, Descricao) VALUES (1, 'Inteligência Artificial');
INSERT INTO Area (ID_Area, Descricao) VALUES (2, 'Computação');
INSERT INTO Area (ID_Area, Descricao) VALUES (3, 'Tecnologia');
INSERT INTO Area (ID_Area, Descricao) VALUES (4, 'Segurança');
INSERT INTO Area (ID_Area, Descricao) VALUES (5, 'Ciência de Dados');

/* PalavraChave (5) */
INSERT INTO PalavraChave (ID_PC, DescricaoPC) VALUES (1, 'IA');
INSERT INTO PalavraChave (ID_PC, DescricaoPC) VALUES (2, 'Medicina');
INSERT INTO PalavraChave (ID_PC, DescricaoPC) VALUES (3, 'Deep Learning');
INSERT INTO PalavraChave (ID_PC, DescricaoPC) VALUES (4, 'Blockchain');
INSERT INTO PalavraChave (ID_PC, DescricaoPC) VALUES (5, 'Big Data');

/* Artigos (5) */
INSERT INTO Artigos (ID, Titulo, Ano, NPaginas, fk_Publicacao_ISSN, fk_Area_ID_Area) VALUES
(1, 'O impacto da IA na Medicina', 2023, 15, '3456-7890', 1);
INSERT INTO Artigos (ID, Titulo, Ano, NPaginas, fk_Publicacao_ISSN, fk_Area_ID_Area) VALUES
(2, 'Algoritmos Genéticos para Otimização', 2022, 12, '2345-6789', 2);
INSERT INTO Artigos (ID, Titulo, Ano, NPaginas, fk_Publicacao_ISSN, fk_Area_ID_Area) VALUES
(3, 'Redes Neurais Convolucionais', 2021, 20, '3456-7890', 1);
INSERT INTO Artigos (ID, Titulo, Ano, NPaginas, fk_Publicacao_ISSN, fk_Area_ID_Area) VALUES
(4, 'A evolução da Internet das Coisas', 2023, 18, '4567-8901', 3);
INSERT INTO Artigos (ID, Titulo, Ano, NPaginas, fk_Publicacao_ISSN, fk_Area_ID_Area) VALUES
(5, 'Blockchain na Segurança Cibernética', 2020, 14, '5678-9012', 4);

/* ArtigoPC (5) */
INSERT INTO ArtigoPC (fk_Artigos_ID, fk_PalavraChave_ID_PC) VALUES (1, 1);
INSERT INTO ArtigoPC (fk_Artigos_ID, fk_PalavraChave_ID_PC) VALUES (1, 2);
INSERT INTO ArtigoPC (fk_Artigos_ID, fk_PalavraChave_ID_PC) VALUES (2, 1);
INSERT INTO ArtigoPC (fk_Artigos_ID, fk_PalavraChave_ID_PC) VALUES (3, 3);
INSERT INTO ArtigoPC (fk_Artigos_ID, fk_PalavraChave_ID_PC) VALUES (5, 4);

SELECT * FROM Publicacao;
SELECT * FROM Artigos;
SELECT * FROM Area;
SELECT * FROM PalavraChave;
SELECT * FROM ArtigoPC;