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


-- Volcando estructura de base de datos para clientes_db
CREATE DATABASE IF NOT EXISTS `clientes_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `clientes_db`;

-- Volcando estructura para tabla clientes_db.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(255) DEFAULT NULL,
  `celular` bigint(20) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `documento` varchar(255) NOT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `nombre_comercial` varchar(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `tipo_documento_id` bigint(20) DEFAULT NULL,
  `tipo_contribuyente_id` bigint(20) DEFAULT NULL,
  `regimen_contributivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK60e0aupbty28ugk3cgewmau17` (`tipo_documento_id`,`documento`),
  KEY `FK2rusjc3krr2ctk7xe3uaak46a` (`tipo_contribuyente_id`),
  CONSTRAINT `FK2rusjc3krr2ctk7xe3uaak46a` FOREIGN KEY (`tipo_contribuyente_id`) REFERENCES `tipos_contribuyentes` (`id`),
  CONSTRAINT `FKqerxdg5bvo6941uruyn1ointf` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipos_documentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla clientes_db.clientes: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla clientes_db.tipos_contribuyentes
CREATE TABLE IF NOT EXISTS `tipos_contribuyentes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2jmscenho08anvy76qyut6kwe` (`concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla clientes_db.tipos_contribuyentes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos_contribuyentes` DISABLE KEYS */;
INSERT INTO `tipos_contribuyentes` (`id`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 'Natural', 'Persona Natural', '2020-08-18 10:32:30.212000', '2020-08-18 10:32:30.213000'),
	(2, 'Juridica', 'Persona Juridica', '2020-08-18 10:32:52.986000', '2020-08-19 13:32:43.056000');
/*!40000 ALTER TABLE `tipos_contribuyentes` ENABLE KEYS */;

-- Volcando estructura para tabla clientes_db.tipos_documentos
CREATE TABLE IF NOT EXISTS `tipos_documentos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_71ddk3px645w0unbl3wtp74ln` (`concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla clientes_db.tipos_documentos: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
INSERT INTO `tipos_documentos` (`id`, `codigo`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, '11', 'R.C', 'Registro civil', '2020-08-10 12:16:23.729000', '2020-08-10 12:17:46.379000'),
	(2, '12', 'T.I', 'Tarjeta de identidad', '2020-08-11 08:36:06.055000', '2020-08-11 08:36:06.055000'),
	(3, '13', 'C.C', 'Cédula de ciudadanía', '2020-08-11 08:36:29.296000', '2020-08-11 08:36:29.296000'),
	(4, '21', 'T.E', 'Tarjeta de extranjería', '2020-08-18 12:37:11.973000', '2020-08-18 12:37:11.973000'),
	(5, '22', 'C.E', 'Cédula de extranjería', '2020-08-18 12:37:35.817000', '2020-08-18 12:37:35.817000'),
	(6, '31', 'NIT', 'Número Identificación Tributaria', '2020-08-18 12:38:58.728000', '2020-08-19 19:15:27.884000');
/*!40000 ALTER TABLE `tipos_documentos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
