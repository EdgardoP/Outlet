-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema outlet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema outlet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `outlet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `outlet` ;

-- -----------------------------------------------------
-- Table `outlet`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `outlet`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombreCliente` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `outlet`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `outlet`.`proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombreProveedor` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `outlet`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `outlet`.`producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombreProducto` TINYTEXT NULL DEFAULT NULL,
  `precioProducto` DOUBLE NULL DEFAULT NULL,
  `cantidadProducto` INT NULL DEFAULT NULL,
  `fkProveedor` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fkProveedor_idx` (`fkProveedor` ASC) VISIBLE,
  CONSTRAINT `fkProveedor`
    FOREIGN KEY (`fkProveedor`)
    REFERENCES `outlet`.`proveedor` (`idProveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `outlet`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `outlet`.`empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpleado` TINYTEXT NULL DEFAULT NULL,
  `cargoEmpleado` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `outlet`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `outlet`.`venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `fkEmpleado` INT NULL DEFAULT NULL,
  `fkCliente` INT NULL DEFAULT NULL,
  `fechaVenta` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fkEmpleado_idx` (`fkEmpleado` ASC) VISIBLE,
  INDEX `fkCliente_idx` (`fkCliente` ASC) VISIBLE,
  CONSTRAINT `fkCliente`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `outlet`.`cliente` (`idCliente`),
  CONSTRAINT `fkEmpleado`
    FOREIGN KEY (`fkEmpleado`)
    REFERENCES `outlet`.`empleado` (`idEmpleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `outlet`.`detalleventa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `outlet`.`detalleventa` (
  `idDetalleVenta` INT NOT NULL AUTO_INCREMENT,
  `fkVenta` INT NULL DEFAULT NULL,
  `fkProducto` INT NULL DEFAULT NULL,
  `cantidadProducto` INT NULL DEFAULT NULL,
  `totalPagar` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  INDEX `fkVenta_idx` (`fkVenta` ASC) VISIBLE,
  INDEX `fkProducto_idx` (`fkProducto` ASC) VISIBLE,
  CONSTRAINT `fkProducto`
    FOREIGN KEY (`fkProducto`)
    REFERENCES `outlet`.`producto` (`idProducto`),
  CONSTRAINT `fkVenta`
    FOREIGN KEY (`fkVenta`)
    REFERENCES `outlet`.`venta` (`idVenta`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
