/*INNER JOIN para combinar dos tablas: usuarios y dni.
Esta consulta devuelve todas las columnas de ambas tablas donde se cumple que el valor de user_id en la tabla usuarios coincide con el valor de user_id en la tabla dni.
Es decir solo va a unir aquellas filas donde dentro de la tabla dni este asignado a un usuario, un usuario sin dni no saldra en la consulta, ya que no cumple con la
condicion de coincidencia*/

SELECT * FROM usuarios -----> seleccionamos todas las columnas de la tabla usuarios
INNER JOIN dni ----> realiza una combiacion de la tabla usuarios con la tabla dni
ON usuarios.user_id  = dni.user_id; ----> Define la condición de coincidencia, indicando que se deben emparejar las filas de ambas tablas donde el valor de user_id sea igual.


SELECT name, dni_number FROM usuarios
INNER JOIN dni
ON usuarios.user_id  = dni.user_id;
/* como hemos unido las dos tablas en una sola, podemos realizar una consulta de columnas de diferentes tablas, name (columna de la tabla usuarios)
y dni_number (columna de la tabla usuarios), en esta consulta solo nos traera esas dos columnas, y solos nos mostrara las filas que complan con la condicion
de coincidencia, la cual es que un usuario tenga un dni establecido dentro de la tabla dni*/


SELECT * from usuarios
INNER JOIN area
ON usuarios.area_id = area.area_id;
/*Traemos todas las columnas de ambas tablas, pero solo se nos mostrara las filas donde cumplan la condicion de coincidencia, que un usuario este registrado
dentro de un area de trabajo dentro de la tabla area*/

SELECT name,name_area from usuarios
INNER JOIN area
ON usuarios.area_id = area.area_id;
/* solo traemos las columnas name y name_area, y solo las filas que cumplan con las condicion de que un usuario este registrado dentro de un area de trabajo
dentro de la tabla area*/


SELECT * from usuarios_lenguajes
JOIN usuarios
ON usuarios_lenguajes.user_id = usuarios.user_id
JOIN lenguajes
ON usuarios_lenguajes.lenguaje_id = lenguajes.lenguaje_id
ORDER BY usuario_lenguaje_id ASC;

/* en este caso hacemos el join con dos tablas, ya que la tabla usuarios y lenguajes no tienen una relacion directa, sino que se encuentran relacionadas por una tecera
tabla (usuarios_lenguajes), asi que primero hacemos la union de usuarios_lenguajes con la tabla usuarios, donde el valor de coincidencia va a ser el user_id, es decir, aquellos
usuarios que esten registrados en la tabla usuarios_lenguajes, o sea, que dominen un lenguaje de programacion.
Luego hacemos join con la tabla lenguaje, donde el valor de coincidencia sera el lenguaje_id, que viene a ser el identificador del lenguaje que maneja un usuario*/

SELECT name, name_lenguaje from usuarios_lenguajes
JOIN usuarios
ON usuarios_lenguajes.user_id = usuarios.user_id
JOIN lenguajes
ON usuarios_lenguajes.lenguaje_id = lenguajes.lenguaje_id
ORDER BY usuario_lenguaje_id ASC;

SELECT name, age, email, name_lenguaje from usuarios_lenguajes
JOIN usuarios
ON usuarios_lenguajes.user_id = usuarios.user_id
JOIN lenguajes
ON usuarios_lenguajes.lenguaje_id = lenguajes.lenguaje_id
ORDER BY usuario_lenguaje_id ASC;



/* LEFT JOIN, este nos trae todos los campos de la tabla de la izquierda (la tabla sobre la que hacemos el select), nos trae las filas que cumplen con la condicion
de coincidencia y aquellas que no las cumplen, simplemente nos trae como null los campos especificos*/

SELECT * FROM usuarios 
LEFT JOIN dni 
ON usuarios.user_id  = dni.user_id;

SELECT name, dni_number FROM usuarios 
LEFT JOIN dni 
ON usuarios.user_id  = dni.user_id;
/*En este caso se nos va a mostrar todas las filas de las columnas name y dni_number, pero aquellas que no tengan el valor de coincidencia, es decir, que un usuario
dni asociado este se nos mostrara como null*/

SELECT name, dni_number FROM dni
LEFT JOIN usuarios
ON usuarios.user_id  = dni.user_id;
/*en este caso, es al contrario, hacemos el select sobre la tabla dni, ahora la tabla dni es el de la izquierda y como en la tabla dni cada numero de dni tiene asignado
a un usuario, ninguno se nos mostrara como null*/