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

-- Volcando estructura para tabla facturas_db.cabecera_factura
CREATE TABLE IF NOT EXISTS `cabecera_factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_cruce` bigint(20) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_expedicion` date DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `medio_pago` bigint(20) DEFAULT NULL,
  `plazo` bigint(20) DEFAULT NULL,
  `prefijo` varchar(255) DEFAULT NULL,
  `tipo_entrega` bigint(20) DEFAULT NULL,
  `tipo_negociacion` varchar(255) DEFAULT NULL,
  `tipo_operacion` bigint(20) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `codigo_factura` bigint(20) DEFAULT NULL,
  `numero_factura` bigint(20) DEFAULT NULL,
  `id_estado_factura` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.cabecera_factura: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `cabecera_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabecera_factura` ENABLE KEYS */;

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

-- Volcando datos para la tabla facturas_db.columnas_tb_parametros: ~24 rows (aproximadamente)
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

-- Volcando estructura para tabla facturas_db.descuentos_recargos_factura
CREATE TABLE IF NOT EXISTS `descuentos_recargos_factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_descuento` bigint(20) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `is_porcentaje` bit(1) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `numero_linea` varchar(255) DEFAULT NULL,
  `porcentaje` varchar(255) DEFAULT NULL,
  `tipo_desc_recar` varchar(255) DEFAULT NULL,
  `cabecera_factura_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk6yu7jdrwejgb33txyvu5e3n8` (`cabecera_factura_id`),
  CONSTRAINT `FKk6yu7jdrwejgb33txyvu5e3n8` FOREIGN KEY (`cabecera_factura_id`) REFERENCES `cabecera_factura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.descuentos_recargos_factura: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `descuentos_recargos_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuentos_recargos_factura` ENABLE KEYS */;

-- Volcando estructura para tabla facturas_db.detalle_factura
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` bigint(20) DEFAULT NULL,
  `descuento` bigint(20) DEFAULT NULL,
  `descuento_monto` bit(1) DEFAULT NULL,
  `gratis` bit(1) DEFAULT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `id_tasa_impuesto` bigint(20) DEFAULT NULL,
  `id_tipo_impuesto` bigint(20) DEFAULT NULL,
  `recargo` bigint(20) DEFAULT NULL,
  `recargo_monto` bit(1) DEFAULT NULL,
  `valor_bruto` bigint(20) DEFAULT NULL,
  `valor_descuento` bigint(20) DEFAULT NULL,
  `valor_impuesto` bigint(20) DEFAULT NULL,
  `valor_recargo` bigint(20) DEFAULT NULL,
  `valor_sub_total` bigint(20) DEFAULT NULL,
  `valor_total` bigint(20) DEFAULT NULL,
  `cabecera_factura_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlr5u49qchadvgdystdwqc3kap` (`cabecera_factura_id`),
  CONSTRAINT `FKlr5u49qchadvgdystdwqc3kap` FOREIGN KEY (`cabecera_factura_id`) REFERENCES `cabecera_factura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.detalle_factura: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;

-- Volcando estructura para tabla facturas_db.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.factura: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;

-- Volcando estructura para tabla facturas_db.rango_numeracion
CREATE TABLE IF NOT EXISTS `rango_numeracion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `fecha_resolucion` varchar(255) DEFAULT NULL,
  `numero_actual` bigint(20) DEFAULT NULL,
  `numero_desde` bigint(20) DEFAULT NULL,
  `numero_hasta` bigint(20) DEFAULT NULL,
  `numero_resolucion` varchar(255) DEFAULT NULL,
  `prefijo` varchar(255) DEFAULT NULL,
  `tipo_documento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.rango_numeracion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rango_numeracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `rango_numeracion` ENABLE KEYS */;

-- Volcando estructura para tabla facturas_db.tablas_parametros
CREATE TABLE IF NOT EXISTS `tablas_parametros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `nombre_tabla` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.tablas_parametros: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tablas_parametros` DISABLE KEYS */;
INSERT INTO `tablas_parametros` (`id`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `nombre_tabla`) VALUES
	(1, 'La entregas disponibles', '2020-09-26 02:10:32.000000', '2020-09-26 02:10:36.000000', 'TIPO_ENTREGA'),
	(2, 'Las diferentes operaciones a trabajar', '2020-09-26 03:08:47.000000', '2020-09-26 03:08:50.000000', 'TIPO_OPERACION'),
	(3, 'Los medios de pagos a recibir', '2020-09-26 03:13:28.000000', '2020-09-26 03:13:31.000000', 'MEDIO_PAGO'),
	(4, 'Los diferentes descuentos a entregar', '2020-09-26 03:13:54.000000', '2020-09-26 03:13:55.000000', 'TIPO_DESCUENTO'),
	(5, 'Los diferentes tipos de documentos para el rango de numeración', '2020-11-16 16:52:45.000000', '2020-11-16 16:52:48.000000', 'TIPO_DOCUMENTO_RN'),
	(6, 'Estados que puede tener una factura', '2020-11-17 21:28:18.000000', '2020-11-17 21:28:20.000000', 'ESTADOS_FACTURA');
/*!40000 ALTER TABLE `tablas_parametros` ENABLE KEYS */;

-- Volcando estructura para tabla facturas_db.totales_factura
CREATE TABLE IF NOT EXISTS `totales_factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `monto_base` bigint(20) DEFAULT NULL,
  `total_impuesto` bigint(20) DEFAULT NULL,
  `total_venta` bigint(20) DEFAULT NULL,
  `valor_bruto` bigint(20) DEFAULT NULL,
  `valor_descuento` bigint(20) DEFAULT NULL,
  `valor_recargo` bigint(20) DEFAULT NULL,
  `cabecera_factura_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh55sroa4dbfquxs6ubnsyfjd4` (`cabecera_factura_id`),
  CONSTRAINT `FKh55sroa4dbfquxs6ubnsyfjd4` FOREIGN KEY (`cabecera_factura_id`) REFERENCES `cabecera_factura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla facturas_db.totales_factura: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `totales_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `totales_factura` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
