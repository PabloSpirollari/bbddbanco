-- -----------------------------------------------------
-- Table `banco`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes` (
  `id_cliente` DECIMAL(10) NOT NULL
  `nombre_cliente` VARCHAR(45) NOT NULL
  `apellido_cliente` VARCHAR(45) NOT NULL
  `genero_cliente` BLOB NOT NULL
  `telefono_cliente` DECIMAL(12) NOT NULL,
  `mail_cliente` VARCHAR(35) NOT NULL,
  `numero_documento` DECIMAL(10) NOT NULL
  `numero_tributario` DECIMAL(13) NOT NULL
  `fecha_nacimiento` NVARCHAR(6) NOT NULL
  `tipo_cliente` INT NOT NULL
  `estado_civil` INT NOT NULL
  `profesion` VARCHAR(40) NULL
  `nacionalidad` INT NOT NULL,
  `fecha_alta` NVARCHAR(6) NOT NULL,
  PRIMARY KEY (`id_cliente`, `numero_documento`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE,
  UNIQUE INDEX `nro_tributario_UNIQUE` (`numero_tributario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`clientes_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes_productos` (
  `id_cliente` DECIMAL(10) NOT NULL,
  `id_cuenta` DECIMAL(12) NOT NULL,
  `tipo_producto` INT NOT NULL
  `tipo_moneda` INT NOT NULL
  `fecha_alta` NVARCHAR(6) NOT NULL
  `fecha_baja` NVARCHAR(6) NOT NULL
  INDEX `fk_table1_clientes_idx` (`id_cliente` ASC) VISIBLE,
  UNIQUE INDEX `clientes_id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE,
  PRIMARY KEY (`id_cliente`, `id_cuenta`),
  UNIQUE INDEX `codigo_prod_UNIQUE` (`id_cuenta` ASC) VISIBLE,
  CONSTRAINT `fk_table1_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `banco`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`tipo_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`tipo_productos` (
  `tipo_productos` INT NOT NULL
  `descripcion` VARCHAR(45) NULL
  UNIQUE INDEX `inversiones_UNIQUE` () VISIBLE,
  UNIQUE INDEX `tipo_producto_UNIQUE` (`tipo_productos` ASC) VISIBLE,
  INDEX `fk_tipo_productos_productos1_idx` (`tipo_productos` ASC, `descripcion` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_productos_productos1`
    FOREIGN KEY (`tipo_productos` , `descripcion`)
    REFERENCES `banco`.`clientes_productos` (`tipo_producto` , `tipo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`tipo_moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`tipo_moneda` (
  `tipo_moneda` INT NOT NULL
  `descripcion` VARCHAR(45) NOT NULL
  UNIQUE INDEX `pesos_UNIQUE` (`tipo_moneda` ASC) VISIBLE,
  INDEX `fk_tipo_moneda_productos1_idx` (`tipo_moneda` ASC, `descripcion` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_moneda_productos1`
    FOREIGN KEY (`tipo_moneda` , `descripcion`)
    REFERENCES `banco`.`clientes_productos` (`tipo_moneda` , `tipo_moneda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`clientes_tarjetas_debito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes_tarjetas_debito` (
  `numero_tarjeta` DECIMAL(16) NOT NULL,
  `id_marca_tarjeta` INT NOT NULL,
  `id_cuenta` DECIMAL(12) NOT NULL,
  `tipo_moneda` INT NOT NULL,
  `fecha_alta` NVARCHAR(6) NOT NULL,
  `fecha_baja` NVARCHAR(6) NOT NULL,
  PRIMARY KEY (`numero_tarjeta`),
  UNIQUE INDEX `numero_tarjeta_UNIQUE` (`numero_tarjeta` ASC) VISIBLE,
  UNIQUE INDEX `codigo_prod_UNIQUE` (`id_cuenta` ASC) VISIBLE,
  CONSTRAINT `fk_tarjeta_debito_rel_cliente_prod1`
    FOREIGN KEY (`id_cuenta`)
    REFERENCES `banco`.`clientes_productos` (`id_cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`clientes_tarjeta_credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes_tarjeta_credito` (
  `numero_tarjeta` DECIMAL(16) NOT NULL,
  `id_marca_tarjeta` INT NOT NULL,
  `id_cuenta` DECIMAL(12) NOT NULL,
  `tipo_moneda` INT NOT NULL,
  `fecha_alta` NVARCHAR(6) NOT NULL,
  `fecha_baja` NVARCHAR(6) NOT NULL,
  PRIMARY KEY (`numero_tarjeta`),
  UNIQUE INDEX `num_tarjeta_UNIQUE` (`numero_tarjeta` ASC) VISIBLE,
  UNIQUE INDEX `codigo_prod_UNIQUE` (`id_cuenta` ASC) VISIBLE,
  CONSTRAINT `fk_tarjeta_credito_rel_cliente_prod1`
    FOREIGN KEY (`id_cuenta`)
    REFERENCES `banco`.`clientes_productos` (`id_cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`tipo_tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`tipo_tarjeta` (
  `id_marca_tarjeta` INT NOT NULL
  `descripcion` VARCHAR(10) NOT NULL
  UNIQUE INDEX `id_tarjeta_UNIQUE` (`id_marca_tarjeta` ASC),
  CONSTRAINT `fk_tipo_tarjeta_tarjeta_debito1`
    FOREIGN KEY (`id_marca_tarjeta`)
    REFERENCES `banco`.`clientes_tarjetas_debito` (`id_marca_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_tarjeta_tarjeta_credito1`
    FOREIGN KEY (`id_marca_tarjeta`)
    REFERENCES `banco`.`clientes_tarjeta_credito` (`id_marca_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`clientes_cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes_cuentas` (
  `id_cuenta` DECIMAL(12) NOT NULL,
  `tipo_cuenta` DECIMAL(1) NOT NULL,
  `tipo_moneda` INT NOT NULL,
  `fecha_alta` NVARCHAR(6) NOT NULL,
  `fecha_baja` NVARCHAR(6) NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  UNIQUE INDEX `id_cuenta_UNIQUE` (`id_cuenta` ASC) VISIBLE,
  CONSTRAINT `fk_cuentas_rel_cliente_prod1`
    FOREIGN KEY (`id_cuenta`)
    REFERENCES `banco`.`clientes_productos` (`id_cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`clientes_inversiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes_inversiones` (
  `id_inversion` DECIMAL(8) NOT NULL,
  `tipo_inversion` INT NOT NULL,
  `id_cuenta` DECIMAL(12) NOT NULL,
  `tipo_moneda` INT NOT NULL,
  `fecha_alta` NVARCHAR(6) NOT NULL,
  `fecha_baja` NVARCHAR(6) NOT NULL,
  PRIMARY KEY (`id_inversion`, `id_cuenta`),
  UNIQUE INDEX `id_inversion_UNIQUE` (`id_inversion` ASC) VISIBLE,
  UNIQUE INDEX `id_cuenta_UNIQUE` (`id_cuenta` ASC) VISIBLE,
  CONSTRAINT `fk_cli_inversion_rel_cliente_prod1`
    FOREIGN KEY (`id_cuenta`)
    REFERENCES `banco`.`clientes_productos` (`id_cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`tipo_inversion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`tipo_inversion` (
  `tipo_inversion` INT NOT NULL
  `descripcion` VARCHAR(45) NOT NULL
  UNIQUE INDEX `tipo_inversion_UNIQUE` (`tipo_inversion` ASC),
  CONSTRAINT `fk_tipo_inversion_cli_inversion1`
    FOREIGN KEY (`tipo_inversion`)
    REFERENCES `banco`.`clientes_inversiones` (`tipo_inversion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`tipo_cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`tipo_cuenta` (
  `tipo_cuenta` INT NULL 
  `descripcion` VARCHAR(45) NULL
  UNIQUE INDEX `tipo_cuenta_UNIQUE` (`tipo_cuenta` ASC),
  CONSTRAINT `fk_tipo_cuenta_cli_cuentas1`
    FOREIGN KEY (`tipo_cuenta`)
    REFERENCES `banco`.`clientes_cuentas` (`tipo_cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`clientes_prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes_prestamos` (
  `id_prestamo` DECIMAL(8) NOT NULL,
  `tipo_prestamo` INT NOT NULL,
  `id_cuenta` DECIMAL(12) NOT NULL,
  `tipo_moneda` INT NOT NULL,
  `fecha_alta` NVARCHAR(6) NOT NULL,
  `fecha_baja` NVARCHAR(6) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  INDEX `fk_cli_prestamos_rel_cliente_prod1_idx` (`id_cuenta` ASC) VISIBLE,
  UNIQUE INDEX `id_cuenta_UNIQUE` (`id_cuenta` ASC) VISIBLE,
  UNIQUE INDEX `id_prestamo_UNIQUE` (`id_prestamo` ASC) VISIBLE,
  CONSTRAINT `fk_cli_prestamos_rel_cliente_prod1`
    FOREIGN KEY (`id_cuenta`)
    REFERENCES `banco`.`clientes_productos` (`id_cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`tipo_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`tipo_prestamo` (
  `tipo_prestamo` INT NOT NULL
  `descripcion` VARCHAR(45) NOT NULL
  UNIQUE INDEX `tipo_prestamo_UNIQUE` (`tipo_prestamo` ASC),
  CONSTRAINT `fk_tipo_prestamo_cli_prestamos1`
    FOREIGN KEY (`tipo_prestamo`)
    REFERENCES `banco`.`clientes_prestamos` (`tipo_prestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
