CREATE DATABASE TarefaMySQL; 
USE TarefaMySQL;

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE,
    cidade VARCHAR(50)
);

INSERT INTO clientes (nome, email, data_nascimento, cidade) VALUES ('Ana Costa', 'ana.costa@email.com', '1990-08-15', 'São Paulo');

SELECT * FROM clientes;

SELECT nome, email FROM clientes WHERE cidade = 'São Paulo';

UPDATE clientes 
SET cidade = 'Rio de Janeiro' 
WHERE id_cliente = 1;

UPDATE clientes 
SET email = 'ana.nova@email.com', cidade = 'Curitiba' 
WHERE nome = 'Ana Costa';

DELETE FROM clientes WHERE id_cliente = 1;
