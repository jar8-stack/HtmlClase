-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tiendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Tiendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tiendas` DEFAULT CHARACTER SET utf8 ;
USE `Tiendas` ;

-- -----------------------------------------------------
-- Table `Tiendas`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiendas`.`proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `contacto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tiendas`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiendas`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(25) NOT NULL,
  `precio` FLOAT(2) NOT NULL,
  `stock` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_Producto_Proveedor1_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Proveedor1`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `Tiendas`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tiendas`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiendas`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido_paterno` VARCHAR(45) NOT NULL,
  `apellido_materno` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `tipo_user` TINYINT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tiendas`.`sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiendas`.`sucursal` (
  `idSucursal` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(100) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`idSucursal`),
  INDEX `fk_Sucursal_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Sucursal_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Tiendas`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tiendas`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiendas`.`empleado` (
  `id_empleado` INT NOT NULL,
  `salario` FLOAT(2) NOT NULL,
  `id_sucursal` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `fk_Empleado_Sucursal1_idx` (`id_sucursal` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Usuario1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `Tiendas`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Sucursal1`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `Tiendas`.`sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tiendas`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiendas`.`venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `total` FLOAT(2) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_Venta_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Venta_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Tiendas`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tiendas`.`venta_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiendas`.`venta_producto` (
  `id_producto` INT NOT NULL,
  `id_venta` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `importe` FLOAT(2) NOT NULL,
  PRIMARY KEY (`id_producto`, `id_venta`),
  INDEX `fk_Producto_has_Venta_Venta1_idx` (`id_venta` ASC) VISIBLE,
  INDEX `fk_Producto_has_Venta_Producto1_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_has_Venta_Producto1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `Tiendas`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Venta_Venta1`
    FOREIGN KEY (`id_venta`)
    REFERENCES `Tiendas`.`venta` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
