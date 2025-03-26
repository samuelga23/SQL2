/*En MySQL, una vista es una tabla virtual basada en el resultado de una consulta SQL. 
No almacena los datos directamente, sino que muestra los datos de otras tablas en función de la consulta definida.*/

CREATE VIEW v_usuarios_edades AS 
SELECT name, age 
From usurios 
WHERE age>=18;

--Creamos una vista de la tabla (una consulta definida) usuarios para que se nos muestre el nombre y la edad de aquellos usuarios mayores de edad--

SELECT * FROM v_usuarios_edades --(Mostramos la vista que hemos creado)--