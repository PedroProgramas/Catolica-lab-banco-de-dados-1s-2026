USE atividade1;

ALTER TABLE Livro
DROP COLUMN autor,
DROP COLUMN editora,
DROP COLUMN categoria;

ALTER TABLE Livro
ADD COLUMN id_usuario INT NOT NULL,
ADD COLUMN id_autor INT NOT NULL,
ADD COLUMN id_editora INT NOT NULL,
ADD COLUMN id_categoria INT NOT NULL,
ADD COLUMN data_cadastro TIMESTAMP,
ADD COLUMN data_atualizacao TIMESTAMP;

ALTER TABLE Livro
ADD CONSTRAINT fk_livro_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario)
ON DELETE CASCADE,

ADD CONSTRAINT fk_livro_autor
FOREIGN KEY (id_autor)
REFERENCES atividade2.autor(id_autor),

ADD CONSTRAINT fk_livro_editora
FOREIGN KEY (id_editora)
REFERENCES atividade2.editora(id_editora),

ADD CONSTRAINT fk_livro_categoria
FOREIGN KEY (id_categoria)
REFERENCES atividade2.categoria(id_categoria);