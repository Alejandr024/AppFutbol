-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema futbol_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `futbol_db` DEFAULT CHARACTER SET utf8 ;
CREATE DATABASE futbol_db;
USE `futbol_db` ;

-- -----------------------------------------------------
-- Table `futbol_db`.`ligas`
-- -----------------------------------------------------
CREATE TABLE `ligas` (
  `idLiga` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(100) NOT NULL,
  `temporada` VARCHAR(20) NOT NULL,
  `logo_url` VARCHAR(255) NULL,
  PRIMARY KEY (`idLiga`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futbol_db`.`equipos`
-- -----------------------------------------------------
CREATE TABLE `equipos` (
  `idEquipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(100) NOT NULL,
  `escudo_url` VARCHAR(255) NULL,
  `estadio` VARCHAR(100) NULL,
  `idLiga` INT NOT NULL,
  PRIMARY KEY (`idEquipo`),
  INDEX `idLiga_idx` (`idLiga` ASC),
  CONSTRAINT `FkidLiga`
    FOREIGN KEY (`idLiga`)
    REFERENCES `mydb`.`ligas` (`idLiga`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futbol_db`.`jugadores`
-- -----------------------------------------------------
CREATE TABLE `jugadores` (
  `idJugador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `posicion` VARCHAR(50) NOT NULL,
  `nacionalidad` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `dorsal` INT NOT NULL,
  `foto_url` VARCHAR(255) NOT NULL,
  `idEquipo` INT NOT NULL,
  PRIMARY KEY (`idJugador`),
  INDEX `idEquipo_idx` (`idEquipo` ASC),
  CONSTRAINT `FkidEquipo`
    FOREIGN KEY (`idEquipo`)
    REFERENCES `mydb`.`equipos` (`idEquipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futbol_db`.`partidos`
-- -----------------------------------------------------
CREATE TABLE `partidos` (
  `idPartido` INT NOT NULL AUTO_INCREMENT,
  `idEquipoLocal` INT NOT NULL,
  `idEquipoVisitante` INT NOT NULL,
  `idLiga` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `golesLocal` INT NOT NULL DEFAULT 0,
  `golesVisitante` INT NOT NULL DEFAULT 0,
  `estado` VARCHAR(20) NOT NULL,
  `jornada` INT NOT NULL,
  PRIMARY KEY (`idPartido`),
  INDEX `idLiga_idx` (`idLiga` ASC),
  INDEX `idEquipoLocal_idx` (`idEquipoLocal` ASC) ,
  INDEX `idEquipoVisitante_idx` (`idEquipoVisitante` ASC),
  CONSTRAINT `FkidEquipoLocal`
    FOREIGN KEY (`idEquipoLocal`)
    REFERENCES `mydb`.`equipos` (`idEquipo`),
  CONSTRAINT `FkidLigaMatches`
    FOREIGN KEY (`idLiga`)
    REFERENCES `mydb`.`ligas` (`idLiga`),
  CONSTRAINT `FkidEquipoVisitante`
    FOREIGN KEY (`idEquipoVisitante`)
    REFERENCES `mydb`.`equipos` (`idEquipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futbol_db`.`estadisticasPartido`
-- -----------------------------------------------------
CREATE TABLE `estadisticasPartido` (
  `idEstadistica` INT NOT NULL AUTO_INCREMENT,
  `idPartido` INT NOT NULL,
  `idEquipo` INT NOT NULL,
  `posesion` DECIMAL(5,2) NOT NULL,
  `tiros` INT NOT NULL,
  `tirosPuerta` INT NOT NULL,
  `faltas` INT NOT NULL,
  `tarjetasAmarillas` INT NOT NULL,
  `tarjetasRojas` INT NOT NULL,
  `corners` INT NOT NULL,
  PRIMARY KEY (`idEstadistica`),
  INDEX `idPartido_idx` (`idPartido` ASC),
  INDEX `idEquipo_idx` (`idEquipo` ASC) ,
  CONSTRAINT `FkidPartido`
    FOREIGN KEY (`idPartido`)
    REFERENCES `mydb`.`partidos` (`idPartido`),
  CONSTRAINT `FkidEquipoStats`
    FOREIGN KEY (`idEquipo`)
    REFERENCES `mydb`.`equipos` (`idEquipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futbol_db`.`clasificacion`
-- -----------------------------------------------------
CREATE TABLE `clasificacion` (
  `idClasificacion` INT NOT NULL AUTO_INCREMENT,
  `idLiga` INT NOT NULL,
  `idEquipo` INT NOT NULL,
  `temporada` VARCHAR(20) NOT NULL,
  `puntos` INT NOT NULL DEFAULT 0,
  `partidosJugados` INT NOT NULL DEFAULT 0,
  `victorias` INT NOT NULL DEFAULT 0,
  `empates` INT NOT NULL DEFAULT 0,
  `derrotas` INT NOT NULL DEFAULT 0,
  `golesFavor` INT NOT NULL DEFAULT 0,
  `golesContra` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idClasificacion`),
  INDEX `idLiga_idx` (`idLiga` ASC),
  INDEX `idEquipo_idx` (`idEquipo` ASC) ,
  CONSTRAINT `FkIdLigaClasification`
    FOREIGN KEY (`idLiga`)
    REFERENCES `mydb`.`ligas` (`idLiga`),
  CONSTRAINT `FkIdEquipoClasification`
    FOREIGN KEY (`idEquipo`)
    REFERENCES `mydb`.`equipos` (`idEquipo`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;