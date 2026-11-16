-- Estudo Dirigido 3 - Queries SQL com MySQL
-- Disciplina: Bancos de Dados - Técnico em Segurança Cibernética
-- Aluno: Lucas da Silva Santos

USE biblioteca;

-- Questão 1: Selecionar todos os títulos dos livros e seus respectivos anos de publicação.
SELECT titulo, ano_publicacao
FROM livros;


-- Questão 2: Quantos livros foram publicados?
SELECT COUNT(*) AS total_livros
FROM livros;


-- Questão 3: Calcule a média do ano de publicação dos livros para cada editora.
-- Exiba o nome da editora e a média do ano de publicação.
SELECT e.nome AS editora,
       AVG(l.ano_publicacao) AS media_ano_publicacao
FROM editoras e
JOIN livros l ON l.editora_id = e.editora_id
GROUP BY e.editora_id, e.nome;


-- Questão 4: Qual é o livro mais antigo e o mais recente no acervo?
-- Exiba o título e o ano de publicação para ambos.
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao = (SELECT MIN(ano_publicacao) FROM livros)
   OR ano_publicacao = (SELECT MAX(ano_publicacao) FROM livros);


-- Questão 5: Liste todos os livros publicados após o ano 2000.
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao > 2000;


-- Questão 6: Selecione todos os autores e ordene-os em ordem alfabética crescente pelo nome.
SELECT *
FROM autores
ORDER BY nome ASC;


-- Questão 7: Liste as editoras que publicaram mais de 2 livros.
SELECT e.nome AS editora,
       COUNT(l.livro_id) AS total_livros
FROM editoras e
JOIN livros l ON l.editora_id = e.editora_id
GROUP BY e.editora_id, e.nome
HAVING COUNT(l.livro_id) > 2;


-- Questão 8: Liste o título do livro e uma coluna Status indicando se ele está
-- 'Emprestado' (existe empréstimo sem data de devolução) ou 'Disponível'.
-- A condição da devolução fica no ON para o livro aparecer uma única vez.
SELECT l.titulo,
       CASE
           WHEN e.emprestimo_id IS NULL THEN 'Disponível'
           ELSE 'Emprestado'
       END AS Status
FROM livros l
LEFT JOIN emprestimos e
       ON e.livro_id = l.livro_id
      AND e.data_devolucao IS NULL;


-- Questão 9: Liste o título de todos os livros juntamente com o nome do autor e o nome da editora.
SELECT l.titulo,
       a.nome AS autor,
       e.nome AS editora
FROM livros l
INNER JOIN autores a  ON a.autor_id = l.autor_id
INNER JOIN editoras e ON e.editora_id = l.editora_id;


-- Questão 10: Encontre todos os livros que não possuem um autor cadastrado. Exiba o título do livro.
SELECT l.titulo
FROM livros l
LEFT JOIN autores a ON a.autor_id = l.autor_id
WHERE a.autor_id IS NULL;
