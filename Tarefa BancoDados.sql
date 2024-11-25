CREATE DATABASE TarefaMySQL; 
USE TarefaMySQL;

CREATE TABLE Usuarios (
    id_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(15),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Lugares (
    id_lugar INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_usuario INTEGER NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    pais VARCHAR(100),
    preco_por_noite DECIMAL(10, 2) NOT NULL,
    max_hospedes INTEGER NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Hospedagens (
    id_hospedagem INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_usuario INTEGER NOT NULL,
    id_lugar INTEGER NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    preco_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_lugar) REFERENCES Lugares(id_lugar)
);

CREATE TABLE Avaliacoes (
    id_avaliacao INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_usuario INTEGER NOT NULL,
    id_hospedagem INTEGER NOT NULL,
    nota DECIMAL(2, 1) CHECK (nota >= 0 AND nota <= 5),
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_hospedagem) REFERENCES Hospedagens(id_hospedagem)
);

