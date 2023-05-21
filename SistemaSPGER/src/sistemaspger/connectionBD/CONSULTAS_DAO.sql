/*--------------------------USUARIO--------------------------*/
INSERT INTO Usuarios (matricula, nombre, apellidoPaterno, apellidoMaterno, 
username, password, idRolSistema, idRolAcademico, idAnteproyecto) 
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?); 

SELECT Usuarios.idUsuario, matricula, Usuarios.nombre AS 'nombreUsuario', 
apellidoPaterno, apellidoMaterno, username, password, Usuarios.idRolSistema, 
RolesSistema.rolSistema, Usuarios_RolesAcademicos.idRolAcademico, RolesAcademicos.rolAcademico, 
Usuarios.idAnteproyecto, Anteproyectos.nombre as 'nombreAnteproyecto' 
FROM Usuarios 
LEFT JOIN Anteproyectos ON Usuarios.idAnteproyecto = Anteproyectos.idAnteproyecto 
LEFT JOIN RolesSistema ON Usuarios.idRolSistema = RolesSistema.idRolSistema 
LEFT JOIN Usuarios_RolesAcademicos ON Usuarios.idUsuario = Usuarios_RolesAcademicos.idUsuario 
LEFT JOIN RolesAcademicos ON Usuarios.idRolAcademico = RolesAcademicos.idRolAcademico 
WHERE Usuarios.idUsuario = ?; 

SELECT Usuarios.idUsuario, matricula, Usuarios.nombre AS 'nombreUsuario', 
apellidoPaterno, apellidoMaterno, username, password, Usuarios.idRolSistema, 
RolesSistema.rolSistema, Usuarios_RolesAcademicos.idRolAcademico, RolesAcademicos.rolAcademico, 
Usuarios.idAnteproyecto, Anteproyectos.nombre as 'nombreAnteproyecto' 
FROM Usuarios 
LEFT JOIN Anteproyectos ON Usuarios.idAnteproyecto = Anteproyectos.idAnteproyecto 
LEFT JOIN RolesSistema ON Usuarios.idRolSistema = RolesSistema.idRolSistema 
LEFT JOIN Usuarios_RolesAcademicos ON Usuarios.idUsuario = Usuarios_RolesAcademicos.idUsuario 
LEFT JOIN RolesAcademicos ON Usuarios.idRolAcademico = RolesAcademicos.idRolAcademico; 

UPDATE Usuarios SET matricula = ?, nombre = ?, apellidoPaterno = ?, apelldiMaterno = ?, 
username = ?, password = ?, idRolSistema = ?, idRolAcademico = ?, idAnteproyecto = ?  
WHERE idUsuario = ?;

DELETE FROM Usuario WHERE idUsuario = ?; 

SELECT idUsuario, nombre, username, password, Usuarios.idRolSistema, 
RolesSistema.rolSistema, Usuarios.idRolAcademico, RolesAcademicos.RolAcademico 
FROM Usuarios 
LEFT JOIN RolesSistema ON Usuarios.idRolSistema = RolesSistema.idRolSistema 
LEFT JOIN RolesAcademicos ON Usuarios.idRolAcademico = RolesAcademicos.idRolAcademico 
WHERE username = ? AND password = ?;
                                  
/*--------------------------CUERPO ACADEMICO--------------------------*/
INSERT INTO CuerposAcademicos (clave, gradoConsolidacion, fechaRegistro, descripcion) 
VALUES (?, ?, ?, ?); 

SELECT idCuerpoAcademico, clave, gradoConsolidacion, fechaRegistro, descripcion 
FROM CuerposAcademicos 
WHERE idCuerpoAcademico = ?; 

SELECT idCuerpoAcademico, clave, gradoConsolidacion, fechaRegistro, descripcion 
FROM CuerposAcademicos;

UPDATE CuerposAcademicos SET clave = ?, gradoConsolidacion = ?, 
fechaRegistro = ?, descripcion = ? 
WHERE idCuerpoAcademico = ?;

DELETE FROM CuerposAcademicos WHERE idCuerpoAcademico = ?; 

/*--------------------------CURSOS--------------------------*/
INSERT INTO Cursos (nombre, periodo, fechaInicio, fechaFin) VALUES (?, ?, ?, ?); 

SELECT idCurso, nombre, periodo, fechaInicio, fechaFin 
FROM Cursos 
WHERE idCurso = ?; 

SELECT idCurso, nombre, periodo, fechaInicio, fechaFin 
FROM Cursos; 

UPDATE Cursos SET nombre = ?, periodo = ?, fechaInicio = ?, fechaFin = ? 
WHERE idCurso = ?;

DELETE FROM Cursos WHERE idCurso= ?; 

/*--------------------------LGAC--------------------------*/
INSERT INTO LGAC (numero, nombre, descripcion) VALUES (?, ?, ?); 

SELECT idLGAC, numero, nombre, descripcion 
FROM LGAC 
WHERE idLGAC = ?; 

SELECT idLGAC, numero, nombre, descripcion 
FROM LGAC; 

UPDATE LGAC SET numero = ?, nombre = ?, descripcion = ? 
WHERE idLGAC = ?;

DELETE FROM LGAC WHERE idLGAC = ?; 