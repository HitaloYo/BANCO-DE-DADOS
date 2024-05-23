CREATE DATABASE atletica;
USE atletica;

CREATE TABLE membro(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
data_nascimento DATE,
email VARCHAR(70),
endereco VARCHAR(100),
telefone INT NOT NULL
);

CREATE TABLE evento(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
data_evento DATE NOT NULL,
local_ VARCHAR(50) NOT NULL
);

CREATE TABLE time_(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
esporte VARCHAR(50) NOT NULL
);

CREATE TABLE produto(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
preco DOUBLE NOT NULL
);

CREATE TABLE tecnico(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
modalidade VARCHAR(50),
email VARCHAR(80),
telefone INT NOT NULL
);

CREATE TABLE venda(
id INT PRIMARY KEY AUTO_INCREMENT,
id_membro INT,
id_produto INT,
data_venda DATE NOT NULL,
FOREIGN KEY (id_membro) REFERENCES membro(id),
FOREIGN KEY (id_produto) REFERENCES produto(id)
);

CREATE TABLE inscricao(
id INT PRIMARY KEY AUTO_INCREMENT,
id_membro INT,
id_evento INT,
data_inscricao DATE NOT NULL,
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