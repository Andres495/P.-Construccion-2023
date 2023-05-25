-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8 ;
USE `proyecto` ;

-- -----------------------------------------------------
-- Table `proyecto`.`rolSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`rolSistema` (
  `idrolSistema` INT NOT NULL AUTO_INCREMENT,
  `rolSistema` NVARCHAR(20) NOT NULL,
  PRIMARY KEY (`idrolSistema`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `matricula` INT NOT NULL,
  `nombre` NVARCHAR(45) NOT NULL,
  `apellidoPaterno` NVARCHAR(45) NOT NULL,
  `apellidoMaterno` NVARCHAR(45) NOT NULL,
  `username` NVARCHAR(45) NOT NULL,
  `password` NVARCHAR(45) NOT NULL,
  `rolSistema` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_rolSistema_idx` (`rolSistema` ASC) VISIBLE,
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rolSistema`
    FOREIGN KEY (`rolSistema`)
    REFERENCES `proyecto`.`rolSistema` (`idrolSistema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`LGAC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`LGAC` (
  `idLGAC` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `nombre` NVARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idLGAC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`anteproyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`anteproyecto` (
  `idanteproyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre` NVARCHAR(100) NOT NULL,
  `estado` NVARCHAR(20) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `idLGAC` INT NOT NULL,
  PRIMARY KEY (`idanteproyecto`),
  INDEX `fk_anteproyecto_LGAC_idx` (`idLGAC` ASC) VISIBLE,
  CONSTRAINT `fk_anteproyecto_LGAC`
    FOREIGN KEY (`idLGAC`)
    REFERENCES `proyecto`.`LGAC` (`idLGAC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`actividad` (
  `idactividad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `valor` INT NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `fechaInicio` DATETIME NOT NULL,
  `fechaCierre` DATETIME NOT NULL,
  `anteproyecto` INT NOT NULL,
  PRIMARY KEY (`idactividad`),
  INDEX `fk_actividad-anteproyecto_idx` (`anteproyecto` ASC) VISIBLE,
  CONSTRAINT `fk_actividad-anteproyecto`
    FOREIGN KEY (`anteproyecto`)
    REFERENCES `proyecto`.`anteproyecto` (`idanteproyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`entregaActividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`entregaActividad` (
  `identregaActividad` INT NOT NULL AUTO_INCREMENT,
  `idactividad` INT NOT NULL,
  `descripcion` NVARCHAR(150) NOT NULL,
  `idusuario` INT NOT NULL,
  `fechaEntrega` DATETIME NOT NULL,
  PRIMARY KEY (`identregaActividad`),
  INDEX `sdfdsf_idx` (`idactividad` ASC) VISIBLE,
  INDEX `fk_entregaActividad_usuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_entregaActividad_actividad`
    FOREIGN KEY (`idactividad`)
    REFERENCES `proyecto`.`actividad` (`idactividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entregaActividad_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyecto`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`avance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`avance` (
  `idavance` INT NOT NULL AUTO_INCREMENT,
  `numAvance` INT NOT NULL,
  `descripcion` NVARCHAR(150) NOT NULL,
  `fechaCreacion` DATETIME NOT NULL,
  `fechaInicio` DATETIME NOT NULL,
  `fechaCierre` DATETIME NOT NULL,
  `idanteproyecto` INT NOT NULL,
  PRIMARY KEY (`idavance`),
  INDEX `fk_avance_anteproyecto_idx` (`idanteproyecto` ASC) VISIBLE,
  CONSTRAINT `fk_avance_anteproyecto`
    FOREIGN KEY (`idanteproyecto`)
    REFERENCES `proyecto`.`anteproyecto` (`idanteproyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`entregaAvance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`entregaAvance` (
  `identregaAvance` INT NOT NULL AUTO_INCREMENT,
  `idavance` INT NOT NULL,
  `descripcion` NVARCHAR(150) NOT NULL,
  `idusuario` INT NOT NULL,
  `fechaEntrega` DATETIME NOT NULL,
  PRIMARY KEY (`identregaAvance`),
  INDEX `fk_entregaAvance_avance_idx` (`idavance` ASC) VISIBLE,
  INDEX `fk_entregaAvance_estudiante_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_entregaAvance_avance`
    FOREIGN KEY (`idavance`)
    REFERENCES `proyecto`.`avance` (`idavance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entregaAvance_estudiante`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyecto`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`curso` (
  `idcurso` INT NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  `periodo` NVARCHAR(45) NOT NULL,
  `nombre` NVARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`cursoEstudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`cursoEstudiante` (
  `idcursoEstudiante` INT NOT NULL AUTO_INCREMENT,
  `idCurso` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idcursoEstudiante`),
  INDEX `fk_cursoEstudiante_curso_idx` (`idCurso` ASC) VISIBLE,
  INDEX `fk_cursoEstudiante_estudiante_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_cursoEstudiante_curso`
    FOREIGN KEY (`idCurso`)
    REFERENCES `proyecto`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursoEstudiante_estudiante`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyecto`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`experienciaEducativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`experienciaEducativa` (
  `idexperienciaEducativa` INT NOT NULL AUTO_INCREMENT,
  `NRC` INT NOT NULL,
  `nombre` NVARCHAR(45) NOT NULL,
  `creditos` INT NOT NULL,
  PRIMARY KEY (`idexperienciaEducativa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`cursoExperienciaEducativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`cursoExperienciaEducativa` (
  `idcursoExperienciaEducativa` INT NOT NULL AUTO_INCREMENT,
  `idCurso` INT NOT NULL,
  `idExperienciaEducativa` INT NOT NULL,
  PRIMARY KEY (`idcursoExperienciaEducativa`),
  INDEX `fk_cursoExperienciaEducativa_experienciaEducativa_idx` (`idExperienciaEducativa` ASC) VISIBLE,
  INDEX `fk_cursoExperienciEducativa_curso_idx` (`idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_cursoExperienciaEducativa_experienciaEducativa`
    FOREIGN KEY (`idExperienciaEducativa`)
    REFERENCES `proyecto`.`experienciaEducativa` (`idexperienciaEducativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursoExperienciEducativa_curso`
    FOREIGN KEY (`idCurso`)
    REFERENCES `proyecto`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`experienciaEducativaAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`experienciaEducativaAcademico` (
  `idexperienciaEducativaUsuario` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idexperienciaEducativa` INT NOT NULL,
  PRIMARY KEY (`idexperienciaEducativaUsuario`),
  INDEX `fk_experienciaEducativaAcademico_usuario_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_experienciaEducativaAcademico_experienciaEducativa_idx` (`idexperienciaEducativa` ASC) VISIBLE,
  CONSTRAINT `fk_experienciaEducativaAcademico_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyecto`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experienciaEducativaAcademico_experienciaEducativa`
    FOREIGN KEY (`idexperienciaEducativa`)
    REFERENCES `proyecto`.`experienciaEducativa` (`idexperienciaEducativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`cuerpoAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`cuerpoAcademico` (
  `idcuerpoAcademico` INT NOT NULL AUTO_INCREMENT,
  `clave` NVARCHAR(45) NOT NULL,
  `gradoConsodilacion` NVARCHAR(40) NOT NULL,
  `fechaRegistro` DATE NOT NULL,
  `desAdscripcion` NVARCHAR(50) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcuerpoAcademico`),
  UNIQUE INDEX `Nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`LGACcuerpoAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`LGACcuerpoAcademico` (
  `idLGACcuerpoAcademico` INT NOT NULL AUTO_INCREMENT,
  `idcuerpoAcademico` INT NOT NULL,
  `idLGAC` INT NOT NULL,
  PRIMARY KEY (`idLGACcuerpoAcademico`),
  INDEX `fk_LGACCuerpoAcademico_cuerpoAcademico_idx` (`idcuerpoAcademico` ASC) VISIBLE,
  INDEX `fk_LGACCuerpoAcademico_LGAC_idx` (`idLGAC` ASC) VISIBLE,
  CONSTRAINT `fk_LGACCuerpoAcademico_cuerpoAcademico`
    FOREIGN KEY (`idcuerpoAcademico`)
    REFERENCES `proyecto`.`cuerpoAcademico` (`idcuerpoAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LGACCuerpoAcademico_LGAC`
    FOREIGN KEY (`idLGAC`)
    REFERENCES `proyecto`.`LGAC` (`idLGAC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`academicoCuerpoAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`academicoCuerpoAcademico` (
  `idacademicoCuerpoAcademico` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idcuerpoAcademico` INT NOT NULL,
  PRIMARY KEY (`idacademicoCuerpoAcademico`),
  INDEX `fk_academicoCuerpoAcademico_cuerpoAcademico_idx` (`idcuerpoAcademico` ASC) VISIBLE,
  INDEX `fk_academicoCuerpoAcademico_usuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_academicoCuerpoAcademico_cuerpoAcademico`
    FOREIGN KEY (`idcuerpoAcademico`)
    REFERENCES `proyecto`.`cuerpoAcademico` (`idcuerpoAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_academicoCuerpoAcademico_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyecto`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`rolAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`rolAcademico` (
  `idrolAcademico` INT NOT NULL AUTO_INCREMENT,
  `rolAcademico` NVARCHAR(40) NOT NULL,
  PRIMARY KEY (`idrolAcademico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`usuarioRolAcademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`usuarioRolAcademico` (
  `idusuarioRolAcademico` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idrolAcademico` INT NOT NULL,
  PRIMARY KEY (`idusuarioRolAcademico`),
  INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_usuarioRolAcademico_rolAcademico_idx` (`idrolAcademico` ASC) VISIBLE,
  CONSTRAINT `fk_usuarioRolAcademico_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyecto`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioRolAcademico_rolAcademico`
    FOREIGN KEY (`idrolAcademico`)
    REFERENCES `proyecto`.`rolAcademico` (`idrolAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`anteproyectoCurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`anteproyectoCurso` (
  `idanteproyectoCurso` INT NOT NULL AUTO_INCREMENT,
  `idanteproyecto` INT NOT NULL,
  `idcurso` INT NOT NULL,
  PRIMARY KEY (`idanteproyectoCurso`),
  INDEX `fk_anteproyectoCurso_anteproyecto_idx` (`idanteproyecto` ASC) VISIBLE,
  INDEX `fk-anteproyectoCurso_curso_idx` (`idcurso` ASC) VISIBLE,
  CONSTRAINT `fk_anteproyectoCurso_anteproyecto`
    FOREIGN KEY (`idanteproyecto`)
    REFERENCES `proyecto`.`anteproyecto` (`idanteproyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk-anteproyectoCurso_curso`
    FOREIGN KEY (`idcurso`)
    REFERENCES `proyecto`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`archivoAdjunto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`archivoAdjunto` (
  `idarchivoAdjunto` INT NOT NULL AUTO_INCREMENT,
  `nombre` NVARCHAR(50) NOT NULL,
  `archivo` BLOB NOT NULL,
  `identregaAvance` INT NULL,
  `identregaActividad` INT NULL,
  `idanteproyecto` INT NULL,
  PRIMARY KEY (`idarchivoAdjunto`),
  INDEX `fk_archivoAdjunto_entregaActividad_idx` (`identregaActividad` ASC) VISIBLE,
  INDEX `fk_archivoAdjunto_entregaAvance_idx` (`identregaAvance` ASC) VISIBLE,
  INDEX `fk_archivoAdjunto_anteproyecto_idx` (`idanteproyecto` ASC) VISIBLE,
  CONSTRAINT `fk_archivoAdjunto_entregaActividad`
    FOREIGN KEY (`identregaActividad`)
    REFERENCES `proyecto`.`entregaActividad` (`identregaActividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivoAdjunto_entregaAvance`
    FOREIGN KEY (`identregaAvance`)
    REFERENCES `proyecto`.`entregaAvance` (`identregaAvance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivoAdjunto_anteproyecto`
    FOREIGN KEY (`idanteproyecto`)
    REFERENCES `proyecto`.`anteproyecto` (`idanteproyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`usuarioAnteproyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`usuarioAnteproyecto` (
  `idusuarioAnteproyecto` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idanteproyecto` INT NOT NULL,
  PRIMARY KEY (`idusuarioAnteproyecto`),
  INDEX `fk_usuarioAnteproyecto_usuario_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_usuarioAnteproyecto:anteproyecto_idx` (`idanteproyecto` ASC) VISIBLE,
  CONSTRAINT `fk_usuarioAnteproyecto_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyecto`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioAnteproyecto:anteproyecto`
    FOREIGN KEY (`idanteproyecto`)
    REFERENCES `proyecto`.`anteproyecto` (`idanteproyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
