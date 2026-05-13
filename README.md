# ✈️ SQL – Banco de Dados Relacional

Projetos acadêmicos desenvolvidos na disciplina de **Banco de Dados** na **Unisinos – Universidade do Vale do Rio dos Sinos** (2025/1).

Dois projetos cobrindo consultas SQL progressivas e modelagem de banco de dados com chaves estrangeiras.

---

## 📋 Visão Geral

**Disciplina:** Banco de Dados  
**Linguagem:** SQL (compatível com Oracle e SQL Server)

---

## 📁 Estrutura do Projeto

```
CIA_Aerea/
├── CIA_Aerea.sql              ← Script de criação e população do banco
├── SQL_SELECT_Parte_1.sql     ← Filtros básicos: WHERE, IN, BETWEEN, LIKE
├── SQL_SELECT_Parte_2.sql     ← Agregações: COUNT, MAX, MIN, AVG, GROUP BY
└── SQL_SELECT_Parte_3.sql     ← JOINs, subqueries e LEFT JOIN

Desafio/
└── Desafio.sql                ← Modelagem e população de banco de artigos científicos
```

---

## ✈️ Projeto 1 – CIA Aérea

Banco de dados de uma companhia aérea com tabelas de Pilotos, Aviões, Modelos, Voos e Dependentes.

### Parte 1 – Filtros e Seleção
```sql
-- Filtros com WHERE, IN, BETWEEN, LIKE, DISTINCT, ORDER BY
SELECT * FROM Aviao WHERE id_modelo IN (2, 3);
SELECT * FROM Voo WHERE partida NOT LIKE '__r%';
SELECT DISTINCT data FROM Voo ORDER BY data DESC;
```

**Conceitos:** `WHERE`, `IN`, `NOT IN`, `BETWEEN`, `LIKE`, `DISTINCT`, `ORDER BY`

---

### Parte 2 – Funções de Agregação
```sql
-- Agregações, agrupamentos e subqueries
SELECT AVG(autonomia) AS "Média" FROM Modelo;
SELECT partida, COUNT(*) AS qtde FROM Voo GROUP BY partida HAVING COUNT(*) > 1;
SELECT destino, COUNT(*) FROM Voo GROUP BY destino ORDER BY COUNT(*) DESC FETCH FIRST 1 ROWS ONLY;
```

**Conceitos:** `COUNT`, `MAX`, `MIN`, `SUM`, `AVG`, `GROUP BY`, `HAVING`, `FETCH FIRST`, subqueries

---

### Parte 3 – JOINs e Subqueries
```sql
-- INNER JOIN, LEFT JOIN, subqueries correlacionadas
SELECT a.matricula, m.nome, m.num_lugares, m.autonomia
FROM Aviao a INNER JOIN Modelo m ON a.id_modelo = m.id_modelo
WHERE m.num_lugares > 150 ORDER BY m.num_lugares;

-- Modelos sem aviões (LEFT JOIN e subquery)
SELECT M.nome FROM Modelo m LEFT JOIN Aviao a ON m.id_modelo = a.id_modelo
WHERE a.matricula IS NULL;
```

**Conceitos:** `INNER JOIN`, `LEFT JOIN`, subqueries, aliases, múltiplos critérios

---

## 📚 Projeto 2 – Desafio: Banco de Artigos Científicos

Modelagem e implementação de um banco de dados de artigos científicos com relacionamentos N:N.

### Estrutura das Tabelas

| Tabela | Descrição |
|--------|-----------|
| `Publicacao` | Revistas/publicações com ISSN único |
| `Artigos` | Artigos científicos com ano e número de páginas |
| `Area` | Áreas do conhecimento |
| `PalavraChave` | Palavras-chave dos artigos |
| `ArtigoPC` | Tabela associativa (N:N entre Artigos e PalavraChave) |

### Diagrama de Relacionamentos
```
Publicacao (1) ──── (N) Artigos (N) ──── (N) PalavraChave
                         │
                    (N) Area
```

```sql
-- Criação com chaves estrangeiras e CASCADE
ALTER TABLE Artigos ADD CONSTRAINT FK_Artigos_2
    FOREIGN KEY (fk_Publicacao_ISSN) REFERENCES Publicacao (ISSN) ON DELETE CASCADE;
```

**Conceitos:** `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `ON DELETE CASCADE`, `INSERT`, `DROP IF EXISTS`, relacionamento N:N

---

## 💡 Conceitos SQL Aplicados

- Filtros: `WHERE`, `IN`, `NOT IN`, `BETWEEN`, `LIKE`, `DISTINCT`
- Ordenação: `ORDER BY`, `FETCH FIRST N ROWS ONLY`
- Agregações: `COUNT`, `MAX`, `MIN`, `SUM`, `AVG`
- Agrupamentos: `GROUP BY`, `HAVING`
- Junções: `INNER JOIN`, `LEFT JOIN`, aliases de tabela
- Subqueries correlacionadas
- DDL: `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE IF EXISTS`
- DML: `INSERT INTO`, `SELECT`
- Integridade referencial: `PRIMARY KEY`, `FOREIGN KEY`, `ON DELETE CASCADE`

---

## 🎓 Contexto

Projetos desenvolvidos na disciplina de **Banco de Dados** do curso de **Tecnólogo em Análise e Desenvolvimento de Sistemas** na **Unisinos**, semestre 2025/1.

---

*Julio Cesar da Silva Filho | [LinkedIn](https://www.linkedin.com/in/julio-cesar-filho-84241842/)*
