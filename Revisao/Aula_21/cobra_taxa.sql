USE emprestimos;

DROP PROCEDURE IF EXISTS cobra_taxa;

#cobrar uma taxa de manutenção de D dinheiros de cada conta, desde que a conta tenha saldo.

DELIMITER //
CREATE PROCEDURE cobra_taxa(IN taxa DECIMAL(30,2), IN id_usuario_procurado INT)
BEGIN
    DECLARE taxa_cobrada DECIMAL(30,2);
    SELECT IF(saldo(id_usuario_procurado)>0.0, taxa, 0.0) INTO taxa_cobrada;
    UPDATE usuario SET saldo = saldo - taxa WHERE id_usuario = id_usuario_procurado;
END//
DELIMITER ;


CALL cobra_taxa(200.00, 3);
CALL cobra_taxa(100.00, 4);
