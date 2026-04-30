/* CARREGA TODOS OS LIVROS */
select * from livro;

/*
Carrega todos os livros (titulo)
e busca o nome do autor
*/
SELECT
	t2.nome as nome_autor,
	t1.titulo
FROM
	livro t1
JOIN
	autor t2 ON (t1.id_autor = t2.id_autor);
    
/*
Carrega todos os livros (titulo)
e busca o nome do autor
e busca o nome da categoria
*/
SELECT 
    t2.nome AS nome_autor, t1.titulo, t3.nome AS nome_categoria
FROM
    livro t1
        JOIN
    autor t2 ON (t1.id_autor = t2.id_autor)
        JOIN
    categoria t3 ON (t1.id_categoria = t3.id_categoria);
    
/* Busca título e 
todos os campos de nome das relações*/    
SELECT 
    t4.nome as nome_usuario,
    t2.nome AS nome_autor, 
    t1.titulo, 
    t3.nome AS nome_categoria,
    t5.nome as nome_editora
FROM
    livro t1
JOIN
    autor t2 ON (t1.id_autor = t2.id_autor)
JOIN
    categoria t3 ON (t1.id_categoria = t3.id_categoria)
JOIN
    usuario t4 ON (t1.id_usuario = t4.id_usuario)
JOIN
    editora t5 ON (t1.id_editora = t5.id_editora);
    
/* Conta quantidade de livros na tabela para um usuário específico*/
SELECT
	COUNT(*)
FROM
	LIVRO
WHERE
	ID_USUARIO=1;
/* Deleta um livro e dá control enter no "WHERE ID_USUARIO=1", retira um livro, era 14 fica 13*/
DELETE FROM LIVRO WHERE ID_LIVRO = 1;

/* Conta quantidade de livros na tabela para todos os usuários*/
SELECT
	ID_USUARIO,
    COUNT(*)
FROM
	LIVRO
GROUP BY
	ID_USUARIO;

/* Conta quantidade de livros na tabela para todas as categorias por nome*/
SELECT
	t1.ID_CATEGORIA,
    t2.NOME,
    COUNT(t1.id_livro) AS QTD_LIVRO
FROM
	LIVRO t1
JOIN
	CATEGORIA t2 ON (t1.ID_CATEGORIA = t2.ID_CATEGORIA)
GROUP BY
	t1.ID_CATEGORIA,
    t2.NOME;
    
/* Conta quantidade de livros na tabela para todas os usuários por nome*/
SELECT
	t1.ID_USUARIO,
    t2.NOME,
    COUNT(t1.id_livro) AS QTD_LIVRO
FROM
	LIVRO t1
JOIN
	USUARIO t2 ON (t1.ID_USUARIO = t2.ID_USUARIO)
GROUP BY
	t1.ID_USUARIO,
    t2.NOME;
    
/* Conta a quantidade de ambos*/
SELECT
	t1.ID_USUARIO,
    t1.ID_CATEGORIA,
    t2.NOME,
    t3.NOME,
    COUNT(t1.id_livro) AS QTD_LIVRO
FROM
	LIVRO t1
JOIN
	USUARIO t2 ON (t1.ID_USUARIO = t2.ID_USUARIO)
JOIN
	CATEGORIA t3 ON (t1.ID_CATEGORIA = t3.ID_CATEGORIA)
GROUP BY
	t1.ID_USUARIO,
    t1.ID_CATEGORIA,
    t2.NOME,
    t3.NOME
/* Ordena por ordem decrescente */
ORDER BY
QTD_LIVRO DESC;

/* Conta quantidade E PERCENTUAL de livros na tabela para todas as categorias POR NOME*/
SELECT
	t1.ID_CATEGORIA,
    t2.NOME,
    COUNT(t1.id_livro) AS QTD_LIVRO,
    (COUNT(t1.ID_LIVRO)/(SELECT COUNT(*)FROM LIVRO))*100 AS PCT
FROM
	LIVRO t1
JOIN
	CATEGORIA t2 ON (t1.ID_CATEGORIA = t2.ID_CATEGORIA)
GROUP BY
	t1.ID_CATEGORIA,
    t2.NOME
ORDER BY
	PCT DESC;