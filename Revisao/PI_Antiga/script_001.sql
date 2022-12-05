DROP DATABASE IF EXISTS XPTO;
CREATE DATABASE XPTO;

USE XPTO;

CREATE TABLE Pizza (
    pizza VARCHAR(30) PRIMARY KEY,
    preco FLOAT NOT NULL
);

CREATE TABLE Tipo (
	tipo VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Ingrediente (
	ingrediente VARCHAR(30) PRIMARY KEY,
    preco_unitario FLOAT NOT NULL
);

CREATE TABLE IngredientePizza (
    pizza VARCHAR(30),
    ingrediente VARCHAR(30),
    quantidade FLOAT NOT NULL,
    PRIMARY KEY (pizza, ingrediente),
    FOREIGN KEY (pizza) REFERENCES Pizza (pizza),
    FOREIGN KEY (ingrediente) REFERENCES Ingrediente (ingrediente)
);

CREATE TABLE IngredienteTipo (
	ingrediente VARCHAR(30),
	tipo VARCHAR(30),
    PRIMARY KEY (ingrediente, tipo),
    FOREIGN KEY (ingrediente) REFERENCES Ingrediente (ingrediente),
    FOREIGN KEY (tipo) REFERENCES Tipo (tipo)
);

INSERT INTO Pizza VALUES
	("calabresa", 100.0),
    ("legumes", 100.0),
    ("mussarela", 100.0),
    ("pão", 100.0),
    ("incoerente", 200.0);
    
INSERT INTO Tipo VALUES
	("vegana"),
    ("vegetariana"),
    ("sem lactose"),
    ("sem gluten");

INSERT INTO Ingrediente VALUES
	("mussarela", 10.0),
    ("calabresa", 30.0),
    ("abobrinha", 5.0),
    ("massa", 5.0),
    ("massa sem gluten", 7.0),
    ("picanha", 40.0),
    ("mussarela vegana", 20.0);

INSERT INTO IngredienteTipo VALUES
    ("abobrinha", "vegana"),
    ("massa sem gluten", "vegana"),
    ("mussarela vegana", "vegana"),
	("mussarela", "vegetariana"),
    ("abobrinha", "vegetariana"),
    ("massa", "vegetariana"),
    ("massa sem gluten", "vegetariana"),
    ("mussarela vegana", "vegetariana"),
    ("calabresa", "sem lactose"),
    ("abobrinha", "sem lactose"),
    ("massa sem gluten", "sem lactose"),
    ("picanha", "sem lactose"),
    ("mussarela vegana", "sem lactose"),
    ("mussarela", "sem gluten"),
    ("calabresa", "sem gluten"),
    ("abobrinha", "sem gluten"),
    ("massa sem gluten", "sem gluten"),
    ("picanha", "sem gluten"),
    ("mussarela vegana", "sem gluten");
    
INSERT INTO IngredientePizza VALUES
	("calabresa", "massa", 1.0),
	("calabresa", "calabresa", 3.0),
    ("legumes", "massa sem gluten", 1.0),
    ("legumes", "abobrinha", 3.0),
    ("mussarela", "massa", 1.0),
    ("mussarela", "mussarela", 3.0),
    ("pão", "massa", 1.0),
    ("incoerente", "massa sem gluten", 1.0),
    ("incoerente", "picanha", 2.0),
    ("incoerente", "mussarela vegana", 1.0),
    ("incoerente", "mussarela", 1.0);
