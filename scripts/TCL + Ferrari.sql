USE cinema;

-- Hacemos una TRANSACTION para eliminar registros y luego recuperarlos
START TRANSACTION;

DELETE FROM entradas WHERE id_entrada IN (1,2,3,4,5,6,7,8);

SELECT * FROM entradas;
ROLLBACK;

-- COMMIT;
-- Dejo comentado COMMIT ya que no me interesa eliminar estos registros realmente
SELECT * FROM entradas;

-- -----------------------------------------------------------------------------------------------------

-- Hacemos una TRANSACTION que tendra un SAVEPOINT en el registro #4 que se agrega y en el #8
-- luego comentamos la eliminacion del SAVEPOINT de los primeros 4 registros insertados
START TRANSACTION;
SAVEPOINT sinAgregados;

-- Se agregan primeros 4 registros seguido de un SAVEPOINT
INSERT INTO clientes(id_cliente, nombre, edad, genero_preferido) VALUES
(79,'Sergio Sola',32,"Comedia"),
(80,'Julián Ferrari',24,"Ciencia ficción"),
(81,'Rogelio Vidal',28,"Terror"),
(82,'Valeria Tamanti',26,"Aventura");
SAVEPOINT primerosCuatro;

-- Se agregan otros 4 registros más seguido de un SAVEPOINT
INSERT INTO clientes(id_cliente, nombre, edad, genero_preferido) VALUES
(83,'Ignacio Juri',44,"Misterio"),
(84,'Eduardo Lescinskas',49,"Animación"),
(85,'Andrea García',54,"Drama"),
(86,'Leonela Fernandez',18,"Comedia");
SAVEPOINT otrosCuatro;
SELECT * FROM clientes; -- Verifico los agregados

-- Si quisiera deshacer los ultimos registros agregados, podria hacer un ROLLBACK para volver al principio con la siguiente sentencia
ROLLBACK TO sinAgregados;
-- Se deja comentado la eliminacion de el SAVEPOINT primerosCuatros:
-- RELEASE primerosCuatro;

SELECT * FROM clientes; -- Verifico que hice ROLLBACK