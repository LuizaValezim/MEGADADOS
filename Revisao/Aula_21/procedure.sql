USE emprestimos;

DROP PROCEDURE IF EXISTS adiciona_usuario;

DELIMITER //
CREATE PROCEDURE adiciona_usuario(IN novo_nome VARCHAR(80), IN novo_sobrenome VARCHAR(80))
BEGIN
    INSERT INTO usuario (nome, sobrenome) VALUES (novo_nome, novo_sobrenome);
END//
DELIMITER ;

COMMIT;
