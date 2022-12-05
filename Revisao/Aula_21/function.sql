USE emprestimos;

DROP FUNCTION IF EXISTS saldo;

DELIMITER //
CREATE FUNCTION saldo(id INT) RETURNS DECIMAL(30, 2) READS SQL DATA
BEGIN
	DECLARE saldo_procurado DECIMAL(30, 2);
	SELECT IFNULL(saldo, 0.0) INTO saldo_procurado FROM usuario WHERE id_usuario = id;
    RETURN saldo_procurado;
END//
DELIMITER ;

COMMIT;
