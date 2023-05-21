-- Se crean los triggers -- 

-- Se crea una tabla de registro de las entradas compradas por fecha
CREATE TABLE log_entradas(
id_log INT PRIMARY KEY AUTO_INCREMENT,
id_entrada INT NOT NULL,
fecha DATETIME,
FOREIGN KEY (id_entrada) REFERENCES entradas(id_entrada)
);

-- Se crea el trigger que lo que hace es insertar un registro a la tabla "log_entradas" con su id_entrada y la fecha de ahora cuando se inserte un registro a la tabla "entradas"
CREATE TRIGGER `log_compra_entradas`
AFTER INSERT ON `entradas`
FOR EACH ROW
INSERT INTO `log_entradas` (id_log,id_entrada,fecha) VALUE (NULL,NEW.id_entrada,NOW());

-- Un ejemplo para probar
INSERT INTO entradas(id_entrada,valor,vigencia,id_pelicula,id_cliente,id_horario) VALUE (100,300,1,10,15,3);

-- ------------------------------------------------------------------

-- Se hace una tabla de backup para clientes eliminados
CREATE TABLE backup_clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nombre TEXT NOT NULL,
edad INT NOT NULL,
genero_preferido TEXT,
fecha_respaldo DATETIME,
hecho_por TEXT NOT NULL
);

-- Lo que se hace en este trigger es que cuando se elimina de la tabla "clientes", se van a eliminar de la tabla "entradas" que sean de este cliente y se va hacer un backup del cliente
-- Incluyendo el dia de la fecha que fue eliminado y quien lo realizo.
DELIMITER //
CREATE TRIGGER `backup_clientes`
BEFORE DELETE ON `clientes`
FOR EACH ROW
BEGIN
DELETE FROM entradas WHERE id_cliente = OLD.id_cliente;
INSERT INTO `backup_clientes` (id_cliente,nombre,edad,genero_preferido,fecha_respaldo,hecho_por) 
						VALUE (OLD.id_cliente, OLD.nombre, OLD.edad, OLD.genero_preferido, NOW(), CURRENT_USER());
END //
DELIMITER ;

-- Un ejemplo de uso
DELETE FROM clientes WHERE id_cliente = 34;