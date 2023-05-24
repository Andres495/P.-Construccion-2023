CREATE DATABASE SPGER;
/*--------------------------------------------------CREATION DATABASE--------------------------------------------------*/
USE SPGER;
CREATE TABLE IF NOT EXISTS rolSistema (
  idrolSistema INT NOT NULL AUTO_INCREMENT,
  rolSistema NVARCHAR(20) UNIQUE NOT NULL,
  PRIMARY KEY (idrolSistema)
  );

CREATE TABLE IF NOT EXISTS LGAC (
  idLGAC INT NOT NULL AUTO_INCREMENT,
  numero INT UNIQUE NOT NULL,
  nombre NVARCHAR(50) UNIQUE NOT NULL,
  descripcion VARCHAR(150) NOT NULL,
  PRIMARY KEY (idLGAC)
  );

CREATE TABLE IF NOT EXISTS anteproyecto (
  idanteproyecto INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(100) NOT NULL,
  estado NVARCHAR(20) NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  iddirector INT NOT NULL,
  idcoDirector INT NOT NULL,
  idLGAC INT NOT NULL,
  PRIMARY KEY (idanteproyecto)
  );

CREATE TABLE IF NOT EXISTS usuario (
  idusuario INT NOT NULL AUTO_INCREMENT,
  matricula INT UNIQUE NOT NULL,
  nombre NVARCHAR(45) NOT NULL,
  apellidoPaterno NVARCHAR(45) NOT NULL,
  apellidoMaterno NVARCHAR(45) NOT NULL,
  correoElectronico NVARCHAR(50) UNIQUE NOT NULL,
  username NVARCHAR(45) UNIQUE NOT NULL,
  password  NVARCHAR(45) NOT NULL,
  rolSistema INT NOT NULL,
  idanteproyecto INT NULL,
  PRIMARY KEY (idusuario)
  );

CREATE TABLE IF NOT EXISTS actividad (
  idactividad INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(150) NOT NULL,
  valor INT NOT NULL,
  fechaCreacion DATE NOT NULL,
  fechaInicio DATETIME NOT NULL,
  fechaCierre DATETIME NOT NULL,
  idanteproyecto INT NOT NULL,
  PRIMARY KEY (idactividad) 
  );

CREATE TABLE IF NOT EXISTS entregaActividad (
  identregaActividad INT NOT NULL AUTO_INCREMENT,
  idusuario INT NOT NULL,
  idactividad INT NOT NULL,
  fechaEntrega DATETIME NOT NULL,
  descripcion TEXT NOT NULL,
  PRIMARY KEY (identregaActividad)
);

CREATE TABLE IF NOT EXISTS avance (
  idavance INT NOT NULL AUTO_INCREMENT,
  numAvance INT NOT NULL,
  descripcion NVARCHAR(150) NOT NULL,
  fechaCreacion DATETIME NOT NULL,
  fechaInicio DATETIME NOT NULL,
  fechaCierre DATETIME NOT NULL,
  idanteproyecto INT NOT NULL,
  PRIMARY KEY (idavance)
);

CREATE TABLE IF NOT EXISTS entregaAvance (
  identregaAvance INT NOT NULL AUTO_INCREMENT,
  idusuario INT NOT NULL,
  idavance INT NOT NULL,
  fechaEntrega DATETIME NOT NULL,
  descripcion TEXT NOT NULL,
  PRIMARY KEY (identregaAvance)
);

CREATE TABLE IF NOT EXISTS curso (
  idcurso INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(45) NOT NULL,
  fechaInicio DATE NOT NULL,
  fechaFin DATE NOT NULL,
  periodo NVARCHAR(45) NOT NULL,
  PRIMARY KEY (idcurso)
);  

CREATE TABLE IF NOT EXISTS cursoEstudiante (
  idcursoEstudiante INT NOT NULL AUTO_INCREMENT,
  idCurso INT NOT NULL,
  idUsuario INT NOT NULL,
  PRIMARY KEY (idcursoEstudiante)   
);

CREATE TABLE IF NOT EXISTS experienciaEducativa (
  idexperienciaEducativa INT NOT NULL AUTO_INCREMENT,
  NRC INT UNIQUE NOT NULL,
  nombre NVARCHAR(45) NOT NULL,
  creditos INT NOT NULL,
  PRIMARY KEY (idexperienciaEducativa)
);

CREATE TABLE IF NOT EXISTS cursoExperienciaEducativa (
  idcursoExperienciaEducativa INT NOT NULL AUTO_INCREMENT,
  idCurso INT NOT NULL,
  idExperienciaEducativa INT NOT NULL,
  PRIMARY KEY (idcursoExperienciaEducativa)
);

CREATE TABLE IF NOT EXISTS experienciaEducativaAcademico (
  idexperienciaEducativaUsuario INT NOT NULL AUTO_INCREMENT,
  idusuario INT NOT NULL,
  idexperienciaEducativa INT NOT NULL,
  PRIMARY KEY (idexperienciaEducativaUsuario)
);

CREATE TABLE IF NOT EXISTS cuerpoAcademico (
  idcuerpoAcademico INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(80) UNIQUE NOT NULL,
  clave NVARCHAR(45) UNIQUE NOT NULL,
  gradoConsodilacion NVARCHAR(40) NOT NULL,
  fechaRegistro DATE NULL,
  desAdscripcion NVARCHAR(50) NOT NULL,
  descripcion TEXT NOT NULL,
  PRIMARY KEY (idcuerpoAcademico)
);

CREATE TABLE IF NOT EXISTS LGACcuerpoAcademico (
  idLGACcuerpoAcademico INT NOT NULL AUTO_INCREMENT,
  idLGAC INT NOT NULL,
  idcuerpoAcademico INT NOT NULL,
  PRIMARY KEY (idLGACcuerpoAcademico)
);

CREATE TABLE IF NOT EXISTS academicoCuerpoAcademico (
  idacademicoCuerpoAcademico INT NOT NULL AUTO_INCREMENT,
  idusuario INT NOT NULL,
  idcuerpoAcademico INT NOT NULL,
  PRIMARY KEY (idacademicoCuerpoAcademico)
);

CREATE TABLE IF NOT EXISTS rolAcademico (
  idrolAcademico INT NOT NULL AUTO_INCREMENT,
  rolAcademico NVARCHAR(40) UNIQUE NOT NULL,
  PRIMARY KEY (idrolAcademico)
);

CREATE TABLE IF NOT EXISTS usuarioRolAcademico (
  idusuarioRolAcademico INT NOT NULL AUTO_INCREMENT,
  idusuario INT NOT NULL,
  idrolAcademico INT NOT NULL,
  PRIMARY KEY (idusuarioRolAcademico)
);

CREATE TABLE IF NOT EXISTS anteproyectoCurso (
  idanteproyectoCurso INT NOT NULL AUTO_INCREMENT,
  idanteproyecto INT NOT NULL,
  idcurso INT NOT NULL,
  PRIMARY KEY (idanteproyectoCurso)
);

CREATE TABLE IF NOT EXISTS archivoAdjunto (
  idarchivoAdjunto INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(50) NOT NULL,
  archivo BLOB NOT NULL,
  identregaAvance INT NULL,
  identregaActividad INT NULL,
  idanteproyecto INT NULL,
  PRIMARY KEY (idarchivoAdjunto)
);

/*--------------------------------------------------FOREIGN KEY--------------------------------------------------*/
USE SPGER;
ALTER TABLE anteproyecto ADD CONSTRAINT fk_anteproyecto_director
    FOREIGN KEY (iddirector) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE anteproyecto ADD CONSTRAINT fk_anteproyecto_coDirector
    FOREIGN KEY (idcoDirector) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE anteproyecto ADD CONSTRAINT fk_anteproyecto_LGAC
    FOREIGN KEY (idLGAC) REFERENCES LGAC (idLGAC)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usuario ADD CONSTRAINT fk_usuario_rolSistema
    FOREIGN KEY (rolSistema) REFERENCES rolSistema (idrolSistema)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usuario ADD CONSTRAINT fk_usuario_anteproyecto
    FOREIGN KEY (idanteproyecto) REFERENCES anteproyecto (idanteproyecto)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE actividad ADD CONSTRAINT fk_actividad_anteproyecto
    FOREIGN KEY (idanteproyecto) REFERENCES anteproyecto (idanteproyecto)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE entregaActividad ADD CONSTRAINT fk_entregaActividad_actividad
    FOREIGN KEY (idactividad) REFERENCES actividad (idactividad)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE entregaActividad ADD CONSTRAINT fk_entregaActividad_usuario
    FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE avance ADD CONSTRAINT fk_avance_anteproyecto
    FOREIGN KEY (idanteproyecto) REFERENCES anteproyecto (idanteproyecto)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE entregaAvance ADD CONSTRAINT fk_entregaAvance_avance
    FOREIGN KEY (idavance) REFERENCES avance (idavance)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE entregaAvance ADD CONSTRAINT fk_entregaAvance_estudiante
    FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cursoEstudiante ADD CONSTRAINT fk_cursoEstudiante_curso
    FOREIGN KEY (idCurso) REFERENCES curso (idcurso)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cursoEstudiante ADD CONSTRAINT fk_cursoEstudiante_estudiante
    FOREIGN KEY (idUsuario) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cursoExperienciaEducativa ADD CONSTRAINT fk_cursoExperienciaEducativa_experienciaEducativa
    FOREIGN KEY (idExperienciaEducativa) REFERENCES experienciaEducativa (idexperienciaEducativa)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cursoExperienciaEducativa ADD CONSTRAINT fk_cursoExperienciEducativa_curso
    FOREIGN KEY (idCurso) REFERENCES curso (idcurso)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE experienciaEducativaAcademico ADD CONSTRAINT fk_experienciaEducativaAcademico_usuario
    FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE experienciaEducativaAcademico ADD CONSTRAINT fk_experienciaEducativaAcademico_experienciaEducativa
    FOREIGN KEY (idexperienciaEducativa) REFERENCES experienciaEducativa (idexperienciaEducativa)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LGACcuerpoAcademico ADD CONSTRAINT fk_LGACCuerpoAcademico_cuerpoAcademico
    FOREIGN KEY (idcuerpoAcademico) REFERENCES cuerpoAcademico (idcuerpoAcademico)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LGACcuerpoAcademico ADD CONSTRAINT fk_LGACCuerpoAcademico_LGAC
    FOREIGN KEY (idLGAC) REFERENCES LGAC (idLGAC)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE academicoCuerpoAcademico ADD CONSTRAINT fk_academicoCuerpoAcademico_cuerpoAcademico
    FOREIGN KEY (idcuerpoAcademico) REFERENCES cuerpoAcademico (idcuerpoAcademico)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE academicoCuerpoAcademico ADD CONSTRAINT fk_academicoCuerpoAcademico_usuario
    FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usuarioRolAcademico ADD CONSTRAINT fk_usuarioRolAcademico_usuario
    FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usuarioRolAcademico ADD CONSTRAINT fk_usuarioRolAcademico_rolAcademico
    FOREIGN KEY (idrolAcademico) REFERENCES rolAcademico (idrolAcademico)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE anteproyectoCurso ADD CONSTRAINT fk_anteproyectoCurso_anteproyecto
    FOREIGN KEY (idanteproyecto) REFERENCES anteproyecto (idanteproyecto)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE anteproyectoCurso ADD CONSTRAINT fk_anteproyectoCurso_curso
    FOREIGN KEY (idcurso) REFERENCES curso (idcurso)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE archivoAdjunto ADD CONSTRAINT fk_archivoAdjunto_entregaActividad
    FOREIGN KEY (identregaActividad) REFERENCES entregaActividad (identregaActividad)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE archivoAdjunto ADD CONSTRAINT fk_archivoAdjunto_entregaAvance
    FOREIGN KEY (identregaAvance) REFERENCES entregaAvance (identregaAvance)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE archivoAdjunto ADD CONSTRAINT fk_archivoAdjunto_anteproyecto
    FOREIGN KEY (idanteproyecto) REFERENCES anteproyecto (idanteproyecto)
    ON DELETE CASCADE ON UPDATE CASCADE;
    
/*--------------------------------------------------DATA CREATION--------------------------------------------------*/
/*-------------------CONSTANTES-------------------*/
USE SPGER;
INSERT INTO RolSistema (rolSistema) VALUES ('Administrador');
INSERT INTO RolSistema (rolSistema) VALUES ('Profesor');
INSERT INTO RolSistema (rolSistema) VALUES ('Estudiante');
INSERT INTO RolAcademico (rolAcademico) VALUES ('Profesor experiencia recepcional');
INSERT INTO RolAcademico (rolAcademico) VALUES ('Profesor proyecto guiado');
INSERT INTO RolAcademico (rolAcademico) VALUES ('Codirector de anteproyecto');
INSERT INTO RolAcademico (rolAcademico) VALUES ('Director de anteproyecto');
INSERT INTO RolAcademico (rolAcademico) VALUES ('Integrante de CA');
INSERT INTO RolAcademico (rolAcademico) VALUES ('Colaborador de CA');
INSERT INTO RolAcademico (rolAcademico) VALUES ('Responsable de CA');

/*-------------------USUARIOS-------------------*/
/*----------ESTUDIANTES----------*/
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (21013908, 'Rodolfo', 'Fernandez', 'Rodriguez', 'foforfr007@gmail.com', 'CoronelTocino', '123', 3, NULL);
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (21013909, 'Cesar', 'Basilio', 'Gómez', 'cbasilio@hotmail.com', 'cbasilio', '123', 3, NULL);
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (21013900, 'Andrés', 'Arellano', 'García', 'agarcia@outlokk.com', 'agarcia', '123', 3, NULL);
/*----------ADMINISTRADORES----------*/
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (12345678, 'Martin Emmanuel', 'Cruz', 'Carmona', 'ccarmona', '123', 3, 1, NULL);
/*----------PROFESORES----------*/
/*ENCARGADOS CA*/
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (23456789, 'Julia Aurora', 'Montano', 'Rivas', 'julmontano@uv.mx', 'julmontano', '123', 2, NULL);
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (34567890, 'María Karen', 'Cortes', 'Verdin', 'kcortes@uv.mx', 'kcortes', '123', 2, NULL); 
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (45678901, 'María Del Carmen', 'Mezura', 'Godoy', 'catcye@uv.mx', 'catcye', '123', 2, NULL);
INSERT INTO Usuario (matricula, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, 
username, password, rolSistema, idanteproyecto) 
VALUES (56789012, 'Juana Elisa', 'Escalante', 'Vega', 'jescalante@uv.mx', 'jescalante', '123', 2, NULL);

SELECT * FROM Usuario;

/*-------------------CUERPO ACADEMICO-------------------*/
INSERT INTO CuerpoAcademico (nombre, clave, gradoConsodilacion, fechaRegistro, desAdscripcion, descripcion) 
VALUES ('Metodología y Aplicaciones de las Técnicas y Modelos Estadísticos', 'UVCA107', 'En consolidación', 
NULL, 'Económico-Administrativa Xalapa', 'Descripción del cuerpo académico: Metodología y Aplicaciones de 
las Técnicas y Modelos Estadísticos');
INSERT INTO CuerpoAcademico (nombre, clave, gradoConsodilacion, fechaRegistro, desAdscripcion, descripcion) 
VALUES ('Ingenieria y Tecnología de Software', 'UV-CA-127', 'En consolidación', '2002-06-01', 
'Económico-Administrativa Xalapa', 'Descripción del cuerpo académico: Ingenieria y Tecnología de Software');
INSERT INTO CuerpoAcademico (nombre, clave, gradoConsodilacion, fechaRegistro, desAdscripcion, descripcion) 
VALUES ('Tecnología Computacional y Educativa', 'UV-CA-184', 'Consolidado', '2003-01-01', 
'Económico-Administrativa Xalapa', 'Descripción del cuerpo académico: Tecnología Computacional y Educativa');
INSERT INTO CuerpoAcademico (nombre, clave, gradoConsodilacion, fechaRegistro, desAdscripcion, descripcion) 
VALUES ('Didáctica y Aplicaciones de la Matemática', 'CA-424', 'En Formación', NULL, 
'Económico-Administrativa Xalapa', 'Descripción del cuerpo académico: Didáctica y Aplicaciones de la Matemática');
SELECT * FROM cuerpoacademico;

/*-------------------TABLAS N:N-------------------*/
INSERT INTO academicoCuerpoAcademico (idusuario, idcuerpoAcademico) 
VALUES (5, 1); 
INSERT INTO academicoCuerpoAcademico (idusuario, idcuerpoAcademico) 
VALUES (6, 2); 
INSERT INTO academicoCuerpoAcademico (idusuario, idcuerpoAcademico) 
VALUES (7, 3); 
INSERT INTO academicoCuerpoAcademico (idusuario, idcuerpoAcademico) 
VALUES (8, 4); 

INSERT INTO usuarioRolAcademico (idusuario, idrolAcademico)
VALUES (5, 7);
INSERT INTO usuarioRolAcademico (idusuario, idrolAcademico)
VALUES (6, 7);
INSERT INTO usuarioRolAcademico (idusuario, idrolAcademico)
VALUES (7, 7);
INSERT INTO usuarioRolAcademico (idusuario, idrolAcademico)
VALUES (8, 7);

