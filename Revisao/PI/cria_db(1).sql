DROP DATABASE IF EXISTS figurino;
CREATE DATABASE figurino;
USE figurino;

CREATE TABLE Personagem (
    id_personagem INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_personagem)
);

CREATE TABLE Cena (
    id_cena INT NOT NULL,
    minuto_inicio INT NOT NULL,
    minuto_final INT NOT NULL,
    PRIMARY KEY (id_cena)
);

CREATE TABLE Roupa (
    id_roupa INT NOT NULL,
    descricao VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_roupa)
);

CREATE TABLE Figurino (
    id_roupa INT NOT NULL,
    id_cena INT NOT NULL,
    id_personagem INT NOT NULL,
    descricao VARCHAR(45) NULL,
    PRIMARY KEY (id_roupa , id_cena , id_personagem),
    CONSTRAINT fk_Figurino_Roupa FOREIGN KEY (id_roupa)
        REFERENCES Roupa (id_roupa),
    CONSTRAINT fk_Figurino_Cena FOREIGN KEY (id_cena)
        REFERENCES Cena (id_cena),
    CONSTRAINT fk_Figurino_Personagem FOREIGN KEY (id_personagem)
        REFERENCES Personagem (id_personagem)
);


INSERT INTO Cena (id_cena, minuto_inicio, minuto_final) VALUES
	(1, 1, 5),
    (2, 5, 12);


INSERT INTO Roupa(id_roupa, descricao) VALUES
	(1, "camisa laranja e calça preta jeans"),
	(2, "vestido azul escuro"),
    (3, "macacão listrado"),
    (4, "camiseta e shorts jeans vermelho"),
    (5, "vestido longo preto");
    
INSERT INTO Personagem (id_personagem, nome) VALUES
	(1, "Max"),
    (2, "Lando");
    
INSERT INTO Figurino (id_roupa, id_cena, id_personagem, descricao) VALUES
	(1, 1, 1, "Holanda, laranja mecanica"),
    (2, 1, 1, "Azul, um grande lago"),
    (3, 1, 1, "Listrado, como uma lagarta"),
    
	(1, 2, 1, "Continuacao da Holanda"),
	(2, 2, 1, "Azul, mas agora triste"),
    (3, 2, 1, "Listrado, mas virou borboleta"),
    (4, 2, 1, "Vermelho, como vinho"),
    
    (5, 1, 2, "Preto, noite, escuro"),
    
    (1, 2, 2, "Laranja, mas agora alegre "),
    (2, 2, 2, "Azul escuro misturado, agora sereno");
