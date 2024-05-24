CREATE DATABASE atletica;
USE atletica;

CREATE TABLE membro(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
data_nascimento DATE,
email VARCHAR(70),
endereco VARCHAR(100),
telefone INT
);

CREATE TABLE evento(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) ,
data_evento DATE,
local_ VARCHAR(50)
);

CREATE TABLE Time_(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
esporte VARCHAR(50)
);

CREATE TABLE produto(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
preco DOUBLE
);

CREATE TABLE tecnico(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
modalidade VARCHAR(50),
email VARCHAR(80),
telefone INT
);

CREATE TABLE venda(
id INT PRIMARY KEY AUTO_INCREMENT,
id_membro INT,
id_produto INT,
data_venda DATE,
FOREIGN KEY (id_membro) REFERENCES membro(id),
FOREIGN KEY (id_produto) REFERENCES produto(id)
);

CREATE TABLE inscricao(
id INT PRIMARY KEY AUTO_INCREMENT,
id_membro INT,
id_evento INT,
data_inscricao DATE,
FOREIGN KEY (id_membro) REFERENCES membro(id),
FOREIGN KEY (id_evento) REFERENCES evento(id)
);

CREATE TABLE associacao_tecnica(
id_time INT,
id_tecnico INT,
FOREIGN KEY(id_time) REFERENCES time_(id),
FOREIGN KEY(id_tecnico) REFERENCES tecnico(id),
PRIMARY KEY (id_time, id_tecnico)
);

CREATE TABLE jogador(
id_time INT,
id_membro INT,
FOREIGN KEY (id_time) REFERENCES time_(id),
FOREIGN KEY (id_membro) REFERENCES membro(id),
PRIMARY KEY (id_membro, id_time)
);

#inserindo dados
INSERT INTO Membro (nome, data_nascimento, email, endereco, telefone) VALUES
('Alice', '1990-01-01', 'alice@example.com', 'Rua 1, Nº 100', 12345678),
('Bob', '1985-05-05', 'bob@example.com', 'Rua 2, Nº 200', 87654321),
('Charlie', '2000-10-10', 'charlie@example.com', 'Rua 3, Nº 300', 11223344);

INSERT INTO Evento (nome, data_evento, local_) VALUES
('Torneio de Futebol', '2024-06-01', 'Estádio Municipal'),
('Campeonato de Natação', '2024-07-15', 'Piscina Olímpica'),
('Competição de Basquete', '2024-08-20', 'Ginásio Central');

INSERT INTO Time_ (nome, esporte) VALUES
('Time A', 'Futebol'),
('Time B', 'Natação'),
('Time C', 'Basquete');

INSERT INTO Produto (nome, preco) VALUES
('Camiseta', 50.00),
('Boné', 25.00),
('Garrafa', 15.00);

INSERT INTO Tecnico (nome, modalidade, email, telefone) VALUES
('Carlos', 'Futebol', 'carlos@esporte.com', 99887766),
('Daniela', 'Natação', 'daniela@esporte.com', 88776655),
('Eduardo', 'Basquete', 'eduardo@esporte.com', 77665544);

INSERT INTO Venda (id_membro, id_produto, data_venda) VALUES
(1, 1, '2024-05-01'),
(2, 2, '2024-05-02'),
(3, 3, '2024-05-03');

INSERT INTO Inscricao (id_membro, id_evento, data_inscricao) VALUES
(1, 1, '2024-04-01'),
(2, 2, '2024-04-02'),
(3, 3, '2024-04-03');

INSERT INTO Associacao_Tecnica (id_time, id_tecnico) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Jogador (id_time, id_membro) VALUES
(1, 1),
(2, 2),
(3, 3);
#alterando coluna
ALTER TABLE Produto ADD COLUMN descricao VARCHAR(100) DEFAULT 'Sem descrição';
#atualizando
UPDATE Membro SET endereco = 'Rua Nova, Nº 123' WHERE id = 1;
UPDATE Produto SET preco = 20.00 WHERE id = 3;
UPDATE Tecnico SET telefone = 11223344 WHERE nome = 'Carlos';
#deletando registros
DELETE FROM Inscricao WHERE id_evento = 1;
DELETE FROM Venda WHERE id_produto = 1;
#fazendo pesquisas
SELECT * FROM Membro WHERE endereco = 'Rua Nova, Nº 123';
SELECT * FROM Evento WHERE data_evento > '2024-07-01';
SELECT * FROM Produto WHERE preco < 30.00;
SELECT * FROM Time_ WHERE esporte = 'Futebol';
SELECT * FROM tecnico WHERE modalidade = 'Futebol';
SELECT * FROM jogador WHERE id_membro = 1;
SELECT * FROM associacao_tecnica WHERE id_time = 1;
SELECT * FROM inscricao WHERE id = 3;
SELECT * FROM venda WHERE id = 2;
