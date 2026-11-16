USE biblioteca;

-- Questão 9: Liste o título de todos os livros juntamente com o nome do autor e o nome da editora.
SELECT l.titulo,
       a.nome AS autor,
       e.nome AS editora
FROM livros l
INNER JOIN autores a  ON a.autor_id = l.autor_id
INNER JOIN editoras e ON e.editora_id = l.editora_id;


