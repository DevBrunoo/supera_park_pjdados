
--Para selecionar o banco de dados utilze esses comandos de prompt 

   sqlite3 fapespdb.db

-- 01_01
SELECT Pesquisador_Responsável, Pesquisadores_Associados FROM fapespdb;
SELECT Pesquisadores_Associados, Cidade FROM fapespdb;
SELECT Área do Conhecimento FROM fapespdb;
SELECT Cidade, Pesquisador_Responsável FROM fapespdb;
SELECT Cidade, Pesquisador_Responsável, Área_do_Conhecimento FROM fapespdb;
SELECT * FROM fapespdb;
SELECT Pesquisador_Responsável, Pesquisadores_Associados, Pesquisadores_Principais, Cidade, Instituições_no_Exterior, Área_do_Conhecimento, Data_de_Início, Data_de_Término FROM fapespdb;
---------------------------------------------------

--Consultas Avançadas com Funções Agregadas

-- Contar o número total de projetos cadastrados
SELECT COUNT(*) AS Total_Projetos FROM fapespdb;

-- Listar a cidade com o maior número de projetos
SELECT Cidade, COUNT(*) AS Numero_Projetos FROM fapespdb GROUP BY Cidade ORDER BY Numero_Projetos DESC LIMIT 1;

-- Obter o intervalo entre a data de início e a data de término dos projetos
SELECT 
    Pesquisador_Responsável, 
    Data_de_Início, 
    Data_de_Término, 
    julianday(Data_de_Término) - julianday(Data_de_Início) AS Duracao_Dias 
FROM fapespdb;
---------------------------------------------------

--Exclusão de Dados (DELETE)

-- Excluir um registro específico com base no Pesquisador_Responsável
DELETE FROM fapespdb WHERE Pesquisador_Responsável = 'Eduardo Carità';

-- Excluir todos os registros de projetos que terminaram antes de 2024
DELETE FROM fapespdb WHERE Data_de_Término < '2024-01-01';

--Atualização de Dados (UPDATE)

-- Atualizar a área de conhecimento de um projeto
UPDATE fapespdb 
SET Área_do_Conhecimento = 'Inteligência Artificial' 
WHERE Pesquisador_Responsável = 'Aloisio Mota Rodrigues Junior';

-- Atualizar a cidade de um projeto específico
UPDATE fapespdb 
SET Cidade = 'Sertaozinho' 
WHERE Pesquisadores_Associados = 'Bruno Costa';
---------------------------------------------------

--Consultas Adicionais (SELECT com WHERE, LIKE, e ORDER BY)

-- Selecionar projetos localizados no estado de SP
SELECT * FROM fapespdb WHERE Cidade LIKE 'São Paulo';

-- Selecionar projetos que não estão localizados em SP
SELECT * FROM fapespdb WHERE Cidade NOT LIKE 'São Paulo';

-- Selecionar projetos que começam após 1º de abril de 2024
SELECT * FROM fapespdb WHERE Data_de_Início > '2024-04-01';

-- Ordenar os projetos pela área de conhecimento em ordem alfabética
SELECT * FROM fapespdb ORDER BY Área_do_Conhecimento;

-- Selecionar apenas projetos com Pesquisador_Responsável contendo "Junior"
SELECT * FROM fapespdb WHERE Pesquisador_Responsável LIKE '%Junior%';

---------------------------------------------------

--Inserção de Dados (INSERT)

-- Inserir novos registros na tabela de projetos
INSERT INTO fapespdb (
    Pesquisador_Responsável, 
    Pesquisadores_Associados, 
    Pesquisadores_Principais, 
    Cidade, 
    Instituições_no_Exterior, 
    Área_do_Conhecimento, 
    Data_de_Início, 
    Data_de_Término
) VALUES
-- Exemplo 1: Registro para um projeto de computação
("Bruno Mota Rodrigues Junior", "Luiz Guilherme Miguel Jucá", NULL, "São Paulo", NULL, "Ciência da Computação", "2024-04-01", "2024-12-31"),

-- Exemplo 2: Registro para um projeto de engenharia elétrica
("Bianqinha016 Leite Munhoz", "Alex Reis", NULL, "Barueri", NULL, "Engenharia Elétrica", "2024-04-01", "2024-12-31"),

-- Exemplo 3: Registro para um projeto de engenharia biomédica
("Kid Carità", NULL, NULL, "Valinhos", NULL, "Engenharia Biomédica", "2024-04-01", "2024-12-31");
