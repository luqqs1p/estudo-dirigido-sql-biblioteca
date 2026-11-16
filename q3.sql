USE biblioteca;

-- Questão 3: Calcule a média do ano de publicação dos livros para cada editora.
-- Exiba o nome da editora e a média do ano de publicação.
SELECT e.nome AS editora,
       AVG(l.ano_publicacao) AS media_ano_publicacao
FROM editoras e
JOIN livros l ON l.editora_id = e.editora_id
GROUP BY e.editora_id, e.nome;


