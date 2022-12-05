USE empresa;

DROP TABLE IF EXISTS Dependente;
CREATE TABLE Dependente(
	RG INT NOT NULL,
    orgao VARCHAR(45) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    RGFuncionario INT NOT NULL,
    orgaoFuncionario VARCHAR(45) NOT NULL,
	PRIMARY KEY (RG, orgao)
);

-- ADD CONSTRAINT fk_Dependentes_Fucnionarios
-- 	FOREIGN KEY (RGFuncionario, orgaoFuncionario) REFERENCES Funcionario(RG, orgao);

ALTER TABLE Dependente
	ADD  FOREIGN KEY (RGFuncionario, orgaoFuncionario)
		REFERENCES Funcionario(RG, orgao);
