USE biblioteca;

-- Questão 5: Liste todos os livros publicados após o ano 2000.
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao > 2000;


