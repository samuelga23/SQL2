CREATE TABLE persons(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50),
    date DATE NOT NULL,
	PRIMARY KEY (id));
/*Se puede crear una tabla mediante CREATE TABLE, definimos el nombre de las columnas junto con sus atributos, que tipo de datos es (int, varchar,date,etc), si puede ser vacio
o no (not null) y si el valor es unico(primary key)*/

CREATE TABLE persons2(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    date DATE NOT NULL,
    PRIMARY KEY (id));

DROP TABLE persons;
--Borrar tabla

CREATE TABLE persons3(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR (50) NOT NULL,
	age INT NOT NULL,
	email VARCHAR (50) UNIQUE,
    created DATE NOT NULL DEFAULT (CURRENT_DATE()),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

ALTER TABLE persons2
ADD surname VARCHAR(50) NOT NULL,
ADD jod VARCHAR (50) NOT NULL;
--Podemos actualizar la tabla agregando nuevas columnas a la tabla mediante ALTER TABLLE, ADD

ALTER TABLE persons2
RENAME COLUMN jod TO job;

ALTER TABLE persons2
RENAME COLUMN surname To description;
--Podemos actualizar el nombre de la columnas de la tabla

ALTER TABLE persons2
MODIFY COLUMN date DATE NOT NULL DEFAULT (CURRENT_DATE());

ALTER TABLE users
MODIFY COLUMN name VARCHAR(50) NOT NULL,
MODIFY COLUMN surname VARCHAR(50) NOT NULL,
MODIFY COLUMN age INT NOT NULL CHECK (age >= 18),
MODIFY COLUMN date DATE NOT NULL DEFAULT (CURRENT_DATE()),
MODIFY COLUMN email VARCHAR(80) UNIQUE;
/*Mediante el modify podemos modificarlos parametro de las COLUMNAS de la tabla, pero los valores dentro de la tabla deben cumplir con los nuevos requisitos a actualizar,
por ejemplo, si en la tabla hay un usuario menor de 18, la actualización no se podra llevar a cabo*/

ALTER TABLE persons2
DROP COLUMN description;
--Podemos borrar columnas de la tabla