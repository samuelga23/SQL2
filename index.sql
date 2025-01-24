/*
Un índice en SQL es una estructura de datos utilizada para acelerar las consultas en una base de datos. Actúa como un "índice" en un libro: 
permite encontrar datos específicos de forma más rápida, en lugar de recorrer todos los registros de una tabla (una búsqueda secuencial). 
Los índices se crean en una o más columnas de una tabla y almacenan referencias a las filas correspondientes.

Tipos de índices más comunes:

Índice primario (PRIMARY KEY):
Se crea automáticamente cuando defines una clave primaria en una tabla.
Es único y no permite valores nulos.

Índice único (UNIQUE):
Garantiza que los valores de las columnas indexadas sean únicos.

Índice compuesto:
Se crea en más de una columna.
Útil para acelerar consultas que filtran por varias columnas juntas.

Índice normal (INDEX):
Mejora el rendimiento de las búsquedas, pero no impone restricciones de unicidad.

Índice de texto completo (FULLTEXT):
Optimiza búsquedas de texto en columnas largas como VARCHAR o TEXT.

Índices hash:
Son rápidos para búsquedas exactas, pero no son tan eficientes para rangos de valores.
*/

--indice normal
CREATE INDEX idx_name
ON usuarios (name);

--indice compuesto
CREATE INDEX idx_name
ON usuarios (name,surname);

SELECT * FROM usuarios WHERE name ='samuel' AND surname ='galofre';

--indice unico
CREATE UNIQUE INDEX idx_name
ON usuarios (name);

CREATE UNIQUE INDEX idx_name
ON usuarios (name,surname);


/*Los indices nos ayudan a acelerar la consulta de datos de manera mas eficiente, se utilizan cuando tenemos una base de datos con muchos datos, es de vital importancia
para hacer las filtraciones de busqueda mas eficiente*/

DROP INDEX idx_name ON usuarios;