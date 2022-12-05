USE empresa;

DROP TABLE IF EXISTS Funcionario_has_Departamentos;
CREATE TABLE Funcionario_has_Departamentos(
	-- eh_gerente BOOLEAN NOT NULL DEFAULT False
	eh_gerente TINYINT NOT NULL,
	RG_funcionario INT NOT NULL,
	orgao_funcionario VARCHAR(45) NOT NULL,
	idDepartamento INT NOT NULL,
    PRIMARY KEY(RG_funcionario, orgao_funcionario, idDepartamento)
);

 ALTER TABLE Funcionario_has_Departamentos
	ADD FOREIGN KEY (RG_funcionario,orgao_funcionario)
		REFERENCES Funcionario(RG, orgao);

 ALTER TABLE Funcionario_has_Departamentos
	ADD FOREIGN KEY (idDepartamento)
		REFERENCES Departamento(idDepartamento);        
        
        
                
