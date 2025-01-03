SELECT * FROM users;
SELECT name FROM users;
SELECT users_id, name FROM users;
"Select es una palabra reservada de lenguaje SQL que no sirve para las consultas de una tabla, para seleccionar las columnas de una tabla o la tabla "
"From Palbra reservada que nos indica desde que se hace la consulta"

SELECT DISTINCT * FROM users;
SELECT DISTINCT age FROM users;
SELECT DISTINCT email FROM users;
SELECT DISTINCT name FROM users;
"Distinct nos trae todos los campos que sean distintos"

SELECT * from users WHERE age = 15;
SELECT name from users WHERE age = 15;
SELECT DISTINCT age from users WHERE age = 15;
"Where un criterio o condicion"

SELECT * FROM users ORDER BY age;
SELECT * FROM users ORDER BY age DESC;
SELECT * FROM users WHERE email= "samuelgal2016@gmail.com" ORDER BY age DESC;
SELECT name FROM users WHERE email= "samuelgal2016@gmail.com" ORDER BY age DESC;
"Ordy by nos ordena los datos de manera ascende por defecto de la tabla en base a lo que definamos"

SELECT * FROM users WHERE email LIKE "%gmail.com";
"EL comando Like nos sirve para hacer busquedas especificas de campos que tengan un valor de coindidencia, en este caso el gmail.com, que junto el % a la izquierda
hace que se omita o no cuennte lo que esta a la izquierda del gmail.com para que nos pueda retornar la consulta con aquellos usuarios con un gmail.com " 

SELECT * FROM users WHERE email LIKE "samuelgal2016@gmail.com";
SELECT * FROM users WHERE email LIKE "samuelgal2016%";
"ambas lineas SQL nos traeran aquellas columnas que coincidan con la consulta, o sea el correo samuelgal2016@gmail.com"

SELECT * FROM users WHERE NOT email = "samuelgal2016@gmail.com";
"NOT es un limitador, es la negacion en este caso de la condicion WHERE"

SELECT * FROM users WHERE NOT email = "samuelgal2016@gmail.com" AND age =20;
"AND un condicional que se utiliza para complementar otra condicion, en la cual ambas se deben cumplir, en este caso que el correo no sea *** y que la edad sea 20"

SELECT * FROM users WHERE NOT email = "samuelgal2016@gmail.com" OR age =20;
"OR otro condicional en el que alguna de las condicones debe ser cierta para que se nos muestre la consulta"