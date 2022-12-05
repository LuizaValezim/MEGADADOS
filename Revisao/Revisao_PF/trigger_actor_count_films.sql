USE sakila;

DROP TRIGGER IF EXISTS trig_adiciona_filme;
DROP TRIGGER IF EXISTS trig_remove_filme;

DELIMITER //
CREATE TRIGGER trig_adiciona_filme
BEFORE INSERT ON film_actor
FOR EACH ROW
BEGIN
	UPDATE actor 
		SET count_films = count_films + 1
        WHERE actor.actor_id = NEW.actor_id; # NEW.actor_id linhas inseridas no film_actor
END//

CREATE TRIGGER trig_remove_filme
BEFORE DELETE ON film_actor
FOR EACH ROW
BEGIN
	UPDATE actor 
		SET count_films = count_films - 1
        WHERE actor.actor_id = OLD.actor_id;
END//

DELIMITER ;


COMMIT;