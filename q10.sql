USE biblioteca;

-- Questão 10: Encontre todos os livros que não possuem um autor cadastrado. Exiba o título do livro.
SELECT l.titulo
FROM livros l
LEFT JOIN autores a ON a.autor_id = l.autor_id
WHERE a.autor_id IS NULL;
