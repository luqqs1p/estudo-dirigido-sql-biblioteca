USE biblioteca;

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


