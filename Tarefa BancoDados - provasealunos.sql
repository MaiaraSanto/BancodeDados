CREATE DATABASE TarefaMySQL; 
USE TarefaMySQL;

CREATE TABLE aluno (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE professor (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE materia (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_professor INTEGER,
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

CREATE TABLE provas (
    id_aluno INTEGER,
    id_materia INTEGER,
    nota FLOAT,
    data_da_prova DATE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_materia) REFERENCES materia(id)
);

INSERT INTO aluno (nome, data_nascimento) VALUES
('João Silva', '2010-03-15'),
('Maria Oliveira', '2011-07-22'),
('Pedro Santos', '2010-11-05');

INSERT INTO professor (nome, data_nascimento) VALUES
('Carlos Mendes', '1980-05-12');

INSERT INTO materia (nome, id_professor) VALUES
('Matemática', 1);  -- 1 é o ID do professor Carlos Mendes

INSERT INTO provas (id_aluno, id_materia, nota, data_da_prova) VALUES
(1, 1, 8.5, '2024-11-01'),  -- João Silva
(2, 1, 9.0, '2024-11-01'),  -- Maria Oliveira
(3, 1, 7.5, '2024-11-01');  -- Pedro Santos

SELECT 
    aluno.nome AS Nome_Aluno,
    materia.nome AS Materia,
    provas.nota AS Nota,
    provas.data_da_prova AS Data_Prova
FROM 
    provas
JOIN 
    aluno ON provas.id_aluno = aluno.id
JOIN 
    materia ON provas.id_materia = materia.id;

