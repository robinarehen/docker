-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.30 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para productos_db
CREATE DATABASE IF NOT EXISTS `productos_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `productos_db`;

-- Volcando estructura para tabla productos_db.lineas_productos
CREATE TABLE IF NOT EXISTS `lineas_productos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `sub_marca_producto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcks0rb263hslbhejxl3stepr5` (`sub_marca_producto_id`,`concepto`),
  CONSTRAINT `FKm2uwdeb6nhyebnsqgvdhmjhf7` FOREIGN KEY (`sub_marca_producto_id`) REFERENCES `sub_marcas_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla productos_db.lineas_productos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `lineas_productos` DISABLE KEYS */;
INSERT INTO `lineas_productos` (`id`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `sub_marca_producto_id`) VALUES
	(1, '130 Original', '130 Original', '2020-07-20 15:04:56.921000', '2020-07-20 15:04:56.921000', 1),
	(2, '214 For pencil', '214 For pencil', '2020-07-20 15:05:43.471000', '2020-07-20 15:05:43.471000', 2),
	(3, '140 Pocket', '140 Pocket', '2020-07-20 15:07:25.004000', '2020-07-20 15:07:25.004000', 3),
	(4, '130 Original', '130 Original', '2020-07-20 15:08:02.938000', '2020-07-20 15:08:02.938000', 4);
/*!40000 ALTER TABLE `lineas_productos` ENABLE KEYS */;

-- Volcando estructura para tabla productos_db.marcas_productos
CREATE TABLE IF NOT EXISTS `marcas_productos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `tipo_producto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkoxbuxmbkpo9o382et06105ay` (`tipo_producto_id`,`concepto`),
  CONSTRAINT `FKrl8rfg3mksja0xqs3gnwxgbry` FOREIGN KEY (`tipo_producto_id`) REFERENCES `tipos_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla productos_db.marcas_productos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `marcas_productos` DISABLE KEYS */;
INSERT INTO `marcas_productos` (`id`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `tipo_producto_id`) VALUES
	(1, '13 Paper Mate', '13 Paper Mate', '2020-07-20 15:02:08.900000', '2020-07-20 15:02:08.900000', 2),
	(2, '24 Sharpie', '24 Sharpie', '2020-07-20 15:02:37.563000', '2020-07-20 15:02:37.563000', 2);
/*!40000 ALTER TABLE `marcas_productos` ENABLE KEYS */;

-- Volcando estructura para tabla productos_db.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio_unitario_gratuito` double DEFAULT NULL,
  `precio_unitario_inventario` double DEFAULT NULL,
  `precio_unitario_venta` double NOT NULL,
  `linea_producto_id` bigint(20) NOT NULL,
  `tasa_impuesto_id` bigint(20) DEFAULT NULL,
  `tipo_impuesto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK32ijyj4dejkw4obunui531aw4` (`linea_producto_id`,`codigo`),
  KEY `FK8c7gax4naujdqjhapfcx8c072` (`tasa_impuesto_id`),
  KEY `FK9uco3jdsq5qgj387y4qae0pqm` (`tipo_impuesto_id`),
  CONSTRAINT `FK8c7gax4naujdqjhapfcx8c072` FOREIGN KEY (`tasa_impuesto_id`) REFERENCES `tasas_impuestos` (`id`),
  CONSTRAINT `FK9uco3jdsq5qgj387y4qae0pqm` FOREIGN KEY (`tipo_impuesto_id`) REFERENCES `tipos_impuestos` (`id`),
  CONSTRAINT `FKu52rlm7xp4s1rngk8khd9a9t` FOREIGN KEY (`linea_producto_id`) REFERENCES `lineas_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla productos_db.productos: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `codigo`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `nombre`, `precio_unitario_gratuito`, `precio_unitario_inventario`, `precio_unitario_venta`, `linea_producto_id`, `tasa_impuesto_id`, `tipo_impuesto_id`) VALUES
	(12, '3431', 'PLUMIG.PUNTO MICRO AZUL', '2020-08-27 08:18:08.478000', '2020-08-27 08:18:08.478000', 'PLUMIG.PUNTO MICRO AZUL', 500, 500, 1000, 1, 1, 1),
	(13, '3433', 'PLUMIG.PUNTO MICRO ROJO', '2020-08-27 08:19:13.335000', '2020-08-27 08:19:13.335000', 'PLUMIG.PUNTO MICRO ROJO', 500, 500, 1000, 1, 1, 1),
	(14, '30176', 'BORRADOR MIRADO BL CONT 3ERO', '2020-08-27 08:20:46.537000', '2020-08-27 08:20:46.537000', 'BORRADOR MIRADO BL CONT 3ERO', 450, 450, 1100, 2, 1, 1),
	(15, '30202', 'BORRADOR MIRADO BLANCO CONT', '2020-08-27 08:21:21.396000', '2020-08-27 08:21:21.396000', 'BORRADOR MIRADO BLANCO CONT', 450, 450, 1100, 2, 1, 1),
	(16, '20029', 'RESALT.ENFASIS ROSADO BX1', '2020-08-27 08:23:22.273000', '2020-08-27 08:23:22.273000', 'RESALT.ENFASIS ROSADO BX1', 400, 400, 900, 3, 1, 1),
	(17, '3480', 'RESALT. ENFASIS  T.AMAR.', '2020-08-27 08:23:56.319000', '2020-08-27 08:23:56.319000', 'RESALT. ENFASIS  T.AMAR.', 400, 400, 900, 3, 1, 1),
	(18, '3511', 'MARC.INDUST.FELTPEN AZUL', '2020-08-27 08:24:45.964000', '2020-08-27 08:24:45.964000', 'MARC.INDUST.FELTPEN AZUL', 500, 500, 1000, 4, 1, 1),
	(19, '3512', 'MARC.INDUST.FELTPEN ROJO', '2020-08-27 08:25:17.917000', '2020-08-27 08:25:17.917000', 'MARC.INDUST.FELTPEN ROJO', 500, 500, 1000, 4, 1, 1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla productos_db.sub_marcas_productos
CREATE TABLE IF NOT EXISTS `sub_marcas_productos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `marca_producto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKk4w8r81f1es1hou9snmiu8oic` (`marca_producto_id`,`concepto`),
  CONSTRAINT `FK5espgbg7v0osio8jo2mwsoh48` FOREIGN KEY (`marca_producto_id`) REFERENCES `marcas_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla productos_db.sub_marcas_productos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `sub_marcas_productos` DISABLE KEYS */;
INSERT INTO `sub_marcas_productos` (`id`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `marca_producto_id`) VALUES
	(1, '112 Microtrazo', '112 Microtrazo', '2020-07-20 15:04:35.909000', '2020-07-20 15:04:35.909000', 1),
	(2, '114 Mirado', '114 Mirado', '2020-07-20 15:05:24.973000', '2020-07-20 15:05:24.973000', 1),
	(3, '215 Enfasis', '215 Enfasis', '2020-07-20 15:07:09.072000', '2020-07-20 15:07:09.072000', 2),
	(4, '216 Feltpen', '216 Feltpen', '2020-07-20 15:07:47.693000', '2020-07-20 15:07:47.693000', 2);
/*!40000 ALTER TABLE `sub_marcas_productos` ENABLE KEYS */;

-- Volcando estructura para tabla productos_db.tasas_impuestos
CREATE TABLE IF NOT EXISTS `tasas_impuestos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `valor` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_m4kw86un9rvcsybmsru3jeih2` (`concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla productos_db.tasas_impuestos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tasas_impuestos` DISABLE KEYS */;
INSERT INTO `tasas_impuestos` (`id`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `valor`) VALUES
	(1, 'IVA 19%', 'IVA 19%', '2020-07-21 19:26:38.597000', '2020-07-21 19:28:49.250000', 19),
	(2, 'Impoconsumo 8%', 'Impoconsumo 8%', '2020-07-21 19:28:19.546000', '2020-07-21 19:33:27.703000', 8),
	(3, 'IVA 5%', 'IVA 5%', '2020-07-21 19:28:35.675000', '2020-07-21 19:28:35.675000', 5),
	(4, 'IVA 6%', 'IVA 6%', '2020-07-22 20:55:48.630000', '2020-08-19 15:41:51.943000', 6);
/*!40000 ALTER TABLE `tasas_impuestos` ENABLE KEYS */;

-- Volcando estructura para tabla productos_db.tipos_impuestos
CREATE TABLE IF NOT EXISTS `tipos_impuestos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `identificador` varchar(255) DEFAULT NULL,
  `requiere_tasa_impuesto` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKlpqciy7lx4vibtvda4rtb84h5` (`identificador`,`concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla productos_db.tipos_impuestos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos_impuestos` DISABLE KEYS */;
INSERT INTO `tipos_impuestos` (`id`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `identificador`, `requiere_tasa_impuesto`) VALUES
	(1, 'IVA', 'Impuesto de Valor Agregado', '2020-07-26 11:39:06.999000', '2020-07-26 23:35:40.572000', '1', b'1'),
	(2, 'IC', 'Impuesto al Consumo Departamental Nominal', '2020-07-26 22:44:44.554000', '2020-09-16 16:51:35.690000', '2', b'1'),
	(3, 'ICA', 'Impuesto de Industria, Comercio y Aviso', '2020-07-26 22:58:47.673000', '2020-07-26 23:02:23.548000', '3', b'0');
/*!40000 ALTER TABLE `tipos_impuestos` ENABLE KEYS */;

-- Volcando estructura para tabla productos_db.tipos_productos
CREATE TABLE IF NOT EXISTS `tipos_productos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2jv4cgjm2yi8t21qu3q2i7my8` (`concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla productos_db.tipos_productos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos_productos` DISABLE KEYS */;
INSERT INTO `tipos_productos` (`id`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 'Consumo', 'Consumo', '2020-07-15 19:03:37.976000', '2020-07-18 08:26:25.547000'),
	(2, 'Producto', 'Producto', '2020-07-15 19:03:48.528000', '2020-07-20 15:03:46.693000'),
	(3, 'Servicio', 'Servicio', '2020-07-15 19:12:55.058000', '2020-08-19 15:40:03.131000');
/*!40000 ALTER TABLE `tipos_productos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
