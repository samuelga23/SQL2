/*Un procedimiento almacenado en MySQL es un conjunto de instrucciones SQL que se pueden almacenar en la base de datos y ejecutar cuando sea necesario. 
Sirven para automatizar tareas, mejorar el rendimiento y la seguridad.
*/

DELIMITER //
CREATE PROCEDURE p_all_users() --Creamos un procedimento almacenado--
BEGIN
	SELECT name,surname,age from usuarios; --Seleccionamos las columnas de la tabla que nos va a filtrar este procedimiento almacenado--
END //
DELIMITER;
CALL p_all_users; --Ejecutamos el procedimineto almacenado y se nos retornada la consulta-


DELIMITER //
CREATE PROCEDURE p_users_email() 
BEGIN
	SELECT email from usuarios WHERE email IS NOT NULL; --Podemos añadir parametros en la consulta--
END //
CALL p_users_email; 


DELIMITER //
CREATE PROCEDURE p_users_edad(IN edad_parametro int) --Creamos un parametro "edad_parametro"y especificamos que es tipo entero--
BEGIN
	SELECT name,surname,age,area_id from usuarios WHERE age = edad_parametro; --Igualamos la variable age al parametro que hemos creado, para que al momento de hacer la busqueda--
END //                                                                        --Solo se nos muestre aquellas filas que cumplan con el parametro especificado--
CALL p_users_edad(19); --19 años de edad es nuestro parametro--
