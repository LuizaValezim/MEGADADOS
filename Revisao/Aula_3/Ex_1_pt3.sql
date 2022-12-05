USE empresa;

ALTER TABLE Funcionario
	ADD COLUMN (
		RG_mentor INT NOT NULL,
		orgao_mentor VARCHAR(45) NOT NULL
 );
 
 ALTER TABLE Funcionario
	ADD FOREIGN KEY (RG_mentor,orgao_mentor)
		REFERENCES Funcionario(RG, orgao);
