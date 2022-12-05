USE empresa;

ALTER TABLE Funcionarios
	ADD COLUMN RG_mentor INT,
    ADD COLUMN orgao_mentor VARCHAR(45);

ALTER TABLE Funcionarios
	ADD CONSTRAINT fk_Mentor
		FOREIGN KEY (RG_mentor, orgao_mentor)
		REFERENCES Funcionarios (RG, orgao);
