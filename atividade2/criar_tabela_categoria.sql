USE atividade2;

CREATE TABLE Categoria (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    descricao TEXT,
    data_cadastro TIMESTAMP,
    data_atualizacao TIMESTAMP
);