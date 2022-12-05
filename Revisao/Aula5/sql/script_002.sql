USE torneio;

ALTER TABLE Jogadores
    DROP FOREIGN KEY fk_equipe;

ALTER TABLE Jogadores
    ADD CONSTRAINT fk_equipe 
        FOREIGN KEY (nome_equipe) 
        REFERENCES Equipes (nome)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
