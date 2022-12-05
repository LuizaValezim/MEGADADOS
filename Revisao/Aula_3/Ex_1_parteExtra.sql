-- como copiar info de uma tabela para outra

INSERT INTO Funcionario_has_Departamentos(idDepartamento, RG_funcionario, orgao_funcionario) 
	SELECT idDepartamento, RG, orgao FROM Funcionarios WHERE eh_gerente = True;
    
	ALTER TABLE Funcionarios
		DROP COLUMN eh_gerente