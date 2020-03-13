CREATE TABLE alternativas (
    descripción                     VARCHAR2(100),
    id_alternativa                  INTEGER NOT NULL,
    "VALOR LÓGICO"                  INTEGER,
    "PORCENTAJE DE INCREMENTACIÓN"  INTEGER,
    preguntas_id_pregunta           INTEGER NOT NULL
);

ALTER TABLE alternativas ADD CONSTRAINT alternativas_pk PRIMARY KEY ( id_alternativa );

CREATE TABLE alumnos (
    id_alumno         INTEGER NOT NULL,
    nombre_alumno     VARCHAR2(20),
    apellido_paterno  VARCHAR2(20),
    apellido_materno  VARCHAR2(20),
    calificación      INTEGER,
    test_id_test      INTEGER NOT NULL,
    curso_id_curso    INTEGER NOT NULL
);

ALTER TABLE alumnos ADD CONSTRAINT alumnos_pk PRIMARY KEY ( id_alumno );

CREATE TABLE curso (
    id_curso INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE preguntas (
    id_pregunta   INTEGER NOT NULL,
    enunciado     VARCHAR2(70),
    "PUNTAJE "    INTEGER,
    test_id_test  INTEGER NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( id_pregunta );

CREATE TABLE test (
    id_test              INTEGER NOT NULL,
    nombre               VARCHAR2(50),
    descripción          VARCHAR2(60),
    unidad               VARCHAR2(10),
    "FECHA DE CREACIÓN"  VARCHAR2(10)
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( id_test );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_id_pregunta )
        REFERENCES preguntas ( id_pregunta );

ALTER TABLE alumnos
    ADD CONSTRAINT alumnos_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE alumnos
    ADD CONSTRAINT alumnos_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );