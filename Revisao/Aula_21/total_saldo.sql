USE emprestimos;

DROP FUNCTION IF EXISTS total_saldo;

DELIMITER //
CREATE FUNCTION total_saldo() RETURNS DECIMAL(30, 2) READS SQL DATA
BEGIN
	DECLARE saldo_total DECIMAL(30, 2);
    SELECT 
		SUM(saldo) INTO saldo_total
    FROM
		usuario;
    RETURN saldo_total;
END//
DELIMITER ;

SELECT total_saldo();