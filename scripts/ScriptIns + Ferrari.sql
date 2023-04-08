LOAD DATA INFILE './datos/cines.csv' -- Aqui debe ir la ruta exacta del archivo .csv para que lo encuentre correctamente
INTO TABLE cines
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE './datos/clientes.csv' -- Aqui debe ir la ruta exacta del archivo .csv para que lo encuentre correctamente
INTO TABLE clientes
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE './datos/peliculas.csv' -- Aqui debe ir la ruta exacta del archivo .csv para que lo encuentre correctamente
INTO TABLE peliculas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE './datos/horarios.csv' -- Aqui debe ir la ruta exacta del archivo .csv para que lo encuentre correctamente
INTO TABLE horarios
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE './datos/entradas.csv' -- Aqui debe ir la ruta exacta del archivo .csv para que lo encuentre correctamente
INTO TABLE entradas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;