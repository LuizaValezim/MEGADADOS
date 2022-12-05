USE emprestimos;

START TRANSACTION;

SELECT * FROM usuario;

UPDATE usuario SET saldo = 10000 WHERE id_usuario = 1;
UPDATE usuario SET saldo = 10 WHERE id_usuario = 2;
UPDATE usuario SET saldo = 5 WHERE id_usuario = 3;
SELECT * FROM usuario;

CALL cobra_taxa(100);
SELECT * FROM usuario;

ROLLBACK;

SELECT * FROM usuario;
