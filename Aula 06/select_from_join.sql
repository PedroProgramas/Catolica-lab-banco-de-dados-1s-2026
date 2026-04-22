/*carrega todos os livros*/
select * from livro;

/*Carrega todos os livros (titulo), busca o nome do autor e da categoria*/
SELECT
	t4.nome as nome_autor,
    t1.titulo,
    t3.nome as nome_categoria,
    t5.nome as nome_editora,
    t2.nome as nome_usuario
FROM
	livro t1
JOIN
	usuario t2 on (t1.id_usuario = t2.id_usuario)
join
	autor t4 on (t1.id_autor = t4.id_autor)
join 
	categoria t3 on (t1.id_categoria = t3.id_categoria)
join
	editora t5 on (t1.id_editora = t5.id_editora);



