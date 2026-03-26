show tables;
USE aula04;
/*INSERIR DADOS EM UMA TABELA*/
INSERT INTO livro (id_usuario, id_autor, id_editora,
	id_categoria, titulo, sinopse, ano_publicacao)
VALUES (1, 1, 1, 1, "Livro Teste", "", 2026);

/*CADASTRA USUARIO, AUTOR, EDITORA E CATEGORIA*/

INSERT INTO usuario (nome, email, senha)
VALUES ("Teste_nome", "Testeemail0@hotmail.com", "Teste_senha");

INSERT INTO categoria (nome, descricao)
VALUES ("Teste_nome","Teste_descricao");

INSERT INTO autor (nome, ano_nascimento, ano_morte, apresentacao)
VALUES ("Teste_nome","1926","1998","");

INSERT INTO editora (nome, cidade, estado, pais)
VALUES ("Teste_nome","Teste_cidade","Teste_estado","Teste_pais");

SELECT * FROM livro;
SELECT * FROM usuario;
SELECT * FROM categoria;
SELECT * FROM autor;
SELECT * FROM editora;