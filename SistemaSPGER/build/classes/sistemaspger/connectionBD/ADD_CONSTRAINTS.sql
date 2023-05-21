alter table anteproyecto add CONSTRAINT fk_anteproyecto_director
    FOREIGN KEY (iddirector)
    REFERENCES usuario (idusuario);

alter table anteproyecto add CONSTRAINT fk_anteproyecto_coDirector
    FOREIGN KEY (idcoDirector)
    REFERENCES usuario (idusuario);

alter table anteproyecto add CONSTRAINT fk_anteproyecto_LGAC
    FOREIGN KEY (idLGAC)
    REFERENCES LGAC (idLGAC);

alter table usuario add CONSTRAINT fk_usuario_rolSistema
    FOREIGN KEY (rolSistema)
    REFERENCES rolSistema (idrolSistema);

alter table usuario add CONSTRAINT fk_usuario_gradoAcademico
    FOREIGN KEY (gradoAcademico)
    REFERENCES gradoAcademico (idgradoAcademico);

alter table usuario add CONSTRAINT fk_usuario_anteproyecto
    FOREIGN KEY (idanteproyecto)
    REFERENCES anteproyecto (idanteproyecto);

alter table actividad add CONSTRAINT fk_actividad-anteproyecto
    FOREIGN KEY (anteproyecto)
    REFERENCES anteproyecto (idanteproyecto);

alter table entregaActividad add CONSTRAINT fk_entregaActividad_actividad
    FOREIGN KEY (idactividad)
    REFERENCES proyecto.actividad (idactividad);

alter table entregaActividad add CONSTRAINT fk_entregaActividad_usuario
    FOREIGN KEY (idusuario)
    REFERENCES proyecto.usuario (idusuario);

alter table avance add CONSTRAINT fk_avance_anteproyecto
    FOREIGN KEY (idanteproyecto)
    REFERENCES proyecto.anteproyecto (idanteproyecto);

alter table entregaAvance add CONSTRAINT fk_entregaAvance_avance
    FOREIGN KEY (idavance)
    REFERENCES proyecto.avance (idavance);

alter table entregaAvance add CONSTRAINT fk_entregaAvance_estudiante
    FOREIGN KEY (idusuario)
    REFERENCES usuario (idusuario);

alter table cursoEstudiante add CONSTRAINT fk_cursoEstudiante_curso
    FOREIGN KEY (idCurso)
    REFERENCES curso (idcurso);

alter table cursoEstudiante add CONSTRAINT fk_cursoEstudiante_estudiante
    FOREIGN KEY (idUsuario)
    REFERENCES usuario (idusuario);

alter table cursoExperienciaEducativa add CONSTRAINT fk_cursoExperienciaEducativa_experienciaEducativa
    FOREIGN KEY (idExperienciaEducativa)
    REFERENCES experienciaEducativa (idexperienciaEducativa);

alter table cursoExperienciaEducativa add CONSTRAINT fk_cursoExperienciEducativa_curso
    FOREIGN KEY (idCurso)
    REFERENCES curso (idcurso);

alter table experienciaEducativaAcademico add CONSTRAINT fk_experienciaEducativaAcademico_usuario
    FOREIGN KEY (idusuario)
    REFERENCES usuario (idusuario);

alter table experienciaEducativaAcademico add CONSTRAINT fk_experienciaEducativaAcademico_experienciaEducativa
    FOREIGN KEY (idexperienciaEducativa)
    REFERENCES experienciaEducativa (idexperienciaEducativa);

alter table LGACcuerpoAcademico add CONSTRAINT fk_LGACCuerpoAcademico_cuerpoAcademico
    FOREIGN KEY (idcuerpoAcademico)
    REFERENCES cuerpoAcademico (idcuerpoAcademico);

alter table LGACcuerpoAcademico add CONSTRAINT fk_LGACCuerpoAcademico_LGAC
    FOREIGN KEY (idLGAC)
    REFERENCES LGAC (idLGAC);

alter table academicoCuerpoAcademico add CONSTRAINT fk_academicoCuerpoAcademico_cuerpoAcademico
    FOREIGN KEY (idcuerpoAcademico)
    REFERENCES cuerpoAcademico (idcuerpoAcademico);

alter table academicoCuerpoAcademico add CONSTRAINT fk_academicoCuerpoAcademico_usuario
    FOREIGN KEY (idusuario)
    REFERENCES usuario (idusuario);

alter table usuarioRolAcademico add CONSTRAINT fk_usuarioRolAcademico_usuario
    FOREIGN KEY (idusuario)
    REFERENCES usuario (idusuario);

alter table usuarioRolAcademico add CONSTRAINT fk_usuarioRolAcademico_rolAcademico
    FOREIGN KEY (idrolAcademico)
    REFERENCES rolAcademico (idrolAcademico);

alter table anteproyectoCurso add CONSTRAINT fk_anteproyectoCurso_anteproyecto
    FOREIGN KEY (idanteproyecto)
    REFERENCES anteproyecto (idanteproyecto);

alter table anteproyectoCurso add CONSTRAINT fk-anteproyectoCurso_curso
    FOREIGN KEY (idcurso)
    REFERENCES curso (idcurso);

alter table archivoAdjunto add CONSTRAINT fk_archivoAdjunto_entregaActividad
    FOREIGN KEY (identregaActividad)
    REFERENCES entregaActividad (identregaActividad);

alter table archivoAdjunto add CONSTRAINT fk_archivoAdjunto_entregaAvance
    FOREIGN KEY (identregaAvance)
    REFERENCES entregaAvance (identregaAvance);

alter table archivoAdjunto add CONSTRAINT fk_archivoAdjunto_anteproyecto
    FOREIGN KEY (idanteproyecto)
    REFERENCES anteproyecto (idanteproyecto);