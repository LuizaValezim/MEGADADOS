USE emprestimos;

CREATE VIEW nomes AS 
	SELECT DISTINCT nome, sobrenome FROM usuario;
