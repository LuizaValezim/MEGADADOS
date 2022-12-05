USE empresa;

ALTER TABLE Funcionarios
	ADD COLUMN eh_gerente BOOLEAN NOT NULL DEFAULT False;
