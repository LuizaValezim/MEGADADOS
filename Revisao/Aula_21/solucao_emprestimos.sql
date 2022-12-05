USE emprestimos;

DROP TRIGGER IF EXISTS trig_operacao;

DELIMITER //
CREATE TRIGGER trig_operacao
BEFORE INSERT ON operacao
FOR EACH ROW
BEGIN
	UPDATE emprestimo 
		SET valor_atual = valor_atual + NEW.valor 
        WHERE id_emprestimo = NEW.id_emprestimo;
	SELECT id_credor INTO @id_credor
		FROM emprestimo 
		WHERE id_emprestimo = NEW.id_emprestimo;
	SELECT id_devedor INTO @id_devedor
		FROM emprestimo 
		WHERE id_emprestimo = NEW.id_emprestimo;
	INSERT INTO movimentacao (id_usuario, valor) VALUES (@id_credor, -NEW.valor);
	INSERT INTO movimentacao (id_usuario, valor) VALUES (@id_devedor, NEW.valor);
END //

DELIMITER ;