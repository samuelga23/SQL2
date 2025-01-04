CREATE TABLE persons(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50),
    date DATE NOT NULL,
	PRIMARY KEY (`id`));
/*Se puede crear una tabla mediante CREATE TABLE, definimos el nombre de las columnas junto con sus atributos, que tipo de datos es (int, varchar,date,etc), si puede ser vacio
o no (not null) y si el valor es unico(primary key)*/

CREATE TABLE persons2(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    date DATE NOT NULL,
    PRIMARY KEY (`id`));

DROP TABLE persons;
--Borrar tabla