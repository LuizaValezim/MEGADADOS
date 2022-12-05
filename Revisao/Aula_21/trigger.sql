USE emprestimos;

DROP TRIGGER IF EXISTS trig_movimentacao;
DROP TRIGGER IF EXISTS trig_saldo_insuficiente;

DELIMITER //
CREATE TRIGGER trig_movimentacao 
BEFORE INSERT ON movimentacao
FOR EACH ROW
BEGIN
	UPDATE usuario 
		SET saldo = saldo + NEW.valor 
        WHERE id_usuario = NEW.id_usuario;
END//

DELIMITER ;

COMMIT;