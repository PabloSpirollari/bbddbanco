 --Creacion de base de datos con los insert de los datos.--
 DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) NOT NULL,
  `apellido_cliente` varchar(45) NOT NULL,
  `genero_cliente` varchar(1) NOT NULL,
  `telefono_cliente` decimal(12,0) NOT NULL,
  `mail_cliente` varchar(35) NOT NULL,
  `numero_documento` decimal(10,0) NOT NULL,
  `numero_tributario` decimal(13,0) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo_cliente` int NOT NULL,
  `estado_civil` varchar(1) NOT NULL,
  `profesion` varchar(40) DEFAULT NULL,
  `nacionalidad` int NOT NULL,
  `fecha_alta` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente_UNIQUE` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

INSERT INTO `clientes` VALUES (1,'JUAN','GONZALEZ','M',1112345678,'JUANGONZALEZ',11112222,20137416551,'1985-12-10',1,'C',NULL,1,'2022-10-14'),
(2,'CARLOS','DOMINGUEZ','M',1112345678,'CARLOSDOMINGUEZ',45316410,22453164103,'1968-10-08',2,'S',NULL,1,'2022-10-14'),
(3,'MARIO','RABINOVICH','M',1112345678,'MARIORABINOVICH',61356062,30613560625,'1978-09-05',1,'C',NULL,1,'2022-10-14'),
(4,'MARIA','SUAREZ','F',1112345678,'MARIASUAREZ',56430963,40564309635,'1989-05-06',1,'S',NULL,1,'2022-10-14'),
(5,'JUANA','ZARATE','F',1112345678,'JUANAZARATE',66561291,20665612915,'1987-04-25',2,'S',NULL,1,'2022-10-14'),
(6,'SOFIA','VAZQUEZ','F',1112345678,'SOFIAVAZQUEZ',54630552,21546305527,'1957-04-15',1,'S',NULL,1,'2022-10-14'),
(7,'FLORENCIA','MENA','F',1112345678,'FLORENCIAMENA',22726923,22227269236,'1974-05-28',1,'S',NULL,1,'2022-10-14'),
(8,'NICOLAS','RODRIGUEZ','M',1112345678,'NICOLASRODRIGUEZ',46521162,23465211623,'1976-08-09',3,'C',NULL,1,'2022-10-14'),
(9,'IGNACIO','TORRES','M',1112345678,'IGNACIOTORRES',20796553,20207965531,'1969-11-14',3,'C',NULL,1,'2022-10-14'),
(10,'JORGE','PENA','M',1112345678,'JORGEPENA',61870790,20618707900,'1949-07-18',5,'V',NULL,1,'2022-10-14'),
(11,'Pablo','Spirollari','M',1112345678,'PABLOSPIRO@GMAIL.COM',11223344,20112233440,'1996-08-01',1,'S','Analista Funcional',1,'2022-10-21');


DROP TABLE IF EXISTS `clientes_cuentas`;
CREATE TABLE `clientes_cuentas` (
  `id_cuentas` decimal(12,0) NOT NULL,
  `tipo_cuenta` int NOT NULL,
  `tipo_moneda` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  `saldo` decimal(13,2) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_cuentas`),
  UNIQUE KEY `id_cuentas_UNIQUE` (`id_cuentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `clientes_cuentas` VALUES (100000000001,1,1,'2022-10-15','2024-01-01',5000.00,1),
(100000000002,1,1,'2022-10-15','2024-01-01',200000.00,2),
(100000000003,2,2,'2022-10-15','2024-01-01',6000.00,3),
(100000000004,2,2,'2022-10-15','2024-01-01',8000.00,3),
(100000000005,1,1,'2022-10-19','2024-01-01',50000.00,5);


DROP TABLE IF EXISTS `clientes_inversiones`;
CREATE TABLE `clientes_inversiones` (
  `id_inversion` decimal(8,0) NOT NULL,
  `id_cuenta` decimal(12,0) NOT NULL,
  `tipo_inversion` int NOT NULL,
  `tipo_moneda` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  PRIMARY KEY (`id_inversion`),
  UNIQUE KEY `id_inversion_UNIQUE` (`id_inversion`),
  UNIQUE KEY `id_cuenta_UNIQUE` (`id_cuenta`),
  KEY `fk_clientes_inversiones_tipo_inversion1` (`tipo_inversion`),
  CONSTRAINT `fk_clientes_inversiones_tipo_inversion1` FOREIGN KEY (`tipo_inversion`) REFERENCES `tipo_inversion` (`tipo_inversion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `clientes_prestamos`;
CREATE TABLE `clientes_prestamos` (
  `id_prestamo` decimal(8,0) NOT NULL,
  `id_cuenta` decimal(12,0) NOT NULL,
  `tipo_prestamo` int NOT NULL,
  `tipo_moneda` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  UNIQUE KEY `id_prestamo_UNIQUE` (`id_prestamo`),
  UNIQUE KEY `id_cuenta_UNIQUE` (`id_cuenta`),
  KEY `fk_clientes_prestamos_tipo_prestamo1` (`tipo_prestamo`),
  CONSTRAINT `fk_clientes_prestamos_tipo_prestamo1` FOREIGN KEY (`tipo_prestamo`) REFERENCES `tipo_prestamo` (`tipo_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `clientes_prestamos` VALUES (80000001,100000000009,3,1,'2022-10-14','2024-01-01'),
(80000002,100000000010,1,2,'2022-10-14','2024-01-01');


DROP TABLE IF EXISTS `clientes_productos`;
CREATE TABLE `clientes_productos` (
  `id_cliente` int NOT NULL,
  `id_cuenta` decimal(12,0) NOT NULL,
  `tipo_producto` int NOT NULL COMMENT '\n',
  `tipo_moneda` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_cuenta`),
  UNIQUE KEY `clientes_id_cliente_UNIQUE` (`id_cliente`),
  UNIQUE KEY `id_cuenta_UNIQUE` (`id_cuenta`),
  KEY `fk_table1_clientes_idx` (`id_cliente`),
  KEY `fk_clientes_productos_tipo_producto1` (`tipo_producto`),
  KEY `fk_clientes_productos_tipo_moneda1` (`tipo_moneda`),
  CONSTRAINT `fk_clientes_productos_clientes_cuentas1` FOREIGN KEY (`id_cuenta`) REFERENCES `clientes_cuentas` (`id_cuentas`),
  CONSTRAINT `fk_clientes_productos_clientes_inversiones1` FOREIGN KEY (`id_cuenta`) REFERENCES `clientes_inversiones` (`id_cuenta`),
  CONSTRAINT `fk_clientes_productos_clientes_prestamos1` FOREIGN KEY (`id_cuenta`) REFERENCES `clientes_prestamos` (`id_cuenta`),
  CONSTRAINT `fk_clientes_productos_clientes_tarjeta_credito1` FOREIGN KEY (`id_cuenta`) REFERENCES `clientes_tarjeta_credito` (`id_cuenta`),
  CONSTRAINT `fk_clientes_productos_clientes_tarjetas_debito1` FOREIGN KEY (`id_cuenta`) REFERENCES `clientes_tarjetas_debito` (`id_cuenta`),
  CONSTRAINT `fk_clientes_productos_tipo_moneda1` FOREIGN KEY (`tipo_moneda`) REFERENCES `tipo_moneda` (`tipo_moneda`),
  CONSTRAINT `fk_clientes_productos_tipo_producto1` FOREIGN KEY (`tipo_producto`) REFERENCES `tipo_producto` (`tipo_producto`),
  CONSTRAINT `fk_table1_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `clientes_productos` VALUES (1,100000000001,1,1,'2022-10-14','2024-01-01'),
(2,100000000002,1,1,'2022-10-14','2024-01-01'),
(3,100000000003,1,2,'2022-10-14','2024-01-01'),
(5,100000000005,2,1,'2022-10-14','2024-01-01'),
(6,100000000006,2,1,'2022-10-14','2024-01-01'),
(7,100000000007,3,1,'2022-10-14','2024-01-01'),
(8,100000000008,3,2,'2022-10-14','2024-01-01'),
(9,100000000009,4,1,'2022-10-14','2024-01-01'),
(10,100000000010,4,2,'2022-10-14','2024-01-01');


DROP TABLE IF EXISTS `clientes_tarjeta_credito`;
CREATE TABLE `clientes_tarjeta_credito` (
  `numero_tarjeta` decimal(16,0) NOT NULL,
  `id_cuenta` decimal(12,0) NOT NULL,
  `id_marca_tarjeta` int NOT NULL,
  `tipo_moneda` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  PRIMARY KEY (`numero_tarjeta`),
  UNIQUE KEY `num_tarjeta_UNIQUE` (`numero_tarjeta`),
  UNIQUE KEY `id_cuenta_UNIQUE` (`id_cuenta`),
  KEY `fk_clientes_tarjeta_credito_tipo_tarjeta1` (`id_marca_tarjeta`),
  CONSTRAINT `fk_clientes_tarjeta_credito_tipo_tarjeta1` FOREIGN KEY (`id_marca_tarjeta`) REFERENCES `tipo_tarjeta` (`id_marca_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `clientes_tarjeta_credito` VALUES (3800450132154512,100000000006,3,1,'2022-10-14','2024-01-01'),
(4500789015423154,100000000004,1,1,'2022-10-14','2024-01-01'),
(5228791099000012,100000000005,2,1,'2022-10-14','2024-01-01');

DROP TABLE IF EXISTS `clientes_tarjetas_debito`;
CREATE TABLE `clientes_tarjetas_debito` (
  `numero_tarjeta` decimal(16,0) NOT NULL,
  `id_cuenta` decimal(12,0) NOT NULL,
  `id_marca_tarjeta` int NOT NULL,
  `tipo_moneda` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  PRIMARY KEY (`numero_tarjeta`),
  UNIQUE KEY `numero_tarjeta_UNIQUE` (`numero_tarjeta`),
  UNIQUE KEY `id_cuenta_UNIQUE` (`id_cuenta`),
  KEY `fk_clientes_tarjetas_debito_tipo_tarjeta1` (`id_marca_tarjeta`),
  CONSTRAINT `fk_clientes_tarjetas_debito_tipo_tarjeta1` FOREIGN KEY (`id_marca_tarjeta`) REFERENCES `tipo_tarjeta` (`id_marca_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `clienteslog1`;
CREATE TABLE `clienteslog1` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) DEFAULT NULL,
  `apellido_cliente` varchar(45) DEFAULT NULL,
  `numero_documento` int DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  `hora_alta` time NOT NULL,
  `operador_id` varchar(45) DEFAULT NULL,
  `tipo_operacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `clienteslog2`;
CREATE TABLE `clienteslog2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `documento` int DEFAULT NULL,
  `numtributario` decimal(13,0) DEFAULT NULL,
  `nacionalidad` int DEFAULT NULL,
  `fecha_update` date NOT NULL,
  `hora_update` time NOT NULL,
  `operador_id` varchar(45) DEFAULT NULL,
  `tipo_operacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `cuentaslog1`;
CREATE TABLE `cuentaslog1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` decimal(12,0) NOT NULL,
  `saldo` decimal(13,2) DEFAULT NULL,
  `fecha_update` date DEFAULT NULL,
  `hora_update` time DEFAULT NULL,
  `operador_id` varchar(45) DEFAULT NULL,
  `tipo_operacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `cuentaslog2`;
CREATE TABLE `cuentaslog2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` decimal(12,0) NOT NULL,
  `tipo_cuenta` int DEFAULT NULL,
  `tipo_moneda` int DEFAULT NULL,
  `fecha_delete` date DEFAULT NULL,
  `hora_delete` time DEFAULT NULL,
  `operador_id` varchar(45) DEFAULT NULL,
  `tipo_operacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `tipo_cuenta`;
CREATE TABLE `tipo_cuenta` (
  `tipo_cuenta` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `tipo_cuenta` VALUES (1,'Caja de Ahorro Pesos'),(2,'Caja de Ahorro Dolares'),(3,'Cuenta Corriente Pesos'),(4,'Cuenta Corriente Dolares');


DROP TABLE IF EXISTS `tipo_inversion`;
CREATE TABLE `tipo_inversion` (
  `tipo_inversion` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_inversion`),
  UNIQUE KEY `tipo_inversion_UNIQUE` (`tipo_inversion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `tipo_inversion` VALUES (1,'Plazo Fijo'),(2,'Plazo Fijo UVA'),(3,'FCI');


DROP TABLE IF EXISTS `tipo_moneda`;
CREATE TABLE `tipo_moneda` (
  `tipo_moneda` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_moneda`),
  UNIQUE KEY `tipo_moneda_UNIQUE` (`tipo_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `tipo_moneda` VALUES (1,'Pesos Argentinos'),(2,'Dolares');


DROP TABLE IF EXISTS `tipo_prestamo`;
CREATE TABLE `tipo_prestamo` (
  `tipo_prestamo` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_prestamo`),
  UNIQUE KEY `tipo_prestamo_UNIQUE` (`tipo_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `tipo_prestamo` VALUES (1,'Prestamo Personal'),(2,'Prestamo Empresa'),(3,'Prestamo Hipotecario'),(4,'Prestamo Estudios');


DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE `tipo_producto` (
  `tipo_producto` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_producto`),
  UNIQUE KEY `tipo_producto_UNIQUE` (`tipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `tipo_producto` VALUES (1,'Cuentas'),(2,'Tarjeta de Credito'),(3,'Tarjeta de Debito'),(4,'Prestamos'),(5,'Inversiones');


DROP TABLE IF EXISTS `tipo_tarjeta`;
CREATE TABLE `tipo_tarjeta` (
  `id_marca_tarjeta` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_marca_tarjeta`),
  UNIQUE KEY `id_marca_tarjeta_UNIQUE` (`id_marca_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `tipo_tarjeta` VALUES (1,'Visa'),(2,'MasterCard'),(3,'American Express'),(4,'Banelco'),(5,'Electron'),(6,'Cabal');

 --Termina creacion de la base de datos con sus datos correspondientes--
 
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

--Scripts de creacion de vistas:

--Ver clientes masculinos 
CREATE VIEW ClientesMasculinos AS
SELECT nombre_cliente, apellido_cliente, genero_cliente 
FROM banco.clientes
WHERE genero_cliente = 'M';


--Ver clientes con tarjetas de credito, donde TC es tipo_producto = 2--
CREATE VIEW ClientesConTC as
SELECT
    clientes_productos.tipo_producto,
    clientes_productos.id_cliente
   FROM
    clientes_productos
WHERE
    clientes_productos.tipo_producto = 2
    group by id_cliente
    HAVING COUNT(clientes_productos.id_cliente) = 1;
	
--Ver clientes con prestamo UVA, donde prestamos es 4 y prestamo hipotecario = 3

CREATE VIEW ClientesConHipotecarios
AS SELECt
    clientes_productos.id_cliente,
    clientes_productos.tipo_producto,
    clientes_prestamos.tipo_prestamo
FROM
    clientes_productos,
    clientes_prestamos
WHERE
    clientes_productos.tipo_producto = 4 and
    clientes_prestamos.tipo_prestamo = 3;
	
	
-- Ver clientes mujeres con tarjeta de credito mastercard, donde mastercard es tipo_tarjeta = 2  

CREATE VIEW ClientesMujeresConMaster
AS SELECT
     clientes_productos.id_cliente,
     clientes.nombre_cliente,
     clientes.apellido_cliente,
     clientes_productos.tipo_producto,
     clientes_tarjeta_credito.numero_tarjeta,
     clientes_tarjeta_credito.id_marca_tarjeta
     
FROM
        clientes_productos,
        clientes,
        clientes_tarjeta_credito
WHERE
     tipo_producto = 2  and
	 id_marca_tarjeta = 2 and
     genero_cliente = 'F'
	group by id_marca_tarjeta;
     
	 
-- Ver clientes de mayor edad a menor

CREATE VIEW ClientesEdad AS
SELECT nombre_cliente, apellido_cliente, fecha_nacimiento
FROM clientes
order by fecha_nacimiento ASC;

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

--Script de funciones:


--Funcion que ingresandole el id del cliente, te devuelve la edad del mismo
--para usarla es : select SELECT CALCULAREDAD (1) AS edad; 
CREATE DEFINER=`root`@`localhost` FUNCTION `calcularedad`(id int) RETURNS int
    NO SQL
BEGIN
	DECLARE RESULTADO INT;
    DECLARE DIAS INT;
    DECLARE AÑO INT;
    DECLARE EDAD INT;
    SET DIAS =  (SELECT DATEDIFF(CURDATE(), FECHA_NACIMIENTO) FROM clientes where id_cliente = id);
	SET ID = (select id_cliente from clientes WHERE id_cliente = id);
    SET AÑO = 365;
    SET EDAD = DIAS / AÑO; 
RETURN EDAD;
END

--Funcion que al ingresar el ID del cliente, devuelve breve información del mismo.--
CREATE DEFINER=`root`@`localhost` FUNCTION `infocliente`(id int) RETURNS varchar(100) CHARSET utf8mb3
    READS SQL DATA
BEGIN
DECLARE RESPUESTA varchar(100);

IF id = 0 THEN
set respuesta = "ID erroneo";
else
select concat(nombre_cliente,'  ',apellido_cliente,' |DU:  ',numero_documento,'  |FechaNac:  ',fecha_nacimiento)
into respuesta from clientes where id_cliente = id;
end if;
RETURN respuesta;
END

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


--Script de creación de Stored Procedures

--Crea una Cuenta de ahorro o cuenta corriente a un cliente:

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreacionCuenta`(IN idcliente int,
 IN idcuenta decimal(12,0),  -- ID de la cuenta
 IN tipocuenta int,          -- Tipo de Cuenta= 1 CA Pesos , 2 CA Dolares, 3 CC Pesos, 4 CC Dolares
 IN tipomoneda int,          -- Tipo de Moneda= 1 Pesos , 2 Dolares
 IN fecalta date,            -- Fecha de alta = formato 'AAAA-MM-DD'
 IN fecbaja date,            -- Fecha de alta = formato 'AAAA-MM-DD'
 IN saldo decimal(13,2))     -- Saldo de la cuenta a ingresar: 0000000000000.00 (13 digitos mas los centavos)
BEGIN      
INSERT INTO clientes_cuentas values (idcuenta, tipocuenta, tipomoneda, fecalta, fecbaja, saldo, idcliente);
END

--call CreacionCuenta(6,100000000006,1,1,'2022-10-19','2024-01-01',50000.00);


---------------------------------------------------------------------------------------------------------------------

--SP que selecciona la tabla "clientes" y filtra por la columna ingresada y por el orden (asc o desc)

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPSelecion`
(IN columna varchar(24), --Ingresar columna la cual se quiere filtrar por ej:'id_cliente'
IN orden VARCHAR(24))    --Ingresar el orden:'ASC' o 'DESC' (si o si hay que escribirlos asi y con ' ')
BEGIN
	SET @ordenar = CONCAT("SELECT * FROM clientes ORDER BY ", columna , " ", orden);
    PREPARE sentencia FROM @ordenar;
    EXECUTE sentencia;
	DEALLOCATE PREPARE sentencia;
END


--Ejemplo de uso: call SPSelecion('id_cliente','asc');