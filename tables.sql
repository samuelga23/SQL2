/*
Relacion 1:1, caundo tenemos dos tablas que se relacionan, la relacion 1:1 significa que un dato de la tabla 1 se puede relacionar con un datos de la tabla 2
Relacion 1:n, en este caso cada dato de la tabla 1 puede tener multiples relaciones con datos de la tabla 2
Relacion n:m, aca las relaciones entre los datos de la tabla se pueden relacionar todos entre si, es decir, los datos de la tabla 1 pueden tener multiples relaciones
con los datos de la tabla 2 y los datos de la tabla 2 pueden tener multiples relaciones con datos de la tabla 1
*/

TRUNCATE TABLE nombre_tabla;

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



---BASE DE DATOS RELACIONADAS

CREATE TABLE usuarios( ----------------------> Creamos la tabla usuarios
    id INT AUTO_INCREMENT PRIMARY KEY, ------> id que viene a ser la clave primaria de la tabla, el id que va dar referencia a cada fila de la tabla, referencia de los usurios
    name VARCHAR(50) NOT NULL, ---------> nombre del usurario
    age INT NOT NULL, -------> edad del usuario
    email VARCHAR(50) UNIQUE, --------> email del usuario
    date DATE NOT NULL DEFAULT (CURRENT_DATE()); -----> fecha de inicio del usuario, y si es nula valor por defecto de la fecha actual
);

--RELACION 1:1
CREATE TABLE dni -----------------------------> Creamos la tabla dni
(
	dni_id INT AUTO_INCREMENT PRIMARY KEY,  ------> dni_id que viene a ser la clave primaria de la tabla, nos sirve como referencia del numero de dni
	dni_number INT NOT NULL UNIQUE, -------------> dni_number que viene a ser el numero de identificacion del usuario        
	id int,                         -------------> Creamos una columna id, haciendo referencia a la columna id de la tabla de usuarios          
	FOREIGN KEY (id) REFERENCES usuarios(id) ----> Establecemos la columna id como clave foranea de la tabla dni
);
--------------------------------------------------------------------------------------------------------------------------------------------------

--RELACION 1:N
CREATE TABLE area --------> Creamos la tabla area
(
    area_id INT AUTO_INCREMENT PRIMARY KEY, -----> area_id que viene a ser la clave primaria de la tabla, el id de referencia del nombre del area
    area_name VARCHAR(50) NOT NULL -----> area_name viene a ser el nombre del area 
);

ALTER TABLE usuarios ------> modificamos la tabla, agregando una nueva columna
ADD area_id INT; ---------> Aañadimos la nueva columna, que viene a ser area_id, siendo esta la clave foranea de la tabla usuarios y haciendo referencia a la clave primaria
                 --------- de la tabla area


ALTER TABLE usuarios -----> modificamos la tabla usuarios
ADD CONSTRAINT FK_area ----> añadimos un constraint especifico para el nombre de la clave foranea
FOREIGN KEY (area_id) REFERENCES area(area_id); --------- añadimos la clave foranea especificando que es la nueva columna creada y haciendo referencia a la clave primaria
                                                ----- de la tabla area
--------------------------------------------------------------------------------------------------------------------------------------------------

--RELACION N:M

CREATE TABLE lenguajes -------> creamos la tabla lenguajes
(
	lenguaje_id INT AUTO_INCREMENT PRIMARY KEY, ------> establecemos la clave primario
    name_lenguaje VARCHAR (50) -----> creamos una columna que va a contener el nombre del lenguaje, representado por un id
);

CREATE TABLE usuarios_lenguajes  ------> creamos la tabla usuarios_lenguajes que va a ser de intermediario entre las dos tablas
(
	usuario_lenguaje_id INT AUTO_INCREMENT PRIMARY KEY, ------> establecemos la clave priamaria
    user_id int NOT NULL, ----> creamos una columna user_id, haciendo referencia a la clave primaria de la tabla usuarios
    lenguaje_id int NOT NULL, ---> creamos una columna lenguaje_id, haciendo referencia a la clave primaria de la tabla lenguaje
    FOREIGN KEY (user_id) REFERENCES usuarios(user_id), ----> establecemos como clave foranea la clave principal de la tabla usuarios
    FOREIGN KEY (lenguaje_id) REFERENCES lenguajes(lenguaje_id), ----> establecemos como clave foranea la clave principal de la tabla lenguajes
    UNIQUE (user_id, lenguaje_id) -----> hacemos una tupla que sea unica, es decir, que un usuario no sepa el mismo lenguaje dos veces o viceversa
);