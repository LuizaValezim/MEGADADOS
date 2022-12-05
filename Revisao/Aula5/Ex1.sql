DROP DATABASE IF EXISTS torneio;
CREATE DATABASE torneio;

USE torneio;

DROP TABLE IF EXISTS Equipes;
DROP TABLE IF EXISTS Jogadores;

CREATE TABLE Equipes(
	nome VARCHAR(30) NOT NULL,
    grito VARCHAR(80) NOT NULL,
    PRIMARY KEY(nome)
);

CREATE TABLE Jogadores(
	id INT NOT NULL,
    nome_equipe VARCHAR(30) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    preferencia INT NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE Jogadores
	ADD CONSTRAINT fk_equipe
		FOREIGN KEY (nome_equipe)
			REFERENCES Equipes(nome);

