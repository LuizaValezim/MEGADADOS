USE empresa;

DROP TABLE IF EXISTS Dependentes;

CREATE TABLE Dependentes (
	RG INT NOT NULL,
    orgao VARCHAR(45) NOT NULL,
    nome VARCHAR(80) NOT NULL,
	RG_funcionario INT NOT NULL,
    orgao_funcionario VARCHAR(45) NOT NULL,
    PRIMARY KEY (RG, orgao)
);

ALTER TABLE Dependentes
	ADD CONSTRAINT fk_Dependentes_Funcionarios
		FOREIGN KEY (RG_funcionario, orgao_funcionario)
        REFERENCES Funcionarios (RG, orgao);
