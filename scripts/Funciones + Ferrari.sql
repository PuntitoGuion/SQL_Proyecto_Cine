-- Se crean las funciones --

-- Con esta funcion, obtengo el id del cine que tiene mayor cantidad de salas
DELIMITER $$
CREATE FUNCTION salas_cine_max() RETURNS INT
READS SQL DATA
BEGIN
    DECLARE cine_id INT;
    SELECT id_cine INTO cine_id FROM cines WHERE cant_salas = (SELECT MAX(cant_salas) FROM cines) LIMIT 1;
    RETURN cine_id;
END $$
DELIMITER ;

-- Este es un ejemplo de uso, que me muestra el nombre, lugar y la cantidad de salas que tiene ese cine con mayor cantidad de salas
SELECT nombre, lugar, cant_salas
FROM cines
WHERE id_cine = salas_cine_max();

-- Con esta funcion, podemos obtener los datos de una entrada de cine
DELIMITER //
CREATE FUNCTION obtener_datos_entrada(id_entrada INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE v_datos_entrada VARCHAR(255);
    SELECT CONCAT(p.nombre, ', ', c.nombre, ' - ', c.lugar, ', ' , DATE_FORMAT(h.horario, "%H:%i"), 'hs')
        INTO v_datos_entrada
        FROM entradas e 
        JOIN peliculas p ON e.id_pelicula = p.id_pelicula 
        JOIN cines c ON p.id_cine = c.id_cine 
        JOIN horarios h ON e.id_horario = h.id_horario 
        WHERE e.id_entrada = id_entrada;
    RETURN v_datos_entrada;
END//
DELIMITER ;

-- Aca se ve un ejemplo con una entrada
SELECT obtener_datos_entrada(3) AS datos_entrada;