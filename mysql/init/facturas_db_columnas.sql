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


-- Volcando estructura de base de datos para facturas_db
CREATE DATABASE IF NOT EXISTS `facturas_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `facturas_db`;

-- Volcando estructura para tabla facturas_db.columnas_tb_parametros
CREATE TABLE IF NOT EXISTS `columnas_tb_parametros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `tabla_parametro_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqh5hw66lcgrkiylsysxmvbne4` (`tabla_parametro_id`),
  CONSTRAINT `FKqh5hw66lcgrkiylsysxmvbne4` FOREIGN KEY (`tabla_parametro_id`) REFERENCES `tablas_parametros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.columnas_tb_parametros: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `columnas_tb_parametros` DISABLE KEYS */;
INSERT INTO `columnas_tb_parametros` (`id`, `codigo`, `concepto`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `tabla_parametro_id`) VALUES
	(1, 'CFR', 'Costo y flete', NULL, '2020-09-26 02:11:15.000000', '2020-09-26 02:11:17.000000', 1),
	(2, 'CIF', 'Costo, flete y seguro', NULL, '2020-09-26 00:49:17.356000', '2020-09-26 00:49:17.358000', 1),
	(3, '1', 'Combustibles', 'Combustibles', '2020-09-26 18:49:54.144000', '2020-09-26 18:49:54.144000', 2),
	(5, '1', 'Instrumento no definido', 'Instrumento no definido', '2020-09-26 18:52:40.252000', '2020-09-26 18:52:40.252000', 3),
	(6, '0', 'Descuento por impuesto asumido', 'Descuento por impuesto asumido', '2020-09-28 18:10:33.414000', '2020-09-28 18:10:33.414000', 4),
	(7, '1', 'Pague uno lleve otro', 'Pague uno lleve otro', '2020-09-28 18:17:23.010000', '2020-09-28 18:17:23.010000', 4),
	(8, 'CIP', 'Transporte y Seguro Pagados hasta', 'Transporte y Seguro Pagados hasta', '2020-09-28 18:33:52.974000', '2020-09-28 18:33:52.974000', 1),
	(9, '2', 'Emisor es Autorretenedor', 'Emisor es Autorretenedor', '2020-09-28 18:38:44.465000', '2020-09-28 18:38:44.465000', 2),
	(10, '2', 'Crédito ACH', 'Crédito ACH', '2020-09-28 18:39:14.501000', '2020-09-28 18:39:14.501000', 3),
	(11, '3', 'Débito ACH', 'Débito ACH', '2020-09-28 18:39:33.589000', '2020-09-28 18:39:33.589000', 3),
	(12, '2', 'Descuentos contractulales', 'Descuentos contractulales', '2020-09-28 18:41:33.507000', '2020-09-28 18:41:33.507000', 4),
	(13, '3', 'Excluidos y Exentos', 'Excluidos y Exentos', '2020-09-28 18:46:09.702000', '2020-09-28 18:46:09.702000', 2),
	(14, 'CPT', 'Transporte Pagado Hasta', 'Transporte Pagado Hasta', '2020-09-28 20:05:12.239000', '2020-09-28 20:05:12.239000', 1),
	(15, '4', 'Reversión débito de demanda ACH', 'Reversión débito de demanda ACH', '2020-10-03 12:04:45.909000', '2020-10-03 12:04:45.910000', 3),
	(16, '4', 'Descuento por pronto pago', 'Descuento por pronto pago', '2020-10-03 12:14:53.896000', '2020-10-03 12:14:53.896000', 4),
	(17, 'FC', 'Factura', '', '2020-11-16 16:17:49.850000', '2020-11-16 16:17:49.850000', 5),
	(18, 'FCE', 'Factura de Exportación', 'Pendiente', '2020-11-16 16:19:49.041000', '2020-11-16 16:19:49.041000', 5),
	(19, 'FCC', 'Factura de Contingencia', 'Pendiente', '2020-11-16 16:20:19.893000', '2020-11-16 16:20:19.893000', 5),
	(20, 'NC', 'Nota Crédito', 'Nota Crédito', '2020-11-16 17:01:05.979000', '2020-11-16 17:01:05.979000', 5),
	(21, 'ND', 'Nota Débito', 'Nota Débito', '2020-11-16 17:01:21.163000', '2020-11-16 17:01:21.163000', 5),
	(22, 'PENDIENTE', 'Pendiente', 'Estado inicial de la factura', '2020-11-18 18:48:56.000000', '2020-11-18 18:48:59.000000', 6),
	(23, 'APROBADA', 'Aprobada', 'Estado aprobado para entregar al cliente', '2020-11-18 18:51:55.000000', '2020-11-18 18:51:57.000000', 6),
	(24, 'RECHAZADA', 'Rechazada', 'Estado que permite modificar la factura', '2020-11-18 19:54:58.000000', '2020-11-18 19:55:00.000000', 6),
	(25, 'ANULADA', 'Anulada', 'Estado que no permite modificar ni entregar la factura al cliente', '2020-11-18 19:55:48.000000', '2020-11-18 19:55:55.000000', 6);
/*!40000 ALTER TABLE `columnas_tb_parametros` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
