-- Peliculas que posee un cine
CREATE VIEW vw_cant_pel_cine AS
SELECT  c.nombre as cine, c.lugar, COUNT(*) as cantidad_peliculas
FROM cines as c
JOIN peliculas as p
ON c.id_cine = p.id_cine
GROUP BY c.nombre, c.lugar
ORDER BY c.nombre, c.lugar;

-- Horario de todas las peliculas
CREATE VIEW vw_horarios AS
SELECT p.nombre as pelicula, c.nombre as cine, c.lugar, h.horario
FROM peliculas as p
JOIN horarios as h
ON p.id_pelicula = h.id_pelicula
JOIN cines as c
ON c.id_cine = p.id_cine
ORDER BY h.horario, c.nombre, c.lugar;

-- Entradas vendidas por pelicula
CREATE VIEW vw_ventas_peli AS
SELECT p.nombre as pelicula, COUNT(*) as entradas_vendidas
FROM entradas as e
JOIN peliculas as p
ON p.id_pelicula = e.id_pelicula
GROUP BY pelicula
ORDER BY entradas_vendidas DESC;

-- Entradas vendidas por cine
CREATE VIEW vw_ventas_cine AS
SELECT c.nombre as cine, c.lugar , COUNT(*) as entradas_vendidas
FROM entradas as e
JOIN peliculas as p
ON p.id_pelicula = e.id_pelicula
JOIN cines as c
ON p.id_cine = c.id_cine
GROUP BY c.nombre, c.lugar
ORDER BY entradas_vendidas DESC, c.nombre, c.lugar;

-- Cliente ordenados por cantidad de entradas que compran
CREATE VIEW vw_top_clientes AS
SELECT c.nombre AS cliente, c.edad, COUNT(*) AS entradas_compradas
FROM entradas as e
JOIN clientes as c
ON c.id_cliente = e.id_cliente
GROUP BY cliente, c.edad
ORDER BY entradas_compradas DESC, cliente, c.edad;

-- Generos populares ordenados por la preferencia de los clientes
CREATE VIEW vw_top_generos AS
SELECT c.genero_preferido as genero, COUNT(*) as cantidad_generos
FROM entradas as e
JOIN clientes as c
ON c.id_cliente = e.id_cliente
GROUP BY c.genero_preferido
ORDER BY cantidad_generos DESC