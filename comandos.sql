--Primary Key, viene a ser un tipo de caracteristica que se le da a una columna de una tabla, para que el valor de este campo sea unico e irrepetible, un ID por ejemplo
--Not NUll, en este caso el campo que este marcado con esta caracteristica no podra estar vacio o nulo
--Auto icremental, la base de datos autoincrementa un numero, por ejemplo el ID

SELECT * FROM users;
SELECT name FROM users;
SELECT users_id, name FROM users;
/*Select es una palabra reservada de lenguaje SQL que no sirve para las consultas de una tabla, para seleccionar las columnas de una tabla o la tabla "
From Palbra reservada que nos indica desde que se hace la consulta*/

SELECT DISTINCT * FROM users;
SELECT DISTINCT age FROM users;
SELECT DISTINCT email FROM users;
SELECT DISTINCT name FROM users;
--Distinct nos trae todos los campos que sean distintos

SELECT * from users WHERE age = 15;
SELECT name from users WHERE age = 15;
SELECT DISTINCT age from users WHERE age = 15;
--Where un criterio o condicion

SELECT * FROM users ORDER BY age;
SELECT * FROM users ORDER BY age DESC;
SELECT * FROM users WHERE email= "samuelgal2016@gmail.com" ORDER BY age DESC;
SELECT name FROM users WHERE email= "samuelgal2016@gmail.com" ORDER BY age DESC;
--Ordy by nos ordena los datos de manera ascende por defecto de la tabla en base a lo que definamos

SELECT * FROM users WHERE email LIKE "%gmail.com";
/*EL comando Like nos sirve para hacer busquedas especificas de campos que tengan un valor de coindidencia, en este caso el gmail.com, que junto el % a la izquierda
hace que se omita o no cuennte lo que esta a la izquierda del gmail.com para que nos pueda retornar la consulta con aquellos usuarios con un gmail.com*/

SELECT * FROM users WHERE email = "samuelgal2016@gmail.com";
SELECT * FROM users WHERE email LIKE "samuelgal2016%";
--ambas lineas SQL nos traeran aquellas columnas que coincidan con la consulta, o sea el correo samuelgal2016@gmail.com

SELECT * FROM users WHERE NOT email = "samuelgal2016@gmail.com";
--NOT es un limitador, es la negacion en este caso de la condicion WHERE

SELECT * FROM users WHERE NOT email = "samuelgal2016@gmail.com" AND age =20;
--AND un condicional que se utiliza para complementar otra condicion, en la cual ambas se deben cumplir, en este caso que el correo no sea *** y que la edad sea 20

SELECT * FROM users WHERE NOT email = "samuelgal2016@gmail.com" OR age =20;
--OR otro condicional en el que alguna de las condicones debe ser cierta para que se nos muestre la consulta

SELECT * FROM users LIMIT 3
--Limit nos limita la consulta, en este caso solo nos arroja las tres primeras filas de la tabla
SELECT * FROM users WHERE NOT email = "samuelgal2016@gmail.com" OR age =20 LIMIT 5;
--Nos muestra la consulta de manera limitada con aquellos campos que cumplan con alguna de las dos condiciones

SELECT * FROM users WHERE email IS NULL;
--Null nos ayuda en las consultas de una tabla donde el valor de algunos campos de determinada columna sean nulos (vacios), en este caso del correo 
SELECT * FROM users WHERE email IS NOT NULL;
SELECT * FROM users WHERE email IS NOT NULL AND age = 18;
--Los campos dentro de la columna email que no esten vacios, que tengan correo

SELECT MAX(age) FROM users;
SELECT MIN(age) FROM users;
--Nos trae el campo maximo o minimo

SELECT COUNT(*) FROM users;
SELECT COUNT(age) FROM users;
--Nos trae el numero de campos que consultamos y que tienen un valor distinto de null

SELECT SUM(age) FROM users;
--Nos devuelve la suma de la columna age
SELECT AVG(age) FROM users;
--Promedio de age

SELECT * FROM users WHERE name IN ('samuel')
SELECT * FROM users WHERE name IN ('samuel','pedro')
SELECT * FROM users WHERE email IN ('samuelgal2016@gmail.com')
--IN nos ayuda a filtrar consultas de manera eficiente

SELECT * FROM users WHERE age BETWEEN 15 AND 30 
--Between nos ayuda a filtrar una consulta entre un intervalo

SELECT users_id AS 'ID' FROM users
--Le damos un alias a una columna de la tabla

SELECT CONCAT (name, ' ', surname) FROM users
SELECT CONCAT ('Nombre: ', name, ' ', 'Apellido: ', surname) FROM users
SELECT CONCAT ('Nombre: ', name, ' ', 'Apellido: ', surname) AS 'Nombre Completo' FROM users
--Nos permite contatenar el contenido de diferente campos, que se utiliza junto con el alias

SELECT MAX(age) FROM users GROUP BY age
--Group by nos sirve para hacer agrupaciones de un campo determinado

SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age;
--En este caso nos agrupa las edades y cuenta el numero de edades y los ordena de manera ascendente por edad
SELECT COUNT(age) AS '#', age FROM users WHERE age >= 18 GROUP BY age ORDER BY age;
--hace agrupaciones de las edades que son mayores o iguales a 18, estas agrupaciones nos trae el numero de campos respectivas a cada edad y luego las ordena de manera ascendente

/*Las consultas suelen ser Seleccion de campos (SELECT), de que tabla lo consultamos (FROM), restricciones como el where y complementos O modificadores de filstrado,
 and, or, group by, order by, like, not, is, in, Between, etc. */

SELECT vendedor, SUM(cantidad) AS total_vendido FROM ventas GROUP BY vendedor HAVING total_vendido > 20;
/*En MySQL, HAVING generalmente se usa junto con GROUP BY para filtrar resultados después de agrupar datos. Si no agrupas los datos, no tiene sentido usar HAVING
porque no hay grupos sobre los que aplicar las condiciones.
El HAVING en MySQL se utiliza para filtrar los resultados de una consulta después de que se hayan aplicado las funciones de agregación (SUM, COUNT, AVG, etc.).*/