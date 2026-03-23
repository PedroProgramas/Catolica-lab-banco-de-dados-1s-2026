CREATE DATABASE atividade3;
USE atividade3;

CREATE TABLE Usuario (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	email VARCHAR(255) UNIQUE,
    senha VARCHAR(255),
	data_cadastro TIMESTAMP,
    data_atualizacao TIMESTAMP
);

CREATE TABLE Autor (
	id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento YEAR,
    ano_morte YEAR,
    apresentacao TEXT,
    data_cadastro TIMESTAMP,
    data_atualizacao TIMESTAMP
);

CREATE TABLE Editora (
	id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    cidade VARCHAR(64),
    estado VARCHAR(64),
    pais VARCHAR(64),
    data_cadastro TIMESTAMP,
    data_atualizacao TIMESTAMP
);

CREATE TABLE Categoria (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    descricao TEXT,
    data_cadastro TIMESTAMP,
    data_atualizacao TIMESTAMP
);

CREATE TABLE Livro (
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_autor INT NOT NULL,
    id_editora INT NOT NULL,
    id_categoria INT NOT NULL,
    titulo VARCHAR(255),
    sinopse TEXT,
    ano_publicacao YEAR,
    lido BOOLEAN,
    data_cadastro TIMESTAMP,
    data_atualizacao TIMESTAMP,
    
CONSTRAINT fk_livro_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario)
ON DELETE CASCADE,

CONSTRAINT fk_livro_autor
FOREIGN KEY (id_autor)
REFERENCES atividade2.autor(id_autor),

CONSTRAINT fk_livro_editora
FOREIGN KEY (id_editora)
REFERENCES atividade2.editora(id_editora),

CONSTRAINT fk_livro_categoria
FOREIGN KEY (id_categoria)
REFERENCES atividade2.categoria(id_categoria)
);