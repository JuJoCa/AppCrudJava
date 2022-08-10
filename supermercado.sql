-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: supermercado
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_cat` varchar(150) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1000,'Despensa'),(1001,'Bebidas'),(1002,'Mascotas'),(1003,'Bebés'),(1004,'Cuidado Personal'),(1005,'Limpieza'),(1006,'Licores'),(1007,'Productos Naturales'),(1008,'Dermatologicos'),(1009,'Maquillaje'),(1010,'Bienestar Sexual'),(1011,'Hogar'),(1012,'Nutrición Deportiva'),(1013,'Pasabocas'),(1014,'Ferreteria'),(1015,'Libreria'),(1016,'Tecnología'),(1017,'Electrodomesticos'),(1018,'Productos de mar'),(1019,'Importados'),(1020,'Embarazo');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cli` varchar(50) NOT NULL,
  `direccion_cli` varchar(100) NOT NULL,
  `telefono_cli` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan Carvajal','cra 26 7-12','3136908708'),(2,'Anyi Gomez','cra 9 12-18','3107473205'),(3,'Claudia Barrios','cra 3 6-12','3132182108'),(4,'Fredy Martinez','cra 1 3-19','2936012706'),(5,'Orlando Luna','cra 9 5-49','3108724861'),(6,'Derly Cordoba','cra 1a 8-22','3149861230'),(7,'Katherin Carvajal','cra 9n 7-42','3219478565'),(8,'Jose Rosero','cra 21 23-41','3098786928'),(9,'David Gomez','cra 9 5-28','3128482834'),(10,'Andres Gutierrez','cra 23 12-54','3018262748'),(11,'Blanca Ceron','cra 21 21-34','3123142312'),(12,'Gerardo Narvaez','cra 9 12-16','3104872309'),(13,'Viviana Narvaez','cra 12 10-04','3122432176'),(14,'Andrea Ordoñez','cll 12 9-16','3158882034'),(15,'Andres Gomez','cra 3 2-10','3149992308'),(16,'Roxana Luna','cra 5n 5-2','3136662316'),(17,'Cristina Toro','cll 13 8-12','3211432098'),(18,'Ancizar Cifuentes','cra 10 11-26','3012123435'),(19,'Cesar Ordoñez','cra 9 12-34','3008786542'),(20,'Sofia Cordoba','cra 13 13-28','3150982346');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `id_fat` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(50) NOT NULL,
  `id_cli_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_fat`),
  KEY `id_cli_fk` (`id_cli_fk`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_cli_fk`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=624 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (600,'02-06-2022',1),(601,'02-06-2022',2),(602,'02-06-2022',3),(603,'03-06-2022',4),(604,'03-06-2022',5),(605,'03-06-2022',6),(606,'03-06-2022',7),(607,'04-06-2022',8),(608,'04-06-2022',11),(609,'05-06-2022',13),(610,'05-06-2022',3),(611,'06-06-2022',14),(612,'06-06-2022',20),(613,'07-06-2022',17),(614,'07-06-2022',16),(615,'08-06-2022',15),(616,'08-06-2022',13),(617,'09-06-2022',12),(618,'09-06-2022',9),(619,'09-06-2022',10),(620,'10-06-2022',18),(621,'10-06-2022',18),(622,'10-06-2022',19),(623,'10-06-2022',10);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_prod` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_prod` varchar(150) NOT NULL,
  `precio_prod` int(11) NOT NULL,
  `id_cat_fk` int(11) NOT NULL,
  `id_prov_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_prod`),
  KEY `id_cat_fk` (`id_cat_fk`),
  KEY `id_prov_fk` (`id_prov_fk`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_cat_fk`) REFERENCES `categorias` (`id_cat`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_prov_fk`) REFERENCES `proveedores` (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (200,'Arroz',45000,1000,900),(201,'Frijol',4000,1000,901),(202,'Lentejas',3500,1000,901),(203,'Aceite vegetal',25000,1000,902),(204,'Azúcar',20000,1000,902),(205,'Harina',2500,1000,903),(206,'Pasta',6000,1000,904),(213,'Galletas',9500,1000,905),(214,'Café',1100,1000,902),(215,'Avena',4500,1000,904),(216,'Hit',12000,1001,905),(217,'Pony malta',5800,1001,905),(218,'coca cola',8500,1001,906),(219,'Agua',8000,1001,906),(220,'vive100',3000,1001,906),(221,'Cerveza Poker',3500,1019,905),(222,'Cerveza Corona',5500,1019,905),(223,'casa para perro',100000,1002,907),(224,'cama mascota',60000,1002,907),(225,'peine mascota',15000,1002,907),(226,'peine mascota2',15000,1002,907),(227,'dispensador de agua',25000,1002,908),(228,'dispensador de alimento',25000,1002,908),(229,'comedero',10000,1002,908),(230,'collar',10000,1002,908),(231,'correa',10000,1002,908),(232,'placa mascota',7000,1002,908),(233,'Cuna',500000,1003,909),(234,'monitor para bebe',75000,1003,909),(235,'caminador',345000,1003,909),(236,'coche para bebe',678000,1003,909),(237,'termometro',25000,1003,909),(238,'bañera',40000,1003,909),(239,'pañales',24000,1003,909),(240,'calcetines',5000,1003,909),(241,'babero',10000,1003,909),(242,'Toallitas humedas',17000,1003,909),(243,'Manta de algodon',30000,1003,909),(244,'Gorro para bebé',13000,1003,909),(245,'jabon facial',4000,1004,910),(246,'jabon corporal',2500,1004,910),(247,'shampoo',16000,1004,910),(248,'crema de dientes',6000,1004,910),(249,'cepillo de dientes',20000,1004,910),(250,'Talcos',26000,1004,910),(251,'locion hombre',25000,1004,910),(252,'locion mujer',25000,1004,910),(253,'desodorante',10000,1004,910),(254,'papel higienico',25000,1004,910),(255,'alcohol',6800,1004,910),(256,'crema corporal',27500,1004,910),(257,'Limpiavidrios',10000,1005,910),(258,'Desengrasante',17000,1005,910),(259,'Cepillo para baño',19000,1005,910),(260,'recogedor',11000,1005,910),(261,'Escoba',12000,1005,910),(262,'Trapeador',15000,1005,910),(263,'Esponjas',4000,1005,910),(264,'Productos Insecticidas',20000,1005,910),(265,'Guantes',5500,1005,910),(266,'Detergente',20000,1005,910),(267,'Ron',70000,1006,911),(268,'Vodka',80000,1006,911),(269,'Miel de rosas',2000,1007,912),(270,'Té verde',13000,1007,912),(271,'Serum',120000,1008,913),(272,'Contorno de ojos',50000,1008,913),(273,'Rubor',10000,1009,914),(274,'Labial',5000,1009,914),(275,'Condones',15000,1010,915),(276,'Tapete',25000,1011,915),(277,'Proteina',85000,1012,915),(278,'De todito',5000,1013,916),(279,'Martillo',32000,1014,917),(280,'Clavos',2000,1014,917),(281,'Cuaderno',1000,1015,917),(282,'Computador',1500000,1016,918),(283,'Licuadora',153000,1017,918),(284,'Camarones',20000,1018,919),(288,'Atun',4500,1000,914),(290,'Perfumes',50000,1004,922),(291,'Talcos para Pies',25000,1004,922);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_prov` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prov` varchar(50) NOT NULL,
  `direccion_prov` varchar(100) NOT NULL,
  `telefono_prov` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (900,'Julio de Marín','CARRERA 57 B 137 88','0973546674'),(901,'Julián Águila Pareja','CARRERA 69 D 24 15 IN 1 AP 301','8539112903'),(902,'Lina Villar Becerra','CALLE 100 18 12 OFC 202','2889364735'),(903,'Arturo Morera Correa','CALLE 70 BIS 4 41','0825582901'),(904,'Rocío Castells Gomis','CARRERA 15 80 36 OF 502','4165366658'),(905,'Olga Castejón Arjona','CARRERA 15 124 65 OF 207','6667193135'),(906,'Manu Guardiola Colomer','CALLE 6 D 5 51','1578144098'),(907,'Andrea Torres Ruiz Velasco','CARRERA 69 N 12 18','8203654'),(908,'Alejandra Giraldo Gomez','CARRERA N 32 1','8201586'),(909,'Andres Rodriguez Martinez','CALLE 5 N 2 13','8209845'),(910,'Tatiana García Gómez','CARRERA 2 N 19 12','8207653'),(911,'David López Gónzales','CALLE 9 N 12 5','8201345'),(912,'Juan Angel Gutierrez','CARRERA 2 N 25 15','8205598'),(913,'Jaime Alfonso Pabón','CALLE 3 N 8 12','8205621'),(914,'Daniel Gómez Mendéz','CARRERA 9 N 13 14','8207843'),(915,'Amparo Pacheco Patiño','CALLE 6 N 9 18','8201218'),(916,'Carlos Andres Hernandez','CALLE 13N D 17 10','8204589'),(917,'Brayan Sanchez Perez','CARRERA 21 N 15 23','8201876'),(918,'Salome Erazo Gómez','CARRERA 15 D 2 45','8207689'),(919,'Alexandra Adrada Polo','CALLE 2 N 4 43','8207532'),(922,'Tatiana Gomez','Carrera 9 12-18','3107473205');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_us` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_us`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'jujoca14','1234','jjcarvajal@unicauca.edu.co'),(2,'anyit','1234','anyit@unicauca.edu.co'),(3,'Claudia76','4321','clarebado@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_ven` int(11) NOT NULL AUTO_INCREMENT,
  `id_fat_fk` int(11) NOT NULL,
  `id_prod_fk` int(11) NOT NULL,
  `cantidad_ven` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ven`),
  KEY `id_fat_fk` (`id_fat_fk`),
  KEY `id_prod_fk` (`id_prod_fk`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_fat_fk`) REFERENCES `facturas` (`id_fat`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_prod_fk`) REFERENCES `productos` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=853 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (800,600,200,1),(801,600,202,2),(802,600,205,1),(803,600,202,3),(804,600,222,1),(805,601,223,1),(806,601,224,1),(807,601,225,4),(808,601,240,2),(809,601,223,1),(810,601,254,1),(811,602,260,5),(812,602,227,1),(813,602,222,2),(814,602,221,1),(815,602,228,1),(816,602,266,1),(817,603,266,2),(818,603,269,1),(819,603,264,1),(820,603,270,2),(821,604,271,1),(822,604,271,1),(823,604,279,3),(824,604,278,1),(825,604,271,1),(826,604,278,3),(827,605,272,1),(828,605,273,1),(829,605,276,3),(830,605,279,1),(831,605,264,1),(832,606,269,1),(833,606,273,3),(834,606,274,1),(835,607,272,1),(836,607,276,1),(837,607,277,1),(838,607,271,1),(839,607,275,1),(840,608,278,1),(841,608,273,1),(842,608,271,1),(843,609,272,2),(844,609,277,1),(845,609,279,1),(846,609,278,3),(847,610,271,1),(848,610,273,1),(849,610,277,1),(850,611,277,3),(851,611,274,1),(852,611,275,2);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-01 21:00:30
