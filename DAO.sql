USE SPGER;
/*------------------------------------------CUERPO ACADEMICO------------------------------------------*/
INSERT INTO CuerpoAcademico (nombre, clave, gradoConsolidacion, fechaRegistro, desAdscripcion) 
VALUES (?, ?, ?, ?, ?);

SELECT CuerpoAcademico.idcuerpoAcademico, CuerpoAcademico.nombre, clave, gradoConsodilacion, 
fechaRegistro, desAdscripcion, Usuario.idusuario, 
CONCAT(usuario.nombre,' ',usuario.apellidoPaterno,' ',usuario.apellidoMaterno) AS 'nombreResponsable' 
FROM CuerpoAcademico RIGHT JOIN AcademicoCuerpoAcademico 
ON CuerpoAcademico.idcuerpoAcademico = AcademicoCuerpoAcademico.idcuerpoAcademico 
LEFT JOIN Usuario ON Usuario.idusuario = AcademicoCuerpoAcademico.idusuario 
RIGHT JOIN UsuarioRolAcademico ON Usuario.idusuario = UsuarioRolAcademico.idusuario 
LEFT JOIN RolAcademico ON RolAcademico.idrolAcademico = UsuarioRolAcademico.idrolAcademico 
WHERE CuerpoAcademico.idcuerpoAcademico = ? AND RolAcademico.rolAcademico = 'Responsable de CA';

SELECT CuerpoAcademico.idcuerpoAcademico, CuerpoAcademico.nombre, clave, gradoConsodilacion, 
fechaRegistro, desAdscripcion, Usuario.idusuario, 
CONCAT(usuario.nombre,' ',usuario.apellidoPaterno,' ',usuario.apellidoMaterno) AS 'nombreResponsable' 
FROM CuerpoAcademico RIGHT JOIN AcademicoCuerpoAcademico 
ON CuerpoAcademico.idcuerpoAcademico = AcademicoCuerpoAcademico.idcuerpoAcademico 
LEFT JOIN Usuario ON Usuario.idusuario = AcademicoCuerpoAcademico.idusuario 
RIGHT JOIN UsuarioRolAcademico ON Usuario.idusuario = UsuarioRolAcademico.idusuario 
LEFT JOIN RolAcademico ON RolAcademico.idrolAcademico = UsuarioRolAcademico.idrolAcademico 
WHERE CuerpoAcademico.idcuerpoAcademico = 1 AND RolAcademico.rolAcademico = 'Responsable de CA';
SELECT * FROM CuerpoAcademico;







