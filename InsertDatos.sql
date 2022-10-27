INSERT INTO `clientes` VALUES 
(1,'JUAN','GONZALEZ','M',1112345678,'JUANGONZALEZ',11112222,20137416551,'1985-12-10',1,'C',NULL,1,'2022-10-14'),
(2,'CARLOS','DOMINGUEZ','M',1112345678,'CARLOSDOMINGUEZ',45316410,22453164103,'1968-10-08',2,'S',NULL,1,'2022-10-14'),
(3,'MARIO','RABINOVICH','M',1112345678,'MARIORABINOVICH',61356062,30613560625,'1978-09-05',3,'C',NULL,1,'2022-10-14'),
(4,'MARIA','SUAREZ','F',1112345678,'MARIASUAREZ',56430963,40564309635,'1989-05-06',4,'S',NULL,1,'2022-10-14'),
(5,'JUANA','ZARATE','F',1112345678,'JUANAZARATE',66561291,20665612915,'1987-04-25',5,'S',NULL,1,'2022-10-14'),
(6,'SOFIA','VAZQUEZ','F',1112345678,'SOFIAVAZQUEZ',54630552,21546305527,'1957-04-15',6,'S',NULL,1,'2022-10-14'),
(7,'FLORENCIA','MENA','F',1112345678,'FLORENCIAMENA',22726923,22227269236,'1974-05-28',4,'S',NULL,1,'2022-10-14'),
(8,'NICOLAS','RODRIGUEZ','M',1112345678,'NICOLASRODRIGUEZ',46521162,23465211623,'1976-08-09',3,'C',NULL,1,'2022-10-14'),
(9,'IGNACIO','TORRES','M',1112345678,'IGNACIOTORRES',20796553,20207965531,'1969-11-14',6,'C',NULL,1,'2022-10-14'),
(10,'JORGE','PENA','M',1112345678,'JORGEPENA',61870790,20618707900,'1949-07-18',5,'V',NULL,1,'2022-10-14');


INSERT INTO `clientes_cuentas` VALUES 
(1000000001,5000.00,1,1,'2022-10-15','2024-01-01'),
(1000000002,200000.00,1,1,'2022-10-15','2024-01-01'),
(1000000003,6000.00,2,2,'2022-10-15','2024-01-01'),
(1000000004,8000.00,2,2,'2022-10-15','2024-01-01'),
(1000000005,50000.00,1,1,'2022-10-19','2024-01-01');


INSERT INTO `clientes_prestamos` VALUES 
(80000001,1000000009,3,1,'2022-10-14','2024-01-01'),
(80000002,1000000010,1,2,'2022-10-14','2024-01-01');


INSERT INTO `clientes_productos` VALUES 
(1,1000000001,1,1,'2022-10-14','2024-01-01'),
(2,1000000002,1,1,'2022-10-14','2024-01-01'),
(3,1000000003,1,2,'2022-10-14','2024-01-01'),
(5,1000000005,2,1,'2022-10-14','2024-01-01'),
(6,1000000006,2,1,'2022-10-14','2024-01-01'),
(7,1000000007,3,1,'2022-10-14','2024-01-01'),
(8,1000000008,3,2,'2022-10-14','2024-01-01'),
(9,1000000009,4,1,'2022-10-14','2024-01-01'),
(10,1000000010,4,2,'2022-10-14','2024-01-01');



INSERT INTO `clientes_tarjetas_credito` VALUES 
(3800450132154512,1000000006,3,1,'2022-10-14','2024-01-01'),
(4500789015423154,1000000004,1,1,'2022-10-14','2024-01-01'),
(5228791099000012,1000000005,2,1,'2022-10-14','2024-01-01');

INSERT INTO `tipo_cuenta` VALUES (1,'Caja de Ahorro Pesos'),(2,'Caja de Ahorro Dolares'),(3,'Cuenta Corriente Pesos'),(4,'Cuenta Corriente Dolares');

INSERT INTO `tipo_inversion` VALUES (1,'Plazo Fijo'),(2,'Plazo Fijo UVA'),(3,'FCI');

INSERT INTO `tipo_moneda` VALUES (1,'Pesos Argentinos'),(2,'Dolares');

INSERT INTO `tipo_prestamo` VALUES (1,'Prestamo Personal'),(2,'Prestamo Empresa'),(3,'Prestamo Hipotecario'),(4,'Prestamo Estudios');

INSERT INTO `tipo_producto` VALUES (1,'Cuentas'),(2,'Tarjeta de Credito'),(3,'Tarjeta de Debito'),(4,'Prestamos'),(5,'Inversiones');

INSERT INTO `tipo_tarjeta` VALUES (1,'Visa'),(2,'MasterCard'),(3,'American Express'),(4,'Banelco'),(5,'Electron'),(6,'Cabal');

INSERT INTO `nacionalidad` VALUES (1,'Argentina'),(2,'Chile'),(3,'Uruguay'),(4,'Peru'),(5,'Bolivia'),(6,'Brasil'),(7,'Ecuador'),(8,'Colombia'),(9,'Venezuela'),
(10,'Estados Unidos'),(11,'España'),(12,'Italia');

INSERT INTO `tipo_cliente` VALUES 
(1,50000,'Clientes con Ingresos hasta 50000 pesos'),
(2,80000,'Clientes con Ingresos hasta 80000 pesos'),
(3,120000,'Clientes con Ingresos hasta 120000 pesos'),
(4,150000,'Clientes con Ingresos hasta 150000 pesos'),
(5,200000,'Clientes con Ingresos hasta 200000 pesos'),
(6,250000,'Clientes con Ingresos hasta 250000 pesos'),
(7,300000,'Clientes con Ingresos hasta 300000 pesos'),
(8,400000,'Clientes con Ingresos hasta 400000 pesos'),
(9,500000,'Clientes con Ingresos hasta 500000 pesos'),
(10,1000000,'Clientes con Ingresos de mas de 500000 pesos');

