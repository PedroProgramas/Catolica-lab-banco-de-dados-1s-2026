USE biblioteca_pessoal_1S2026;

CREATE TABLE Usuario (
		id_usuario INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        email VARCHAR(128) NOT NULL UNIQUE,
        data_cadastro DATE DEFAULT(current_date) NOT NULL
);