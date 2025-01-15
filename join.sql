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

SELECT name, name_lenguaje from usuarios
LEFT JOIN usuarios_lenguajes
ON usuarios_lenguajes.user_id = usuarios.user_id
LEFT JOIN lenguajes
ON usuarios_lenguajes.lenguaje_id = lenguajes.lenguaje_id
ORDER BY usuario_lenguaje_id ASC;


/*RIGH JOIN,  este nos trae todos los campos de la tabla de la derecha (la tabla sobre la que hacemos el RIGHT JOIN), nos trae las filas que cumplan con la condicion de 
coincidencia y aquellas que no las cumplan, las marca como null en los campos especificos*/

SELECT * FROM dni
RIGHT JOIN usuarios
ON usuarios.user_id  = dni.user_id;
/*Hacemos el right join sobre la tabla usuarios, es decir, traera a todos las filas de esa tabla y se uniera junto con la tabla dni, en este caso aquellos usuarios con un dni
se nos mostrara y aquellos que no, seran nulos*/
SELECT name, dni_number FROM dni
RIGHT JOIN usuarios
ON usuarios.user_id  = dni.user_id;



SELECT * FROM usuarios 
RIGHT JOIN dni 
ON usuarios.user_id  = dni.user_id;
/*Ahora como el right join esta sobre la tabla dni, nos traera todas las filas de esa tabla, pero como en la tabla dni todas las filas estan relacionadas a un usuario
ninguna se nos mostrara como nulo*/
SELECT name, dni_number FROM usuarios 
RIGHT JOIN dni 
ON usuarios.user_id  = dni.user_id;


/* EN ESTE MODO ESTAS CONSULTAS DE RIGHT JOIN Y LEFT JOIN NOS MOSTRARA LO MISMO PERO ESCRITA DE MANERA CONTRARIA*/

SELECT name, dni_number FROM dni                   SELECT name, dni_number FROM usuarios 
LEFT JOIN usuarios                       =         RIGHT JOIN dni 
ON usuarios.user_id  = dni.user_id;                ON usuarios.user_id  = dni.user_id

/*ACA EL JOIN SE ESTA HACIENDO SOBRE LA TABLA DNI Y COMO EN LA TABLA DNI CADA FILA ESTA RELACIONA A UN USUARIO, NINGUNO DNI_NUMBER SE NOS MOSTRARA COMO NULO*/


SELECT name, dni_number FROM dni                   SELECT name, dni_number FROM usuarios 
RIGHT JOIN usuarios                      =         LEFT JOIN dni 
ON usuarios.user_id  = dni.user_id;                ON usuarios.user_id  = dni.user_id;

/*ACA EL JOIN SE ESTA HACIENDO SOBRE LA TABLA USUARIOS Y COMO EN LA TABLA USUARIOS HAY USUARIOS QUE NO TIENEN UN DNI_NUMBER REGISTRADO EN LA TABLA DNI, AQUELLOS
USUARIOS SIN DNI SE MARCARAN COMO NULOS*/

/*
Reglas básicas del UNION:
Número de columnas: Todas las consultas deben tener el mismo número de columnas en los resultados.
Tipo de datos: Los tipos de datos de las columnas correspondientes en las consultas deben ser compatibles.
Orden: Los datos de las columnas se combinan en el orden en que se listan en las consultas.
*/

SELECT name from usuarios 
UNION 
SELECT dni_number FROM dni

SELECT name,age from usuarios 
UNION 
SELECT dni_number, dni_id FROM dni

