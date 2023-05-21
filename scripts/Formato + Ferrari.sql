-- Se crean Stored Procedures -- 
USE cinema;
-- ordenar necesita 3 parametros, el primero es el nombre de la tabla, seguido por el nombre de la columna y por ultimo si es ASC o DESC
DELIMITER // 
CREATE PROCEDURE ordenar (
    IN nombreTabla TEXT,
    IN columna TEXT,
    IN tipoOrden TEXT
)
BEGIN
	-- Guardo en una variable la consulta a realizar
    SET @varConsulta = CONCAT('SELECT * FROM ', nombreTabla, ' ORDER BY ', columna, ' ', tipoOrden, ';');
    PREPARE ordenamiento FROM @varConsulta;
    -- Se ejecuta la consulta
    EXECUTE ordenamiento;
    DEALLOCATE PREPARE ordenamiento;
END //
DELIMITER ;

CALL ordenar('cines', 'lugar', 'ASC'); -- Este es un ejemplo para ordenar la tabla 'cines' en la columna 'lugar' de forma Ascendente

-- ----------------------------------------------------------------------------------------------------------------------------------
-- eliminar necesita 2 parametros, el primero es el nombre de la tabla y el segundo es el numero id del registro a borrar
DELIMITER //
CREATE PROCEDURE eliminar (
    IN nombreTabla TEXT,
    IN id INT
)
BEGIN
	-- Guardo en una variable, la columna con el nombre de la primary key ya que varía segun la tabla
    SELECT COLUMN_NAME INTO @pk
        FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
        WHERE TABLE_NAME = nombreTabla AND CONSTRAINT_NAME = 'PRIMARY'
        LIMIT 1;
	-- En otra variable, guardo el script que se va a ejecutar para eliminar
    SET @varConsulta = CONCAT('DELETE FROM ', nombreTabla, ' WHERE ', @pk, ' = ', id, ';');
    PREPARE eliminacion FROM @varConsulta;
    -- Ejecuto el script
    EXECUTE eliminacion;
    DEALLOCATE PREPARE eliminacion;
END //
DELIMITER ;

CALL eliminar('entradas',100); -- En este ejemplo, eliminamos la entrada con id 100

-- ----------------------------------------------------------------------------------------------------------------------------------
-- En el sp estrenar se debe indicar la pelicula, el genero, la fecha, el id del cine y el horario en el que se encuentra la funcion inicial
DELIMITER //
CREATE PROCEDURE estrenar (
    IN pelicula TEXT,
    IN genero TEXT,
    IN fecha DATE,
    IN cine INT,
    IN hora TIME
)
BEGIN
    DECLARE existeId BOOLEAN;
    DECLARE idPelicula INT;
    DECLARE idHorario INT;
    
	-- Guardo los ultimos id de la tabla peliculas y horarios
    SELECT MAX(id_pelicula) FROM peliculas INTO idPelicula;
	SELECT MAX(id_horario) FROM horarios INTO idHorario;

    -- Verifico si existe el cine indicado
    SELECT EXISTS(SELECT 1 FROM `cines` WHERE `id_cine` = cine) INTO existeId;
    IF existeId THEN
        -- Verifico si ya existe una película con el mismo nombre
        IF NOT EXISTS(SELECT 1 FROM peliculas WHERE nombre = pelicula) THEN
            -- Agrego la película
            INSERT INTO peliculas (id_pelicula, nombre, genero, fecha_estreno, id_cine) VALUES (idPelicula+1, pelicula, genero, fecha, cine);
            -- Agrego el horario inicial de la pelicula
            INSERT INTO horarios (id_horario, horario, id_pelicula) VALUES (idHorario+1,hora, idPelicula+1);
        ELSE
            -- Si la película ya existe, muestro un mensaje de error
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una película con el mismo nombre';
        END IF;
        
    ELSE
		-- Si el cine no existe, muestro un mensaje de error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe el cine indicado';
    END IF;
END //
DELIMITER ;

-- Este es un ejemplo donde se quiere estrenar una pelicula, con su genero, su fecha de estreno, el cine y el horario inicial de la función
CALL estrenar ('Super Mario Bros','Aventura/Comedia', '2023-04-06',1,'18:30:00');