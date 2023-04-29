USE Mysql;
SELECT * FROM USER WHERE user LIKE 'onlyread@localhost';

-- Se crea el usuario para permisos de solo lectura
CREATE USER 'onlyread@localhost' IDENTIFIED BY 'unaContrasenia';

-- Se otorga permisos de lectura en cada tabla del schema cinema
GRANT SELECT ON cinema.backup_clientes TO 'onlyread@localhost';
GRANT SELECT ON cinema.cines TO 'onlyread@localhost';
GRANT SELECT ON cinema.clientes TO 'onlyread@localhost';
GRANT SELECT ON cinema.entradas TO 'onlyread@localhost';
GRANT SELECT ON cinema.horarios TO 'onlyread@localhost';
GRANT SELECT ON cinema.log_entradas TO 'onlyread@localhost';
GRANT SELECT ON cinema.peliculas TO 'onlyread@localhost';

-- Visualizamos los permisos del usuario
SHOW GRANTS FOR 'onlyread@localhost';

-- --------------------------------------------------------------------------------------------------------------

-- Se crea el usuario para tener los permisos de lectura, insercion y modificacion de datos.
CREATE USER 'puntitoGuion@localhost' IDENTIFIED BY 'puntitoGuion';

-- Se otorgan los permisos de lectura, insercion y modificacion de datos en las tablas del schema cinema.
GRANT SELECT, INSERT, UPDATE ON cinema.backup_clientes TO 'puntitoGuion@localhost';
GRANT SELECT, INSERT, UPDATE ON cinema.cines TO 'puntitoGuion@localhost';
GRANT SELECT, INSERT, UPDATE ON cinema.clientes TO 'puntitoGuion@localhost';
GRANT SELECT, INSERT, UPDATE ON cinema.entradas TO 'puntitoGuion@localhost';
GRANT SELECT, INSERT, UPDATE ON cinema.horarios TO 'puntitoGuion@localhost';
GRANT SELECT, INSERT, UPDATE ON cinema.log_entradas TO 'puntitoGuion@localhost';
GRANT SELECT, INSERT, UPDATE ON cinema.peliculas TO 'puntitoGuion@localhost';

-- Visualizamos los permisos del usuario
SHOW GRANTS FOR 'puntitoGuion@localhost';