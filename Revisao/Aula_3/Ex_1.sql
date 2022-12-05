DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;

USE empresa;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Departamento;

CREATE TABLE Funcionario(
	RG INT NOT NULL,
    orgao VARCHAR(45) NOT NULL,
    salario DECIMAL(10,2),
    telefone VARCHAR(30),
    idDepartamento INT NOT NULL,
    PRIMARY KEY (RG, orgao)
);

CREATE TABLE Departamento(
	idDepartamento INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY(idDepartamento)
);

ALTER TABLE Funcionario
	ADD  FOREIGN KEY (idDepartamento)
		REFERENCES Departamento(idDepartamento);












