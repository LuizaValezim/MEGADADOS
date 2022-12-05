USE emprestimos;

DROP VIEW IF EXISTS credor;
DROP VIEW IF EXISTS devedor;
DROP VIEW IF EXISTS valor_liquido;

CREATE VIEW credor AS
SELECT 
	id_usuario, SUM(IFNULL(valor_atual, 0.0)) as total
FROM 
	usuario 
    LEFT OUTER JOIN emprestimo ON usuario.id_usuario = emprestimo.id_credor
GROUP BY
	id_usuario;

CREATE VIEW devedor AS
SELECT 
	id_usuario, SUM(IFNULL(valor_atual, 0.0)) as total
FROM 
	usuario 
    LEFT OUTER JOIN emprestimo ON usuario.id_usuario = emprestimo.id_devedor
GROUP BY
	id_usuario;

CREATE VIEW valor_liquido AS
SELECT
	id_usuario, nome, sobrenome, saldo + credor.total - devedor.total AS valor
FROM
	usuario 
    INNER JOIN credor USING (id_usuario)
    INNER JOIN devedor USING (id_usuario);

SELECT * FROM credor;
SELECT * FROM devedor;
SELECT * FROM valor_liquido;
