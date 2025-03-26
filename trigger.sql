/*
Un trigger (o disparador) en SQL es un conjunto de instrucciones que se ejecutan automáticamente en respuesta a un evento específico en una tabla o vista dentro 
de una base de datos. Se utiliza para automatizar tareas, garantizar integridad de los datos o llevar a cabo acciones adicionales después de ciertas operaciones.

Eventos que activan un trigger:
Los triggers se pueden configurar para ejecutarse en los siguientes eventos:

INSERT: Cuando se inserta un nuevo registro en una tabla.
UPDATE: Cuando se actualiza un registro existente en una tabla.
DELETE: Cuando se elimina un registro de una tabla.

Tipos de triggers según el momento de ejecución:

BEFORE: Se ejecuta antes de que ocurra el evento.
Útil para validar o modificar los datos antes de que se realice la operación.
AFTER: Se ejecuta después de que el evento haya ocurrido.
Usado para realizar acciones relacionadas con la operación, como registrar auditorías o sincronizar datos.
*/

CREATE TRIGGER nombre_trigger
{ BEFORE | AFTER } { INSERT | UPDATE | DELETE } ---el trigger se ejecutara antes o despues de la accion, ya sea, insertar, actualizar o eliminar
ON nombre_tabla -- sobre que tabla
FOR EACH ROW -- el trigger se ejecutara una vez por cada fila afectada
BEGIN
    -- Acciones que deseas ejecutar
END;

-------------------------------------------------------------------------------------------------------------

CREATE TABLE email_history (  --creamos una nueva tabla que va a ser un historial de email antiguos
	email_history_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE email_history
ADD CONSTRAINT FK_user_id
FOREIGN KEY (user_id) REFERENCES usuarios (user_id);


DELIMITER $$ ---cambiamos el delimitar temporalmente de ; a $$, ya que en el END IF; el punto y coma se puede interpretar como el comando final, cuando en realidad es END

CREATE TRIGGER TG_email -- el nombre del trigger
AFTER UPDATE -- despues de una actualizacion
ON usuarios -- en la tabla usuarios
FOR EACH ROW --- se ejecuta una vez para cada fila afectada
BEGIN
	IF OLD.email <> NEW.email THEN --- si el email viejo es diferente al nuevo entonces
		INSERT INTO email_history(user_id, email) -- se va a insertar tendro de la tabla email_history, en las columnas user_id y el email de esa tabla
        VALUES(OLD.user_id, OLD.email); -- los valores que se insetaran sera el old.user_id (que en realidad no cambia) y el old.email, que seria el email viejo del usuario
	END IF;                             -- antes de la actualizacion
END$$

DELIMITER ;

UPDATE usuarios --- actualizamos la tabla usuarios
SET email = 'sharyckcoley@gmail.com' -- la columna email con el nuevo correo
WHERE user_id = 3 -- para el usuario con el identifcador 3


DROP TRIGGER TG_email --Eliminar trigger-- 