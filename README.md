# Este Projeto contem todos os arquivos do Módulo Banco de Dados como: Organização para Banco de Dados; Tabelas em Query; item de um CRUD e diferença entre NoSQL e SQL;

# BancodeDados

📦 Projeto de Banco de Dados para uma Plataforma de Hospedagem (Estilo Airbnb)

Este projeto documenta a estrutura de um banco de dados para uma plataforma de hospedagem, onde os usuários podem cadastrar lugares, realizar reservas e avaliar hospedagens. Abaixo estão os detalhes de cada tabela, seus relacionamentos e a justificativa para a organização dos dados escolhida.

## 📑 Estrutura Geral do Banco de Dados
O banco de dados é composto por quatro tabelas principais:

1. Usuários (Usuarios)
2. Lugares (Lugares)
3. Hospedagens (Hospedagens)
4. Avaliações (Avaliacoes)

Abaixo, cada tabela será detalhada com suas colunas e explicação dos relacionamentos.

🔹 Tabela: Usuarios
Esta tabela armazena os dados dos usuários que utilizam a plataforma, tanto anfitriões (usuários que cadastram lugares) quanto hóspedes (usuários que reservam lugares).

- Colunas:

- id_usuario (PK) - INTEGER: Identificador único do usuário.
- nome - VARCHAR(100): Nome completo do usuário.
- email - VARCHAR(100): E-mail do usuário, único na plataforma.
- senha - VARCHAR(255): Senha criptografada do usuário.
- data_nascimento - DATE: Data de nascimento do usuário.
- telefone - VARCHAR(15): Número de telefone do usuário.
- data_criacao - TIMESTAMP: Data e hora de criação da conta.

````
CREATE TABLE Usuarios (
    id_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(15),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
````
- Justificativa: Esta tabela é essencial para armazenar os dados pessoais e de autenticação dos usuários, diferenciando-os pelos IDs únicos. Dados como e-mail e senha permitem o login, enquanto telefone e nome facilitam o contato entre anfitrião e hóspede.

🔹 Tabela: Lugares
Esta tabela armazena os locais cadastrados pelos usuários para hospedagem, permitindo a inserção de informações como endereço, tipo de hospedagem e preço por noite.

- Colunas:

- id_lugar (PK) - INTEGER: Identificador único do lugar.
- id_usuario (FK) - INTEGER: Identificador do usuário que cadastrou o lugar.
- titulo - VARCHAR(150): Título descritivo do lugar.
- descricao - TEXT: Descrição detalhada do lugar.
- endereco - VARCHAR(255): Endereço completo do lugar.
- cidade - VARCHAR(100): Cidade onde o lugar está localizado.
- estado - VARCHAR(100): Estado onde o lugar está localizado.
- pais - VARCHAR(100): País onde o lugar está localizado.
- preco_por_noite - DECIMAL(10, 2): Valor da diária para o local.
- max_hospedes - INTEGER: Capacidade máxima de hóspedes.
- data_cadastro - TIMESTAMP: Data e hora de cadastro do lugar.
````
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
````
- Relacionamento:
id_usuario é uma chave estrangeira que referencia id_usuario na tabela Usuarios, indicando quem é o proprietário do lugar.

- Justificativa: A tabela Lugares permite que os usuários cadastrem locais de hospedagem com informações completas para facilitar a busca por hóspedes. O relacionamento com Usuarios define que cada lugar pertence a um usuário.

🔹 Tabela: Hospedagens
Esta tabela registra as hospedagens, ou seja, os períodos em que um usuário reserva um determinado lugar.

- Colunas:

- id_hospedagem (PK) - INTEGER: Identificador único da hospedagem.
- id_usuario (FK) - INTEGER: Identificador do usuário que realizou a reserva.
- id_lugar (FK) - INTEGER: Identificador do lugar reservado.
- data_inicio - DATE: Data de início da hospedagem.
- data_fim - DATE: Data de término da hospedagem.
- preco_total - DECIMAL(10, 2): Valor total da hospedagem, calculado com base nas diárias.

````
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
````
- Relacionamento:
id_usuario referencia a tabela Usuarios, indicando o hóspede.
id_lugar referencia a tabela Lugares, indicando o local reservado.

- Justificativa: A tabela Hospedagens permite o controle das reservas realizadas por usuários em lugares cadastrados. Ela facilita o cálculo de receitas e ajuda a manter a integridade dos dados, evitando reservas sobrepostas.

🔹 Tabela: Avaliacoes
Esta tabela armazena as avaliações feitas pelos usuários nas hospedagens, permitindo o registro de comentários e pontuações.

- Colunas:

- id_avaliacao (PK) - INTEGER: Identificador único da avaliação.
- id_usuario (FK) - INTEGER: Identificador do usuário que fez a avaliação.
- id_hospedagem (FK) - INTEGER: Identificador da hospedagem avaliada.
- nota - DECIMAL(2, 1): Nota dada pelo usuário (ex: 4.5).
- comentario - TEXT: Comentário do usuário sobre a hospedagem.
- data_avaliacao - TIMESTAMP: Data e hora da avaliação.

````
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
````
- Relacionamento:
id_usuario referencia a tabela Usuarios, indicando o autor da avaliação.
id_hospedagem referencia a tabela Hospedagens, especificando a hospedagem avaliada.

- Justificativa: A tabela Avaliacoes permite aos usuários avaliarem as hospedagens, fornecendo um sistema de feedback que ajuda outros usuários a escolherem melhores locais para se hospedar. Relacionar as avaliações diretamente com Hospedagens e Usuarios garante que o sistema de avaliação seja preciso e confiável.

📈 Diagrama de Relacionamentos

````
Usuarios --< Lugares
Usuarios --< Hospedagens
Usuarios --< Avaliacoes
Lugares --< Hospedagens
Hospedagens --< Avaliacoes
````
🎯 Justificativa dos Relacionamentos

A estrutura foi pensada para garantir a integridade dos dados e facilitar a consulta das principais operações realizadas na plataforma. Cada relacionamento é destinado a:

- Usuarios ↔ Lugares: Relacionamento um-para-muitos (1
), pois um usuário pode cadastrar vários lugares, mas cada lugar pertence a apenas um usuário.
- Usuarios ↔ Hospedagens: Relacionamento um-para-muitos (1
), pois um usuário pode realizar várias hospedagens, mas cada hospedagem pertence a apenas um hóspede.
- Usuarios ↔ Avaliacoes: Relacionamento um-para-muitos (1
), pois um usuário pode fazer várias avaliações, mas cada avaliação pertence a apenas um usuário.
- Lugares ↔ Hospedagens: Relacionamento um-para-muitos (1
), pois um lugar pode ter várias hospedagens, mas cada hospedagem é para apenas um lugar específico.
- Hospedagens ↔ Avaliacoes: Relacionamento um-para-muitos (1
), pois cada hospedagem pode ter várias avaliações, mas cada avaliação refere-se a uma hospedagem específica.

🗃️ Observações e Melhorias Futuras
Para escalabilidade e funcionalidades futuras, algumas melhorias podem incluir:

- Histórico de preços nos lugares, para rastrear mudanças nas diárias.
- Sistema de mensagens para comunicação direta entre anfitrião e hóspede.
- Tabela de Favoritos para que usuários possam salvar lugares de interesse.

🚀 Execução e Desenvolvimento

1. Passo 1: Criar o banco de dados e as tabelas utilizando SQL.
2. Passo 2: Implementar os relacionamentos utilizando chaves estrangeiras.
3. Passo 3: Testar as funcionalidades principais, como cadastro de lugares, reservas e avaliações.
4. Passo 4: Validar a integridade e consistência dos dados, principalmente nas tabelas com chaves estrangeiras.
