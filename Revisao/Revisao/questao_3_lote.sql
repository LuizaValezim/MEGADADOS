DROP DATABASE IF EXISTS agro;
CREATE DATABASE agro;
USE agro;

DROP TABLE IF EXISTS lote;
DROP TABLE IF EXISTS fazenda;
DROP TABLE IF EXISTS inseticida;
DROP TABLE IF EXISTS plantacao;
DROP TABLE IF EXISTS plantacao_inseticida;

CREATE TABLE fazenda(
	id_fazenda INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    PRIMARY KEY(id_fazenda)
);

CREATE TABLE inseticida(
	id_inseticida INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    preco DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY(id_inseticida)
);

CREATE TABLE plantacao(
	id_plantacao INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    PRIMARY KEY(id_plantacao)
);

CREATE TABLE plantacao_inseticida(
	id_plantacao INT,
    id_inseticida INT,
    frequencia INT NOT NULL,
    PRIMARY KEY(id_plantacao, id_inseticida)
);

ALTER TABLE plantacao_inseticida
	ADD CONSTRAINT fk_plantacao
		FOREIGN KEY (id_plantacao)
			REFERENCES plantacao(id_plantacao);
        
ALTER TABLE plantacao_inseticida
	ADD CONSTRAINT fk_inseticida
		FOREIGN KEY (id_inseticida)
			REFERENCES inseticida(id_inseticida);

CREATE TABLE lote(
	id_lote INT AUTO_INCREMENT,
    id_fazenda INT NOT NULL,
    id_plantacao INT,
    id_inseticida INT,
    area FLOAT NOT NULL,
    PRIMARY KEY(id_lote)
);

ALTER TABLE lote
	ADD CONSTRAINT fk_fazenda_lote
		FOREIGN KEY (id_fazenda)
			REFERENCES Fazenda(id_fazenda);

ALTER TABLE lote
	ADD CONSTRAINT fk_plantacao_lote
		FOREIGN KEY (id_plantacao)
			REFERENCES Plantacao(id_plantacao);
        
ALTER TABLE lote
	ADD CONSTRAINT fk_inseticida_lote
		FOREIGN KEY (id_inseticida)
			REFERENCES Inseticida(id_inseticida);
        
INSERT INTO plantacao (id_plantacao, nome) VALUES
	(1, "milho"),
    (2, "soja"),
    (3, "cafe"),
    (4, "algodao");
    
INSERT INTO inseticida (id_inseticida, nome, preco) VALUES
	(1, "Mata-Tudo", 200),
    (2, "Mae-Terra", 500),
    (3, "Carinho", 700);
    
INSERT INTO fazenda (id_fazenda, nome) VALUES
	(1, "Terra Forte"),
    (2, "Agua Brava");
    
INSERT INTO plantacao_inseticida (id_plantacao, id_inseticida, frequencia) VALUES
	(1, 1, 2),
    (1, 2, 1),
    (2, 2, 1),
    (2, 3, 1),
    (3, 1, 4),
    (3, 3, 1);
    
INSERT INTO lote (id_lote, id_fazenda, id_plantacao, id_inseticida, area) VALUES
	(1, 1, 2, 3, 100),
    (2, 1, 1, 2, 70),
    (3, 1, NULL, NULL, 80),
    (4, 2, 4, NULL, 90),
    (5, 2, 3, 3, 50),
    (6, 2, 2, 2, 30),
    (7, 2, 4, NULL, 110);


COMMIT;