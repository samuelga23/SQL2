/*Una transacción en MySQL es un conjunto de operaciones SQL que se ejecutan como una unidad. 
Si una parte de la transacción falla, se puede revertir todo para mantener la integridad de los datos.*/

START TRANSACTION;  -- Inicia una transacción
COMMIT;  -- Guarda la transacción en la base de datos
ROLLBACK; -- Revierte la transacción y deja la BD como estaba antes


/*Supongamos que tenemos una tabla cuentas y queremos transferir dinero entre dos cuentas.
Si algo falla, la transacción debe revertirse para evitar inconsistencias.*/
START TRANSACTION;

UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1; -- Restar $100 a la cuenta 1
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2; -- Sumar $100 a la cuenta 2

COMMIT;  -- Confirma la transacción si todo está bien
--Si ocurre un error en algún UPDATE, podemos deshacer los cambios:--
ROLLBACK;


--Puedes establecer puntos de guardado dentro de una transacción para revertir solo hasta un punto específico:--
START TRANSACTION;

UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
SAVEPOINT despues_de_restar;  -- Guardamos un punto de control

UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;

-- Si hay un error en la segunda actualización:
ROLLBACK TO despues_de_restar;

COMMIT;  -- Confirma la transacción
