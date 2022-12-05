USE empresa;

DROP TABLE IF EXISTS Gerentes;

CREATE TABLE Gerentes (
	dep_id INT NOT NULL,
	RG INT NOT NULL,
    orgao VARCHAR(45) NOT NULL,
    PRIMARY KEY (dep_id, RG, orgao)
);

ALTER TABLE Gerentes
	ADD CONSTRAINT fk_Gerentes_Departamentos
		FOREIGN KEY (dep_id)
		REFERENCES Departamentos (dep_id);

ALTER TABLE Gerentes
	ADD CONSTRAINT fk_Gerentes_Funcionarios
		FOREIGN KEY (RG, orgao)
        REFERENCES Funcionarios (RG, orgao);

INSERT INTO Gerentes (dep_id, RG, orgao)
	SELECT dep_id, RG, orgao FROM Funcionarios WHERE eh_gerente = True;

ALTER TABLE Funcionarios
	DROP COLUMN eh_gerente;

	