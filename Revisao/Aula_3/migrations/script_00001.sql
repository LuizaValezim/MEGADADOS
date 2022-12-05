USE empresa;

DROP TABLE IF EXISTS Funcionarios;
DROP TABLE IF EXISTS Departamentos;

CREATE TABLE Funcionarios (
	RG INT NOT NULL,
    orgao VARCHAR(45) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL DEFAULT 0.0,
    telefone VARCHAR(45),
    dep_id INT NOT NULL,
    PRIMARY KEY (RG, orgao)
);

CREATE TABLE Departamentos (
	dep_id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL
);

ALTER TABLE Funcionarios
	ADD CONSTRAINT fk_Funcionarios_Departamentos
		FOREIGN KEY (dep_id)
        REFERENCES Departamentos (dep_id);
