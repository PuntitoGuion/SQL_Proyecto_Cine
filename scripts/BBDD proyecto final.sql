CREATE SCHEMA cinema;
USE cinema;
-- Se crean todas las tablas --
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


-- Agregamos datos a la base --

-- Tabla cines
INSERT INTO `cines` VALUES 
(0,'Cinemark','Soleil',37),
(1,'Hoyts','Moron',6),
(2,'Hoyts','Unicenter',31),
(3,'Hoyts','Dot',39),
(4,'Cinemark','Malvinas Argentinas',41),
(5,'Cinemark','San Justo',16),
(6,'Cinemark','Caballito',32),
(7,'Cinemark','Palermo',5),
(8,'Hoyts','Abasto',24),
(9,'Cinemark','Tortugas',21),
(10,'Hoyts','Moreno',43),
(11,'Cinemark','Puerto Madero',16),
(12,'Cinemark','Avellaneda',16),
(13,'Hoyts','Temperley',21),
(14,'Hoyts','Quilmes',18),
(15,'Hoyts','Rosario',8);

-- Tabla clientes
INSERT INTO `clientes` VALUES 
(0,'Ana García',13,'Drama\r'),
(1,'Juan Ortiz',25,'Comedia\r'),
(2,'Andrea López',38,'Acción\r'),
(3,'Luisa Torres',19,'Terror\r'),
(4,'Rafael Flores',34,'Drama\r'),
(5,'Laura Sánchez',30,'Aventura\r'),
(6,'Diego Ramírez',31,'Comedia\r'),
(7,'Daniela Pérez',13,'Ciencia ficción\r'),
(8,'Eduardo González',43,'Terror\r'),
(9,'Brenda Hernández',23,'Suspense\r'),
(10,'Gabriel Jiménez',25,'Animación\r'),
(11,'Ana Isabel Vega',40,'Drama\r'),
(12,'Daniel Castillo',31,'Fantasía\r'),
(13,'María Ramírez',35,'Acción\r'),
(14,'Andrés Hernández',19,'Romance\r'),
(15,'Alejandra Ortiz',25,'Misterio\r'),
(16,'Oscar Flores',28,'Comedia\r'),
(17,'Paulina Torres',37,'Thriller\r'),
(18,'Santiago Sánchez',20,'Drama\r'),
(19,'Gabriela López',36,'Acción\r'),
(20,'Juanita Sánchez',22,'Comedia\r'),
(21,'Carmen Gutiérrez',25,'Drama\r'),
(22,'José García',29,'Acción\r'),
(23,'Ana María Fernández',33,'Ciencia ficción\r'),
(24,'Carlos González',28,'Aventura\r'),
(25,'Laura Pérez',14,'Terror\r'),
(26,'Manuel Martínez',30,'Animación\r'),
(27,'Sofía Hernández',15,'Misterio\r'),
(28,'Luisa Díaz',16,'Suspense\r'),
(29,'Fernando Ruiz',18,'Documental\r'),
(30,'Claudia Ortiz',19,'Musical\r'),
(31,'Mario Flores',30,'Western\r'),
(32,'Paula Álvarez',27,'Histórico\r'),
(33,'Ricardo Castro',40,'Fantasía\r'),
(34,'Valentina Torres',20,'Cine negro\r'),
(35,'Santiago Vega',20,'Policiaco\r'),
(36,'Mariana Vargas',27,'Guerra\r'),
(37,'Antonio Jiménez',35,'Romántico\r'),
(38,'Ana González',14,'Superhéroes\r'),
(39,'Mauricio Rodríguez',35,'Deportivo\r'),
(40,'Ana Lucía Pérez',13,'Biográfico\r'),
(41,'Samuel González',27,'Infantil\r'),
(42,'Ana Sofía Hernández',36,'Catástrofes\r'),
(43,'Raúl Ramírez',37,'Road movie\r'),
(44,'Lucía Martínez',38,'Parodia\r'),
(45,'Eduardo Gómez',37,'Espionaje\r'),
(46,'Maribel Reyes',29,'Épico\r'),
(47,'Juan Carlos Castro',30,'Erótico\r'),
(48,'Andrea Moreno',16,'Gore\r'),
(49,'Jorge López',33,'Drama\r'),
(50,'Andrea Vásquez',31,'Comedia\r'),
(51,'Eduardo Torres',38,'Acción\r'),
(52,'María González',30,'Terror\r'),
(53,'Luis Ramírez',24,'Drama\r'),
(54,'Sofía Gómez',27,'Aventura\r'),
(55,'Rafaela Flores',33,'Comedia\r'),
(56,'Martín Martínez',38,'Ciencia ficción\r'),
(57,'Ana Isabel Hernández',35,'Terror\r'),
(58,'Ricardo Jiménez',23,'Suspense\r'),
(59,'Ana Laura García',23,'Animación\r'),
(60,'Samuel Flores',37,'Drama\r'),
(61,'Isabel Cruz',21,'Fantasía\r'),
(62,'Diego Sánchez',15,'Acción\r'),
(63,'Ana Paula Ortiz',18,'Romance\r'),
(64,'Julio César Pérez',14,'Misterio\r'),
(65,'Alejandra Aguilar',28,'Comedia\r'),
(66,'David López',40,'Thriller\r'),
(67,'Carolina Torres',21,'Drama\r'),
(68,'Juan José Hernández',13,'Acción\r'),
(69,'Gabriela Pérez',40,'Comedia\r'),
(70,'Javier Martínez',38,'Drama\r'),
(71,'Daniela Romero',39,'Acción\r'),
(72,'Daniel González',21,'Ciencia ficción\r'),
(73,'Claudia Vargas',15,'Aventura\r'),
(74,'Rodrigo Castro',25,'Terror\r'),
(75,'María Elena Jiménez',29,'Animación\r'),
(76,'Mauricio Pérez',29,'Misterio\r'),
(77,'Ana María Hernández',34,'Suspense\r'),
(78,'Pablo Rodríguez',21,'Documental\r'),
(79,'Ana Cecilia García',32,'Musical\r');

-- Tabla peliculas
INSERT INTO `peliculas` VALUES (0,'Mortal Kombat','Acción/Fantasía','2021-04-08',10),
(1,'Incredibles 2','Animación/Aventura','2018-06-05',14),
(2,'Bohemian Rhapsody ',' Musical/Drama','2018-10-24',10),
(3,'A Quiet Place Part II ','Terror/Suspense','2021-05-27',11),
(4,'The Fate of the Furious','Acción/Aventura','2017-04-14',3),
(5,'Wonder Woman','Superhéroes/Acción','2017-06-15',4),
(6,'The Croods','Animación/Aventura','2013-03-22',4),
(7,'Jumanji: The Next Level','Acción/Aventura','2019-12-13',14),
(8,'Blade Runner 2049','Ciencia ficción/Thriller','2017-10-06',14),
(9,'Dune','Ciencia ficción/Acción','2021-09-22',8),
(10,'Arrival','Ciencia ficción/Drama','2016-11-11',13),
(11,'Sing','Animación/Música','2016-12-21',5),
(12,'Rogue One: A Star Wars Story','Ciencia ficción/Acción','2016-12-16',3),
(13,'The Lion King','Animación/Aventura','2019-07-19',3),
(14,'Black Panther','Superhéroes/Acción','2018-02-16',2),
(15,'La La Land','Musical/Drama','2016-12-16',8),
(16,'Baby Driver','Acción/Crimen','2017-06-28',1),
(17,'Deadpool 2','Superhéroes/Acción','2018-05-18',11),
(18,'Spider-Man: No Way Home','Superhéroes/Acción','2021-12-15',11),
(19,'Moonlight','Drama','2016-12-02',12),
(20,'Jumanji: Welcome to the Jungle','Acción/Aventura','2017-12-20',1),
(21,'It','Terror/Drama','2017-09-08',12),
(22,'Cruella','Comedia/Drama','2021-05-28',14),
(23,'The Matrix Resurrections','Ciencia ficción/Acción','2021-12-22',2),
(24,'Wonder Woman 1984','Superhéroes/Acción','2020-12-16',14),
(25,'The Invisible Man','Terror/Thriller','2020-02-28',9),
(26,'Shang-Chi and the Legend of the Ten Rings','Superhéroes/Acción','2021-09-03',13),
(27,'Godzilla vs. Kong','Ciencia ficción/Acción','2021-03-24',7),
(28,'No Time to Die','Espionaje/Acción','2021-10-08',9),
(29,'Black Widow','Superhéroes/Acción','2021-07-09',1),
(30,'Thor: Ragnarok','Superhéroes/Acción','2017-10-27',4),
(31,'Avengers: Endgame','Superhéroes/Acción','2019-04-26',1),
(32,'Split','Terror/Thriller','2017-01-20',7),
(33,'The Dark Knight','Acción/Drama','2008-07-18',14),
(34,'Avengers: Infinity War','Superhéroes/Acción','2018-04-27',12);

-- Tabla horarios
INSERT INTO `horarios` VALUES 
(0,'09:15:00',11),
(1,'10:30:00',18),
(2,'11:45:00',30),
(3,'12:00:00',20),
(4,'13:00:00',11),
(5,'14:15:00',19),
(6,'15:30:00',14),
(7,'16:45:00',34),
(8,'18:00:00',20),
(9,'19:15:00',4),
(10,'20:30:00',24),
(11,'21:00:00',16),
(12,'22:15:00',12),
(13,'23:30:00',15),
(14,'00:45:00',4),
(15,'01:00:00',12),
(16,'09:15:00',3),
(17,'11:45:00',0),
(18,'14:15:00',26),
(19,'16:45:00',12),
(20,'18:00:00',18),
(21,'12:00:00',24),
(22,'09:15:00',28),
(23,'22:15:00',13),
(24,'14:15:00',34),
(25,'23:30:00',13),
(26,'10:30:00',34),
(27,'16:45:00',28),
(28,'21:00:00',27),
(29,'19:15:00',3),
(30,'11:45:00',29),
(31,'13:00:00',19),
(32,'20:30:00',4),
(33,'15:30:00',19),
(34,'09:15:00',20),
(35,'01:00:00',7),
(36,'16:45:00',25),
(37,'11:45:00',3),
(38,'00:45:00',24),
(39,'23:00:00',16),
(40,'15:30:00',12),
(41,'22:15:00',28),
(42,'11:45:00',11),
(43,'10:30:00',16),
(44,'23:00:00',24),
(45,'12:00:00',25),
(46,'14:15:00',26),
(47,'19:15:00',14),
(48,'09:15:00',19),
(49,'16:45:00',34),
(50,'20:30:00',29),
(51,'13:00:00',3),
(52,'18:00:00',4),
(53,'21:00:00',7),
(54,'09:15:00',21),
(55,'00:45:00',19),
(56,'11:45:00',26),
(57,'01:00:00',7),
(58,'23:30:00',8),
(59,'16:45:00',8),
(60,'16:45:00',6),
(61,'10:30:00',5),
(62,'22:15:00',3),
(63,'18:00:00',14),
(64,'09:15:00',11),
(65,'14:15:00',33),
(66,'23:00:00',25),
(67,'19:15:00',14),
(68,'15:30:00',10),
(69,'11:45:00',22),
(70,'21:00:00',20),
(71,'13:00:00',2),
(72,'20:30:00',14),
(73,'12:00:00',8),
(74,'23:30:00',8),
(75,'09:15:00',28),
(76,'16:45:00',0),
(77,'00:45:00',9),
(78,'11:45:00',2),
(79,'01:00:00',16),
(80,'09:15:00',23),
(81,'10:30:00',21),
(82,'11:45:00',13),
(83,'12:00:00',11),
(84,'13:00:00',6),
(85,'14:15:00',14),
(86,'15:30:00',25),
(87,'16:45:00',9),
(88,'18:00:00',16),
(89,'19:15:00',8),
(90,'20:30:00',25),
(91,'21:00:00',27),
(92,'22:15:00',17),
(93,'23:30:00',16),
(94,'00:45:00',18),
(95,'01:00:00',28),
(96,'09:15:00',27),
(97,'11:45:00',19),
(98,'14:15:00',15),
(99,'16:45:00',13),
(100,'18:00:00',3),
(101,'12:00:00',6),
(102,'09:15:00',9),
(103,'22:15:00',19),
(104,'14:15:00',15),
(105,'23:30:00',27),
(106,'10:30:00',5),
(107,'16:45:00',23),
(108,'21:00:00',31),
(109,'19:15:00',29),
(110,'11:45:00',18),
(111,'13:00:00',8),
(112,'20:30:00',27),
(113,'15:30:00',34),
(114,'09:15:00',9),
(115,'01:00:00',4),
(116,'16:45:00',15),
(117,'11:45:00',4),
(118,'00:45:00',17),
(119,'23:00:00',16),
(120,'15:30:00',21),
(121,'22:15:00',9),
(122,'11:45:00',21),
(123,'10:30:00',9),
(124,'23:00:00',25),
(125,'12:00:00',34),
(126,'14:15:00',9),
(127,'19:15:00',26),
(128,'09:15:00',29),
(129,'16:45:00',32),
(130,'20:30:00',18),
(131,'13:00:00',29),
(132,'18:00:00',17),
(133,'21:00:00',5),
(134,'09:15:00',16),
(135,'00:45:00',18),
(136,'11:45:00',17),
(137,'01:00:00',12),
(138,'23:30:00',13),
(139,'16:45:00',3),
(140,'16:45:00',10),
(141,'10:30:00',32),
(142,'22:15:00',32),
(143,'18:00:00',19),
(144,'09:15:00',0),
(145,'14:15:00',11),
(146,'23:00:00',18),
(147,'19:15:00',20),
(148,'15:30:00',7),
(149,'11:45:00',29),
(150,'21:00:00',11),
(151,'13:00:00',18),
(152,'20:30:00',29),
(153,'12:00:00',6),
(154,'23:30:00',32),
(155,'09:15:00',28),
(156,'16:45:00',2),
(157,'00:45:00',21),
(158,'11:45:00',30),
(159,'01:00:00',5),
(160,'09:15:00',3),
(161,'10:30:00',1),
(162,'11:45:00',33),
(163,'12:00:00',21),
(164,'13:00:00',20),
(165,'14:15:00',24),
(166,'15:30:00',3),
(167,'16:45:00',28),
(168,'18:00:00',19),
(169,'19:15:00',10),
(170,'20:30:00',16),
(171,'21:00:00',29),
(172,'22:15:00',23),
(173,'23:30:00',29),
(174,'00:45:00',24),
(175,'01:00:00',21),
(176,'09:15:00',10),
(177,'11:45:00',14),
(178,'14:15:00',31),
(179,'16:45:00',9),
(180,'18:00:00',12),
(181,'12:00:00',3),
(182,'09:15:00',7),
(183,'22:15:00',11),
(184,'14:15:00',26),
(185,'23:30:00',4),
(186,'10:30:00',2),
(187,'16:45:00',4),
(188,'21:00:00',4),
(189,'19:15:00',19),
(190,'11:45:00',28),
(191,'13:00:00',10),
(192,'20:30:00',17),
(193,'15:30:00',15),
(194,'09:15:00',13),
(195,'01:00:00',21),
(196,'16:45:00',32),
(197,'11:45:00',31),
(198,'00:45:00',13),
(199,'23:00:00',2),
(200,'15:30:00',17),
(201,'22:15:00',18),
(202,'11:45:00',30),
(203,'10:30:00',20),
(204,'23:00:00',14),
(205,'12:00:00',10),
(206,'14:15:00',12),
(207,'19:15:00',29),
(208,'09:15:00',12),
(209,'16:45:00',28),
(210,'20:30:00',26),
(211,'13:00:00',23),
(212,'18:00:00',33),
(213,'21:00:00',3),
(214,'09:15:00',13),
(215,'00:45:00',32),
(216,'11:45:00',8),
(217,'01:00:00',34),
(218,'23:30:00',3),
(219,'16:45:00',32),
(220,'16:45:00',29),
(221,'10:30:00',4),
(222,'22:15:00',25),
(223,'18:00:00',5),
(224,'09:15:00',27),
(225,'14:15:00',7),
(226,'23:00:00',6),
(227,'19:15:00',21),
(228,'15:30:00',3),
(229,'11:45:00',26),
(230,'21:00:00',24),
(231,'13:00:00',25),
(232,'20:30:00',28),
(233,'12:00:00',22),
(234,'23:30:00',11),
(235,'09:15:00',3),
(236,'16:45:00',1),
(237,'00:45:00',14),
(238,'11:45:00',32),
(239,'01:00:00',20),
(240,'09:15:00',3),
(241,'10:30:00',11),
(242,'11:45:00',22),
(243,'12:00:00',3),
(244,'13:00:00',32),
(245,'14:15:00',25),
(246,'15:30:00',5),
(247,'16:45:00',12),
(248,'18:00:00',26),
(249,'19:15:00',19),
(250,'20:30:00',18),
(251,'21:00:00',18),
(252,'22:15:00',27),
(253,'23:30:00',5),
(254,'00:45:00',0),
(255,'01:00:00',25),
(256,'09:15:00',17),
(257,'11:45:00',34),
(258,'14:15:00',14),
(259,'16:45:00',26),
(260,'18:00:00',15),
(261,'12:00:00',17),
(262,'09:15:00',2),
(263,'22:15:00',30),
(264,'14:15:00',26),
(265,'23:30:00',21),
(266,'10:30:00',16),
(267,'16:45:00',34),
(268,'21:00:00',26),
(269,'19:15:00',20),
(270,'11:45:00',32),
(271,'13:00:00',28),
(272,'20:30:00',16),
(273,'15:30:00',31),
(274,'09:15:00',4),
(275,'01:00:00',13),
(276,'16:45:00',8),
(277,'11:45:00',23),
(278,'00:45:00',14),
(279,'23:00:00',19),
(280,'15:30:00',22),
(281,'22:15:00',29),
(282,'11:45:00',30),
(283,'10:30:00',27),
(284,'23:00:00',31),
(285,'12:00:00',0),
(286,'14:15:00',12),
(287,'19:15:00',17),
(288,'09:15:00',31),
(289,'16:45:00',9),
(290,'20:30:00',10),
(291,'13:00:00',10),
(292,'18:00:00',16),
(293,'21:00:00',28),
(294,'09:15:00',4),
(295,'00:45:00',13),
(296,'11:45:00',25),
(297,'01:00:00',2),
(298,'23:30:00',15),
(299,'16:45:00',4),
(300,'16:45:00',26),
(301,'10:30:00',12),
(302,'22:15:00',11),
(303,'18:00:00',30),
(304,'09:15:00',31),
(305,'14:15:00',14),
(306,'23:00:00',9),
(307,'19:15:00',24),
(308,'15:30:00',22),
(309,'11:45:00',15),
(310,'21:00:00',29),
(311,'13:00:00',19),
(312,'20:30:00',25),
(313,'12:00:00',13),
(314,'23:30:00',31),
(315,'09:15:00',33),
(316,'16:45:00',27),
(317,'00:45:00',2),
(318,'11:45:00',31),
(319,'01:00:00',0),
(320,'09:15:00',23),
(321,'10:30:00',5),
(322,'11:45:00',15),
(323,'12:00:00',9),
(324,'13:00:00',3),
(325,'14:15:00',32),
(326,'15:30:00',20),
(327,'16:45:00',17),
(328,'18:00:00',21),
(329,'19:15:00',14),
(330,'20:30:00',20),
(331,'21:00:00',30),
(332,'22:15:00',3),
(333,'23:30:00',19),
(334,'00:45:00',25),
(335,'01:00:00',3),
(336,'09:15:00',12),
(337,'11:45:00',29),
(338,'14:15:00',5),
(339,'16:45:00',30),
(340,'18:00:00',23),
(341,'12:00:00',21),
(342,'09:15:00',2),
(343,'22:15:00',34),
(344,'14:15:00',3),
(345,'23:30:00',31),
(346,'10:30:00',22),
(347,'16:45:00',8),
(348,'21:00:00',9),
(349,'19:15:00',12),
(350,'11:45:00',4),
(351,'13:00:00',30),
(352,'20:30:00',3),
(353,'15:30:00',1),
(354,'09:15:00',6),
(355,'01:00:00',14),
(356,'16:45:00',11),
(357,'11:45:00',22);

-- Tabla entradas
INSERT INTO `entradas` VALUES 
(0,300,0,30,11,107),
(1,3000,1,32,48,40),
(2,1700,1,3,19,310),
(3,900,0,34,33,171),
(4,3000,1,16,53,202),
(5,900,1,21,42,228),
(6,1700,0,5,37,6),
(7,300,1,4,5,53),
(8,900,0,15,34,157),
(9,1700,1,34,16,351),
(10,900,0,33,15,39),
(11,300,1,32,37,56),
(12,3000,1,17,61,202),
(13,900,1,20,2,262),
(14,900,1,18,61,208),
(15,300,1,7,68,326),
(16,900,0,25,9,89),
(17,1700,0,33,54,245),
(18,3000,1,31,66,348),
(19,300,1,25,75,73),
(20,900,0,31,52,121),
(21,300,1,10,18,178),
(22,3000,0,4,30,186),
(23,3000,1,17,61,2),
(24,900,1,3,39,320),
(25,300,1,15,75,97),
(26,3000,0,23,79,31),
(27,900,1,29,74,291),
(28,1700,0,21,1,10),
(29,900,0,23,54,167),
(30,300,0,12,10,159),
(31,900,0,21,21,317),
(32,3000,1,17,57,306),
(33,300,1,28,21,286),
(34,3000,1,9,30,170),
(35,1700,0,13,40,255),
(36,300,0,14,43,105),
(37,3000,1,17,60,275),
(38,900,1,20,0,57),
(39,300,1,9,25,236),
(40,1700,0,9,63,163),
(41,900,0,3,17,207),
(42,3000,0,24,17,133),
(43,300,1,24,74,53),
(44,3000,0,0,37,57),
(45,900,0,1,71,263),
(46,900,0,31,8,319),
(47,300,0,29,51,86),
(48,3000,0,13,66,229),
(49,1700,1,31,2,126),
(50,900,0,29,78,22),
(51,300,1,15,35,229),
(52,300,1,9,40,53),
(53,900,0,21,26,306),
(54,1700,0,23,68,30),
(55,300,1,22,63,12),
(56,1700,0,5,22,146),
(57,900,0,24,10,323),
(58,300,1,3,12,316),
(59,3000,1,16,29,320),
(60,1700,0,31,40,95),
(61,900,0,23,72,267),
(62,3000,0,33,67,184),
(63,1700,0,10,5,292),
(64,900,1,23,69,37),
(65,900,0,11,79,275),
(66,300,0,0,73,267),
(67,1700,1,8,20,19),
(68,300,1,18,75,122),
(69,900,1,10,33,276),
(70,3000,1,16,14,146),
(71,1700,0,29,6,182),
(72,900,0,34,26,251),
(73,1700,1,29,5,248),
(74,900,1,1,58,7),
(75,300,1,10,77,212),
(76,300,1,4,54,61),
(77,900,0,8,38,321),
(78,1700,0,25,45,63),
(79,300,0,3,42,172),
(80,3000,1,0,26,356),
(81,300,1,15,13,230),
(82,1700,1,32,34,118),
(83,3000,0,18,46,119),
(84,900,1,25,21,33),
(85,1700,0,30,61,67),
(86,300,1,29,76,148),
(87,3000,0,1,5,101),
(88,900,1,24,62,157),
(89,900,1,17,24,108),
(90,300,1,20,53,62),
(91,3000,0,20,36,225),
(92,900,0,3,46,297),
(93,1700,1,17,1,215),
(94,3000,0,16,18,223),
(95,900,1,25,64,29),
(96,1700,0,16,76,334),
(97,300,0,18,49,290),
(98,300,0,26,17,324),
(99,900,0,25,45,239),
(100,1700,0,1,56,259),
(101,3000,1,12,53,221),
(102,300,1,6,66,146),
(103,3000,1,28,71,261),
(104,900,1,2,3,45),
(105,1700,0,31,72,67),
(106,3000,0,18,57,82),
(107,300,1,1,34,141);

-- Se crean las vistas --

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
ORDER BY cantidad_generos DESC;

-- Se crean Stored Procedures -- 

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

-- Se crean usuarios y permisos --

USE Mysql;

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

-- Se realizan transacciones --
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
(80,'Sergio Sola',32,"Comedia"),
(81,'Julián Ferrari',24,"Ciencia ficción"),
(82,'Rogelio Vidal',28,"Terror"),
(83,'Valeria Tamanti',26,"Aventura");
SAVEPOINT primerosCuatro;

-- Se agregan otros 4 registros más seguido de un SAVEPOINT
INSERT INTO clientes(id_cliente, nombre, edad, genero_preferido) VALUES
(84,'Ignacio Juri',44,"Misterio"),
(85,'Eduardo Lescinskas',49,"Animación"),
(86,'Andrea García',54,"Drama"),
(87,'Leonela Fernandez',18,"Comedia");
SAVEPOINT otrosCuatro;
SELECT * FROM clientes; -- Verifico los agregados

-- Si quisiera deshacer los ultimos registros agregados, podria hacer un ROLLBACK para volver al principio con la siguiente sentencia
ROLLBACK TO sinAgregados;
-- Se deja comentado la eliminacion de el SAVEPOINT primerosCuatros:
-- RELEASE primerosCuatro;

SELECT * FROM clientes; -- Verifico que hice ROLLBACK