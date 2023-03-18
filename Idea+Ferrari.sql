CREATE TABLE cines(

id_cine		INT NOT NULL PRIMARY KEY,
nombre		TEXT NOT NULL,
lugar		TEXT,
cant_salas	INT NOT NULL
);

CREATE TABLE clientes(

id_cliente			INT NOT NULL PRIMARY KEY,
nombre				TEXT NOT NULL,
edad				INT NOT NULL,
genero_preferido	TEXT
);

CREATE TABLE peliculas(

id_pelicula		INT NOT NULL PRIMARY KEY,
nombre			TEXT NOT NULL,
genero			TEXT,
fecha_estreno	DATE NOT NULL,
id_cine			INT NOT NULL,

FOREIGN KEY (id_cine) REFERENCES cines(id_cine)
);

CREATE TABLE horarios(

id_horario	INT NOT NULL PRIMARY KEY,
horario		TIME NOT NULL,
id_pelicula	INT NOT NULL,

FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula)
);

CREATE TABLE entradas(

id_entrada		INT NOT NULL PRIMARY KEY,
valor			INT NOT NULL,
vigencia		BOOLEAN NOT NULL,
id_pelicula		INT NOT NULL,
id_cliente		INT NOT NULL,
id_horario		INT NOT NULL,

FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_horario) REFERENCES horarios(id_horario)
);

SELECT * FROM cines;
SELECT * FROM clientes;
SELECT * FROM peliculas;
SELECT * FROM horarios;
SELECT * FROM entradas;

DESCRIBE cines;
DESCRIBE clientes;
DESCRIBE peliculas;
DESCRIBE horarios;
DESCRIBE entradas;