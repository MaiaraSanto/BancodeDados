CREATE DATABASE TarefaMySQL; 
USE TarefaMySQL;

Create table ALUNO(
cod_aluno int auto_increment primary key not null,
nome_aluno varchar(50) not null,
end_rua_aluno varchar(50),
end_numero_aluno int not null,
end_complemento_aluno varchar(20),
end_bairro_aluno varchar(30) not null,
end_cidade_aluno varchar(30) not null,
end_UF_aluno varchar(2) not null,
end_CEP_aluno varchar(9),
telefone_aluno int not null,
cpf_aluno varchar(14) UNIQUE
);

ALTER TABLE ALUNO ADD foreign key(desc_curso) references curso(desc_curso); 

insert into ALUNO (cod_aluno, nome_aluno, end_rua_aluno, end_numero_aluno, 
end_complemento_aluno, end_bairro_aluno, end_cidade_aluno, end_UF_aluno, end_CEP_aluno, telefone_aluno, 
cpf_aluno, desc_curso) values ('1234', 'Amanda dos Santos', 'Rua Alexandre Dumas', 0, 'casa A', 'iririu', 
'Joinville', 'SC', '89227-017', '999295466', '123.456.789-00', 'matematica');
insert into ALUNO (cod_aluno, nome_aluno, end_rua_aluno, end_numero_aluno, 
end_complemento_aluno, end_bairro_aluno, end_cidade_aluno, end_UF_aluno, end_CEP_aluno, telefone_aluno, 
cpf_aluno) values ('2143', 'Ana Maria Silveira', 'Rua das Palmeiras', 54, '0', 'iririu', 'Joinville', 'SC', 
'89221-301', '998323345', '111.222.333-44', 'fisica');
insert into ALUNO (cod_aluno, nome_aluno, end_rua_aluno, end_numero_aluno, 
end_complemento_aluno, end_bairro_aluno, end_cidade_aluno, end_UF_aluno, end_CEP_aluno, telefone_aluno, 
cpf_aluno) values ('2222', 'Beatriz da Silva', 'Rua Sebastiao Jonck', 288, 'apt 402', 'aventureiro', 'Joinville', 
'SC', '89227-045', '34343240', '222.333.444-55', 'zootecnia');

select * from ALUNO;

CREATE table RESPONSAVEL(
cod_responsavel int auto_increment primary key not null,
nome_responsavel varchar(50) not null,
email_responsavel varchar(50),
telefone_responsavel int not null,
cpf_responsavel varchar(14) UNIQUE
);

ALTER TABLE RESPONSAVEL ADD foreign key(cod_aluno) references aluno(cod_aluno); 
ALTER TABLE RESPONSAVEL ADD foreign key(nome_aluno) references aluno(nome_aluno); 

insert into RESPONSAVEL (nome_responsavel, email_responsavel, telefone_responsavel,
cpf_responsavel, cod_aluno, nome_aluno) values ('Joaquim dos Santos', 
'joaquim.dos.santos@gmail.com', '34340033', '123.456.789-00', '1234', 'Amanda dos Santos');
insert into RESPONSAVEL (nome_responsavel, email_responsavel, telefone_responsavel,
cpf_responsavel, cod_aluno, nome_aluno) values ('Carlos Eduardo Silveira', 
'carloseduardo@hotmail.com', '34340142', '333.444.555-66', '2143', 'Ana Maria Silveira');
insert into RESPONSAVEL (nome_responsavel, email_responsavel, telefone_responsavel,
cpf_responsavel, cod_aluno, nome_aluno) values ('Denise da Silva', 
'denise.s@hotmail.com', '34343240', '444.555.666-77', '2222', 'Beatriz da Silva');

select * from RESPONSAVEL;

CREATE table FUNCIONARIO(
num_matricula_funcionario int auto_increment primary key not null,
nome_funcionario varchar(50) not null
);

ALTER TABLE FUNCIONARIO ADD foreign key(cod_departamento) references departamento(cod_departamento); 

insert into FUNCIONARIO (nome_funcionario, cod_departamento) values ('Emanoel Souza', '1');
insert into FUNCIONARIO (nome_funcionario, cod_departamento) values ('Rubia Schmitz', '2');
insert into FUNCIONARIO (nome_funcionario, cod_departamento) values ('Carolina Castro', '2');
insert into FUNCIONARIO (nome_funcionario, cod_departamento) values ('Lorena Rodrigues', '3');

select * from funcionario;

CREATE table DEPARTAMENTO(
cod_departamento int auto_increment primary key not null,
nome_departamento varchar(50) not null
);

insert into DEPARTAMENTO (cod_departamento, nome_departamento) values ('1', 'Ciencias Agrarias');
insert into DEPARTAMENTO (cod_departamento, nome_departamento) values ('2', 'Ciencias Biologicas');
insert into DEPARTAMENTO (cod_departamento, nome_departamento) values ('3', 'Ciencias Exatas');

select * from departamento;

CREATE table CURSO(
cod_curso int auto_increment primary key not null,
desc_curso varchar(50) not null
);

ALTER TABLE CURSO ADD foreign key(cod_departamento) references departamento(cod_departamento); 

insert into CURSO (cod_curso, desc_curso, cod_departamento) values ('11', 'zootecnia', '1');
insert into CURSO (cod_curso, desc_curso, cod_departamento) values ('12', 'engenharia florestal', '1');
insert into CURSO (cod_curso, desc_curso, cod_departamento) values ('21', 'botanica', '2');
insert into CURSO (cod_curso, desc_curso, cod_departamento) values ('22', 'farmacologia', '2');
insert into CURSO (cod_curso, desc_curso, cod_departamento) values ('31', 'fisica', '3');
insert into CURSO (cod_curso, desc_curso, cod_departamento) values ('32', 'matematica', '3');

select * from curso;

CREATE table TURMA(
cod_turma int auto_increment primary key not null,
ano_turma varchar(6) not null,
horarios_turma datetime not null
);

ALTER TABLE TURMA ADD foreign key(nome_professor) references professor(nome_professor);

insert into TURMA (ano_turma, horarios_turma, nome_professor) 
values (2019.1, 2022-02-02, 'Luis Azevedo');
insert into TURMA (ano_turma, horarios_turma, nome_professor) 
values (2020.2, 2022-03-02, 'Bianca Valentim');

select * from turma;

CREATE table HISTORICO(
cod_historico int auto_increment primary key not null,
nota1 decimal(10,2),
nota2 decimal(10,2),
notaProvaFinal decimal(10,2),
frequencia varchar(6) not null,
aprovacao char not null CHECK (aprovacao = 'A' or aprovacao = 'R')
);

ALTER TABLE HISTORICO ADD foreign key(nome_aluno) references aluno(nome_aluno);
ALTER TABLE HISTORICO ADD foreign key(cod_disciplina) references disciplina(cod_disciplina);

insert into HISTORICO (nota1, nota2, notaProvaFinal, frequencia, aprovacao, nome_aluno, 
cod_disciplina) values (7.2, 8.1, 9.0, 100, 'A', 'Amanda dos Santos', '1'); 
insert into HISTORICO (nota1, nota2, notaProvaFinal, frequencia, aprovacao, nome_aluno, 
cod_disciplina) values (6.3, 4.2, 3.0, 75, 'R', 'Beatriz da Silva', '2'); 

select * from historico;

CREATE table PROFESSOR(
cod_professor int auto_increment primary key not null,
nome_professor varchar(50) not null,
end_rua_professor varchar(50),
end_numero_professor int not null,
end_complemento_professor varchar(20),
end_bairro_professor varchar(30) not null,
end_cidade_professor varchar(30) not null,
end_UF_professor varchar(2) not null,
end_CEP_professor varchar(9),
telefone_professor int not null,
cpf_professor varchar(14) UNIQUE
);

insert into PROFESSOR (nome_professor, end_rua_professor, end_numero_professor, 
end_complemento_professor, end_bairro_professor, end_cidade_professor, end_UF_professor, 
end_CEP_professor, telefone_professor, cpf_professor) values ('Luis Azevedo', 'Rua dos Alfeneiros', 
'4', 0, 'jardim paraiso', 'Joinville', 'SC', '89226-514', '998867885', '107.284.210-89');
insert into PROFESSOR (nome_professor, end_rua_professor, end_numero_professor, 
end_complemento_professor, end_bairro_professor, end_cidade_professor, end_UF_professor, 
end_CEP_professor, telefone_professor, cpf_professor) values ('Bianca Valentim', 'Rua Andromeda', 
'51', 'casa amarela', 'vila nova', 'Joinville', 'SC', '89226-582', '988004567', '105.777.88-99');

select * from professor;

CREATE table DISCIPLINA(
cod_disciplina int auto_increment primary key not null,
desc_disciplina varchar(50) not null,
cargaHoraria int not null,
ementa_disciplina varchar(250) not null,
bibliografia_disciplina varchar(250) not null
);

ALTER TABLE DISCIPLINA ADD foreign key(cod_curso) references curso(cod_curso);

insert into DISCIPLINA (cod_disciplina, desc_disciplina, cargaHoraria, ementa_disciplina,
bibliografia_disciplina) values ('1', 'calculo 1', '360', 'integral, derivada, limites', 'SPIVAK M. Calculus');
insert into DISCIPLINA (cod_disciplina, desc_disciplina, cargaHoraria, ementa_disciplina,
bibliografia_disciplina) values ('2', 'citologia', '90', 'celula, mitose, meiose', 'Alberts B 1997 The cell');

select * from disciplina;