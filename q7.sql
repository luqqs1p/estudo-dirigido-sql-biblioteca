USE biblioteca;

-- Questão 7: Liste as editoras que publicaram mais de 2 livros.
SELECT e.nome AS editora,
       COUNT(l.livro_id) AS total_livros
FROM editoras e
JOIN livros l ON l.editora_id = e.editora_id
GROUP BY e.editora_id, e.nome
HAVING COUNT(l.livro_id) > 2;


