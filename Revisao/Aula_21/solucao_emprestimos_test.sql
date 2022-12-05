USE emprestimos;

SELECT * FROM usuario;
SELECT * FROM emprestimo;
SELECT * FROM operacao;

START TRANSACTION;

INSERT INTO movimentacao (id_usuario, valor) VALUES(1, 50000);

INSERT INTO emprestimo (id_credor, id_devedor) VALUES (1, 2);
INSERT INTO operacao (id_emprestimo, valor) VALUES (LAST_INSERT_ID(), 2000);

SELECT * FROM usuario;
SELECT * FROM emprestimo;
SELECT * FROM operacao;

ROLLBACK;

SELECT * FROM usuario;
SELECT * FROM emprestimo;
SELECT * FROM operacao;
