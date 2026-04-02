/*BANCO DE DADOS NOVO PARA A AULA*/
CREATE DATABASE aula05;

/*SELECIONA UM BANCO DE DADOS ESPECÍFICO*/
USE aula05;

/*VISUALIZE AS TABELAS DE UM BANCO DE DADOS*/
SHOW TABLES;

/*INSERE DADOS NO BANCO DE DADOS*/
CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL UNIQUE,
    senha VARCHAR (255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento YEAR,
    ano_morte YEAR,
    apresentacao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE editora (
	id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    cidade VARCHAR(255),
    estado VARCHAR(255),
    pais VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categoria (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) UNIQUE,
    descricao TEXT NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE livro (
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_autor INT,
    id_editora INT,
    id_categoria INT,
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT,
    ano_publicacao YEAR,
    lido BOOLEAN DEFAULT(0),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
/*INSERE DADOS NO BANCO DE DADOS*/
INSERT INTO usuario (nome, email, senha)
	VALUES
		("João", "joao@email.com", "123"),
        ("Pedro", "pedro@email.com", "321"),
        ("Ednaldo Pereira", "Edpere@email.com", "645"),
        ("Cláudia Leite", "ClaudiaLeite@email.com", 322),
        ("Ana Pedrosa", "AnaPedro@email.com", 857);
        
INSERT INTO autor(nome, ano_nascimento, ano_morte, apresentacao)
	VALUES
		("George Orwell", 1903, 1950, "Eric Arthur Blair, mais conhecido pelo pseudónimo George Orwell, foi um escritor, ensaísta político inglês, nascido na Índia Britânica."),
        ("Fiodor Dostoiévski", 1921, 1981, "Fiódor Mikhailovitch Dostoiévski foi um escritor, filósofo e jornalista russo. É considerado por muitos um dos maiores romancistas e pensadores da história, bem como um dos maiores «psicólogos» que já existiu, ao considerar a designação e etimologia mais ampla do termo, como investigador da psique."),
        ("Chris Claremont", 1950, 0,"Chris Claremont é um roteirista, conhecido principalmente por sua fase de 16 anos escrevendo histórias dos X-Men. O estilo que Claremont concebeu para os X-Men se tornou referência para as histórias de equipes de super-heróis desde então. Claremont também tem por característica criar personagens femininos poderosos.");

INSERT INTO editora (nome, cidade, estado, pais)
	VALUES 
		("Companhia das Letras", "São Paulo", "SP", "Brasil"),
        ("Editora 34", "São Paulo", "SP", "Brasil"),
        ("Litteris Editora Ltda", "Rio de Janeiro", "RJ", "Brasil");
INSERT INTO categoria (nome, descricao)
	VALUES 
		("Não Fictício - História","Relatos históricos do mundo e seus registros."),
        ("Fictício - Ficção Científica", "Mundos imaginários com cenários futuros e tecnológicos."),
        ("Fictício - Suspense", "Enredos focados em mistérios, crimes e tensão.");
        
INSERT INTO livro (id_usuario, id_autor, id_editora,
	id_categoria, titulo, sinopse, ano_publicacao)
VALUES 
	(2, 1, 3, 1, "Política e a Língua Inglesa", "", 1946),
    (4, 3, 1, 2, "Dias de um Futuro Esquecido", "", 1981),
    (3, 2, 2, 3, "Os Irmãos Karamazov", "", 1980);
    
    SELECT * FROM usuario;
    SELECT * FROM autor;
	SELECT * FROM editora;
	SELECT * FROM categoria;
	SELECT * FROM livro;
    
/*REMOVE UM REGISTRO ESPECÍFICO*/
DELETE FROM categoria
WHERE id_categoria = 1;

SELECT * FROM categoria;

/*ATUALIZA UM REGISTRO ESPECÍFICO*/
UPDATE categoria
SET nome = "Filosofia"
WHERE id_categoria=2;

select * from livro;
UPDATE livro
SET sinopse = "Reflexões sobre a justa medida para a felicidade."
WHERE id_livro=8;

/*CONSULTA DADOS EM MÚLTIPLAS TABELAS*/
SELECT 
	t1.id_autor,
    t2.nome as autor,
	t1.titulo,
    t1.sinopse
FROM livro t1
LEFT JOIN autor t2 ON (t1.id_autor = t2.id_autor)
;
