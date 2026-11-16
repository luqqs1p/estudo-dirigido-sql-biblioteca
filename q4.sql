USE biblioteca;

-- Questão 4: Qual é o livro mais antigo e o mais recente no acervo?
-- Exiba o título e o ano de publicação para ambos.
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao = (SELECT MIN(ano_publicacao) FROM livros)
   OR ano_publicacao = (SELECT MAX(ano_publicacao) FROM livros);


