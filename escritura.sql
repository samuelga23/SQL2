INSERT INTO users 
(users_id, name, surname)
VALUES (9, 'john', gomez)

INSERT INTO users
(name, surname) 
VALUES ('josefina', 'ariza')

INSERT INTO persons
(name, age, email, date)
VALUES ('keren',21,'kerensofi@gmail.com','2003-09-16');
--INSERT INTO, nos ayuda a inseter dentro de una tabla con determinados campos, nuevos valores mediante un VALUES

UPDATE users 
SET age = 13 
where users_id = 12;

UPDATE users 
SET age = 14, init_date = '2020-12-23'
where users_id = 12;

UPDATE persons2
SET name = 'juan', age = 29, email = 'juanchote@gmail.com', date = '2004-11-24'
WHERE id = 6;

UPDATE persons 
SET email = 'kerensofigal@gmail.com'
WHERE id = 2;

UPDATE users
SET init_date = null --Aqui estariamos haciendo un "borrado" de un campo especifico de una columna, mediante un null, en este caso la fecha del usuario 12.
WHERE users_id = 12;

UPDATE persons 
SET email = NULL
WHERE id = 2;
--UPDATE nos ayuda a actualizar la tabla donde tenemos que definir la columna a actualizar mediante un SET y un WHERE, el campo donde especificamente vamos a actualizar.

DELETE FROM Users
WHERE users_id = 10;
--DELETE FROM, nos ayuda a borrar tablas o filas