CREATE DATABASE SPGER;
USE SPGER;

CREATE TABLE IF NOT EXISTS RolesSistema (
  idRolSistema INT NOT NULL AUTO_INCREMENT,
  rolSistema NVARCHAR(20) NOT NULL,
  PRIMARY KEY (idRolSistema)
);

CREATE TABLE IF NOT EXISTS GradosAcademicos (
  idGradoAcademico INT NOT NULL AUTO_INCREMENT,
  gradoAcademico NVARCHAR(45) NOT NULL,
  PRIMARY KEY (idGradoAcademico)
);

CREATE TABLE IF NOT EXISTS LGAC (
  idLGAC INT NOT NULL AUTO_INCREMENT,
  numero INT NOT NULL,
  nombre NVARCHAR(50) NOT NULL,
  descripcion VARCHAR(150) NOT NULL,
  PRIMARY KEY (idLGAC)
);

CREATE TABLE IF NOT EXISTS CuerposAcademicos (
  idCuerpoAcademico INT NOT NULL AUTO_INCREMENT,
  clave NVARCHAR(45) NOT NULL,
  gradoConsolidacion NVARCHAR(40) NOT NULL,
  fechaRegistro DATE NOT NULL,
  descripcion NVARCHAR(50) NOT NULL,
  PRIMARY KEY (idCuerpoAcademico)
);

CREATE TABLE IF NOT EXISTS ExperienciasEducativas (
  idExperEducativa INT NOT NULL AUTO_INCREMENT,
  NRC INT NOT NULL,
  nombre NVARCHAR(45) NOT NULL,
  creditos INT NOT NULL,
  PRIMARY KEY (idExperEducativa)
);

CREATE TABLE IF NOT EXISTS Cursos (
  idCurso INT NOT NULL AUTO_INCREMENT,
  fechaInicio DATE NOT NULL,
  fechaFin DATE NOT NULL,
  periodo NVARCHAR(45) NOT NULL,
  nombre NVARCHAR(45) NOT NULL,
  PRIMARY KEY (idCurso)
);  

CREATE TABLE IF NOT EXISTS RolesAcademicos (
  idRolAcademico INT NOT NULL AUTO_INCREMENT,
  rolAcademico NVARCHAR(40) NOT NULL,
  PRIMARY KEY (idRolAcademico)
);

CREATE TABLE IF NOT EXISTS Cursos_ExpEducativas (
  idCursoExpEdu INT NOT NULL AUTO_INCREMENT,
  idCurso INT NOT NULL,
  idExperEducativa INT NOT NULL,
  PRIMARY KEY (idCursoExpEdu)
);

CREATE TABLE IF NOT EXISTS Anteproyectos (
  idAnteproyecto INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(100) NOT NULL,
  estado NVARCHAR(20) NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  idLGAC INT NOT NULL,
  idDirector INT NOT NULL,
  idCoDirector INT NOT NULL,
  PRIMARY KEY (idAnteproyecto)
);

CREATE TABLE IF NOT EXISTS Usuarios (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  matricula INT NOT NULL,
  nombre NVARCHAR(45) NOT NULL,
  apellidoPaterno NVARCHAR(45) NOT NULL,
  apellidoMaterno NVARCHAR(45) NOT NULL,
  username NVARCHAR(45) NOT NULL,
  password  NVARCHAR(45) NOT NULL,
  idRolSistema INT NOT NULL,
  idRolAcademico INT NULL,
  idAnteproyecto INT NULL,
  PRIMARY KEY (idusuario)
);

CREATE TABLE IF NOT EXISTS Actividades (
  idActividad INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(150) NOT NULL,
  valor INT NOT NULL,
  fechaCreacion DATE NOT NULL,
  fechaInicio DATETIME NOT NULL,
  fechaCierre DATETIME NOT NULL,
  idAnteproyecto INT NOT NULL,
  PRIMARY KEY (idActividad) 
);

CREATE TABLE IF NOT EXISTS EntregasActividades (
  idEntregaActividad INT NOT NULL AUTO_INCREMENT,
  idActividad INT NOT NULL,
  idUsuario INT NOT NULL,
  descripcion NVARCHAR(150) NOT NULL,
  fechaEntrega DATETIME NOT NULL,
  PRIMARY KEY (idEntregaActividad)
);

CREATE TABLE IF NOT EXISTS Avances (
  idAvance INT NOT NULL AUTO_INCREMENT,
  numAvance INT NOT NULL,
  descripcion NVARCHAR(150) NOT NULL,
  fechaCreacion DATETIME NOT NULL,
  fechaInicio DATETIME NOT NULL,
  fechaCierre DATETIME NOT NULL,
  idAnteproyecto INT NOT NULL,
  PRIMARY KEY (idAvance)
);

CREATE TABLE IF NOT EXISTS EntregasAvances (
  idEntregaAvance INT NOT NULL AUTO_INCREMENT,
  idAvance INT NOT NULL,
  idUsuario INT NOT NULL,
  descripcion NVARCHAR(150) NOT NULL,
  fechaEntrega DATETIME NOT NULL,
  PRIMARY KEY (idEntregaAvance)
);

CREATE TABLE IF NOT EXISTS Cursos_Estudiantes (
  idCursoEstud INT NOT NULL AUTO_INCREMENT,
  idCurso INT NOT NULL,
  idUsuario INT NOT NULL,
  PRIMARY KEY (idCursoEstud)   
);

CREATE TABLE IF NOT EXISTS ExperEducativas_Academicos (
  idExperEducaUsuario INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  idExperEducativa INT NOT NULL,
  PRIMARY KEY (idExperEducaUsuario)
);

CREATE TABLE IF NOT EXISTS LGAC_CuerposAcademicos (
  idLGACCuerpoAcademico INT NOT NULL AUTO_INCREMENT,
  idCuerpoAcad INT NOT NULL,
  idLGAC INT NOT NULL,
  PRIMARY KEY (idLGACCuerpoAcademico)
);

CREATE TABLE IF NOT EXISTS Academicos_CuerposAcademicos (
  idAcadCuerpoAcad INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  idCuerpoAcademico INT NOT NULL,
  PRIMARY KEY (idAcadCuerpoAcad)
);

CREATE TABLE IF NOT EXISTS Usuarios_RolesAcademicos (
  idUsuarioRolAcademico INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  idRolAcademico INT NOT NULL,
  PRIMARY KEY (idUsuarioRolAcademico)
);

CREATE TABLE IF NOT EXISTS Anteproyectos_Cursos (
  idAnteproyectoCurso INT NOT NULL AUTO_INCREMENT,
  idAnteproyecto INT NOT NULL,
  idCurso INT NOT NULL,
  PRIMARY KEY (idAnteproyectoCurso)
);

CREATE TABLE IF NOT EXISTS ArchivosAdjuntos (
  idArchivoAdjunto INT NOT NULL AUTO_INCREMENT,
  nombre NVARCHAR(50) NOT NULL,
  archivo BLOB NOT NULL,
  idEntregaAvance INT NULL,
  idEntregaActividad INT NULL,
  idAnteproyecto INT NULL,
  PRIMARY KEY (idArchivoAdjunto)
);

ALTER TABLE Cursos_ExpEducativas ADD CONSTRAINT FK_CursosExpEducativas_Cursos
FOREIGN KEY(idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE;
ALTER TABLE Cursos_ExpEducativas ADD CONSTRAINT FK_CursosExpEducativas_ExpEducativas
FOREIGN KEY(idExperEducativa) REFERENCES ExperienciasEducativas(idExperEducativa) ON DELETE CASCADE;

ALTER TABLE Avances ADD CONSTRAINT FK_Avances_Anteproyectos
FOREIGN KEY(idAnteproyecto) REFERENCES Anteproyectos(idAnteproyecto) ON DELETE CASCADE;

ALTER TABLE Anteproyectos ADD CONSTRAINT FK_Anteproyectos_LGAC
FOREIGN KEY(idLGAC) REFERENCES LGAC(idLGAC) ON DELETE CASCADE;
ALTER TABLE Anteproyectos ADD CONSTRAINT FK_Anteproyectos_Directores
FOREIGN KEY(idDirector) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;
ALTER TABLE Anteproyectos ADD CONSTRAINT FK_Anteproyectos_CoDirectores
FOREIGN KEY(idCoDirector) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;

ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_RolesSistema
FOREIGN KEY(idRolSistema) REFERENCES RolesSistema(idRolSistema) ON DELETE CASCADE;
ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_RolesAcademicos
FOREIGN KEY(idRolAcademico) REFERENCES RolesAcademicos(idRolAcademico) ON DELETE CASCADE;
ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuarios_Anteproyectos
FOREIGN KEY(idAnteproyecto) REFERENCES Anteproyectos(idAnteproyecto) ON DELETE CASCADE;

ALTER TABLE Actividades ADD CONSTRAINT FK_Actividades_Anteproyectos
FOREIGN KEY(idAnteproyecto) REFERENCES Anteproyectos(idAnteproyecto) ON DELETE CASCADE;

ALTER TABLE EntregasActividades ADD CONSTRAINT FK_EntregasActividades_Actividades
FOREIGN KEY(idActividad) REFERENCES Actividades(idActividad) ON DELETE CASCADE;
ALTER TABLE EntregasActividades ADD CONSTRAINT FK_EntregasActividades_Usuarios
FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;

ALTER TABLE EntregasAvances ADD CONSTRAINT FK_EntregasAvances_Avances
FOREIGN KEY(idAvance) REFERENCES Avances(idAvance) ON DELETE CASCADE;
ALTER TABLE EntregasAvances ADD CONSTRAINT FK_EntregasAvances_Usuarios
FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;

ALTER TABLE ExperEducativas_Academicos ADD CONSTRAINT FK_ExperEducativasAcademicos_Usuarios
FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;
ALTER TABLE ExperEducativas_Academicos ADD CONSTRAINT FK_ExperEducativasAcademicos_ExperEducativas
FOREIGN KEY(idExperEducativa) REFERENCES ExperienciasEducativas(idExperEducativa) ON DELETE CASCADE;

ALTER TABLE Cursos_Estudiantes ADD CONSTRAINT FK_CursosEstudiantes_Usuarios
FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;
ALTER TABLE Cursos_Estudiantes ADD CONSTRAINT FK_CursosEstudiantes_Cursos
FOREIGN KEY(idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE;

ALTER TABLE LGAC_CuerposAcademicos ADD CONSTRAINT FK_LGACCuerposAcad_CuerposAcademicos
FOREIGN KEY(idCuerpoAcad) REFERENCES CuerposAcademicos(idCuerpoAcademico) ON DELETE CASCADE;
ALTER TABLE LGAC_CuerposAcademicos ADD CONSTRAINT FK_LGACCuerposAcad_LGAC
FOREIGN KEY(idLGAC) REFERENCES LGAC(idLGAC) ON DELETE CASCADE;

ALTER TABLE Academicos_CuerposAcademicos ADD CONSTRAINT FK_AcadsCuerposAcads_Usuarios
FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;
ALTER TABLE Academicos_CuerposAcademicos ADD CONSTRAINT FK_AcadsCuerposAcads_CuerposAcademicos
FOREIGN KEY(idCuerpoAcademico) REFERENCES CuerposAcademicos(idCuerpoAcademico) ON DELETE CASCADE;

ALTER TABLE Anteproyectos_Cursos ADD CONSTRAINT FK_AnteproyectosCursos_Anteproyectos
FOREIGN KEY(idAnteproyecto) REFERENCES Anteproyectos(idAnteproyecto) ON DELETE CASCADE;
ALTER TABLE Anteproyectos_Cursos ADD CONSTRAINT FK_AnteproyectosCursos_Cursos
FOREIGN KEY(idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE;

ALTER TABLE Usuarios_RolesAcademicos ADD CONSTRAINT FK_UsuaRolesAcad_Usuarios
FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE;
ALTER TABLE Usuarios_RolesAcademicos ADD CONSTRAINT FK_UsuaRolesAcad_RolesAcademicos
FOREIGN KEY(idRolAcademico) REFERENCES RolesAcademicos(idRolAcademico) ON DELETE CASCADE;

ALTER TABLE ArchivosAdjuntos ADD CONSTRAINT FK_ArchivosAdjuntos_EntregasAvances
FOREIGN KEY(idEntregaAvance) REFERENCES EntregasAvances(idEntregaAvance) ON DELETE CASCADE;
ALTER TABLE ArchivosAdjuntos ADD CONSTRAINT FK_ArchivosAdjuntos_EntregasActividades
FOREIGN KEY(idEntregaActividad) REFERENCES EntregasActividades(idEntregaActividad) ON DELETE CASCADE;
ALTER TABLE ArchivosAdjuntos ADD CONSTRAINT FK_ArchivosAdjuntos_Anteproyectos
FOREIGN KEY(idAnteproyecto) REFERENCES Anteproyectos(idAnteproyecto) ON DELETE CASCADE;