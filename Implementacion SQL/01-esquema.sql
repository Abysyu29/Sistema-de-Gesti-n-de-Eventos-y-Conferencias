-- Esquema para la plataforma de gestión de eventos.

CREATE DATABASE IF NOT EXISTS gestion_eventos
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;
USE gestion_eventos;

CREATE TABLE usuario (
    id_usuario BIGINT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
    documento VARCHAR(30) NOT NULL,
    telefono VARCHAR(30),
    estado VARCHAR(15) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario),
    UNIQUE KEY uq_usuario_correo (correo),
    UNIQUE KEY uq_usuario_documento (documento),
    CONSTRAINT chk_usuario_correo_minuscula CHECK (BINARY correo = BINARY LOWER(correo)),
    CONSTRAINT chk_usuario_estado CHECK (estado IN ('activo', 'inactivo', 'bloqueado'))
) ENGINE = InnoDB;

CREATE TABLE rol (
    id_rol BIGINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    PRIMARY KEY (id_rol),
    UNIQUE KEY uq_rol_nombre (nombre)
) ENGINE = InnoDB;

CREATE TABLE usuario_rol (
    id_usuario BIGINT NOT NULL,
    id_rol BIGINT NOT NULL,
    fecha_asignacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario, id_rol),
    CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_usuario_rol_rol FOREIGN KEY (id_rol) REFERENCES rol (id_rol)
) ENGINE = InnoDB;

CREATE TABLE evento (
    id_evento BIGINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    tipo_evento VARCHAR(50) NOT NULL,
    modalidad VARCHAR(12) NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    estado VARCHAR(15) NOT NULL,
    capacidad_maxima INT NOT NULL,
    id_organizador BIGINT NOT NULL,
    PRIMARY KEY (id_evento),
    CONSTRAINT chk_evento_modalidad CHECK (modalidad IN ('presencial', 'virtual', 'hibrida')),
    CONSTRAINT chk_evento_estado CHECK (estado IN ('borrador', 'publicado', 'cancelado', 'finalizado')),
    CONSTRAINT chk_evento_capacidad CHECK (capacidad_maxima > 0),
    CONSTRAINT chk_evento_fechas CHECK (fecha_inicio <= fecha_fin),
    CONSTRAINT fk_evento_organizador FOREIGN KEY (id_organizador) REFERENCES usuario (id_usuario)
) ENGINE = InnoDB;

CREATE TABLE espacio (
    id_espacio BIGINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(120) NOT NULL,
    ubicacion VARCHAR(200) NOT NULL,
    capacidad INT NOT NULL,
    tipo_espacio VARCHAR(50) NOT NULL,
    estado VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_espacio),
    CONSTRAINT chk_espacio_capacidad CHECK (capacidad > 0),
    CONSTRAINT chk_espacio_estado CHECK (estado IN ('activo', 'inactivo', 'mantenimiento'))
) ENGINE = InnoDB;

CREATE TABLE evento_espacio (
    id_evento BIGINT NOT NULL,
    id_espacio BIGINT NOT NULL,
    fecha_asignacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_evento, id_espacio),
    CONSTRAINT fk_evento_espacio_evento FOREIGN KEY (id_evento) REFERENCES evento (id_evento),
    CONSTRAINT fk_evento_espacio_espacio FOREIGN KEY (id_espacio) REFERENCES espacio (id_espacio)
) ENGINE = InnoDB;

CREATE TABLE inscripcion (
    id_inscripcion BIGINT NOT NULL AUTO_INCREMENT,
    id_usuario BIGINT NOT NULL,
    id_evento BIGINT NOT NULL,
    fecha_inscripcion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_inscripcion),
    UNIQUE KEY uq_inscripcion_usuario_evento (id_usuario, id_evento),
    CONSTRAINT chk_inscripcion_estado CHECK (estado IN ('activa', 'cancelada', 'pendiente')),
    CONSTRAINT fk_inscripcion_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_inscripcion_evento FOREIGN KEY (id_evento) REFERENCES evento (id_evento)
) ENGINE = InnoDB;

CREATE TABLE tipo_entrada (
    id_tipo_entrada BIGINT NOT NULL AUTO_INCREMENT,
    id_evento BIGINT NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(12, 2) NOT NULL,
    cupo_total INT NOT NULL,
    fecha_inicio_venta DATETIME NOT NULL,
    fecha_fin_venta DATETIME NOT NULL,
    estado VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_tipo_entrada),
    UNIQUE KEY uq_tipo_entrada_evento_nombre (id_evento, nombre),
    CONSTRAINT chk_tipo_entrada_precio CHECK (precio >= 0),
    CONSTRAINT chk_tipo_entrada_cupo CHECK (cupo_total >= 0),
    CONSTRAINT chk_tipo_entrada_estado CHECK (estado IN ('activo', 'inactivo', 'agotado')),
    CONSTRAINT chk_tipo_entrada_fechas CHECK (fecha_inicio_venta <= fecha_fin_venta),
    CONSTRAINT fk_tipo_entrada_evento FOREIGN KEY (id_evento) REFERENCES evento (id_evento)
) ENGINE = InnoDB;

CREATE TABLE entrada (
    id_entrada BIGINT NOT NULL AUTO_INCREMENT,
    id_inscripcion BIGINT NOT NULL,
    id_tipo_entrada BIGINT NOT NULL,
    codigo_acceso VARCHAR(100) NOT NULL,
    fecha_emision DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_entrada),
    UNIQUE KEY uq_entrada_codigo (codigo_acceso),
    CONSTRAINT chk_entrada_estado CHECK (estado IN ('activa', 'cancelada', 'bloqueada')),
    CONSTRAINT fk_entrada_inscripcion FOREIGN KEY (id_inscripcion) REFERENCES inscripcion (id_inscripcion),
    CONSTRAINT fk_entrada_tipo FOREIGN KEY (id_tipo_entrada) REFERENCES tipo_entrada (id_tipo_entrada)
) ENGINE = InnoDB;

CREATE TABLE servicio (
    id_servicio BIGINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_servicio),
    UNIQUE KEY uq_servicio_nombre (nombre),
    CONSTRAINT chk_servicio_estado CHECK (estado IN ('activo', 'inactivo'))
) ENGINE = InnoDB;

CREATE TABLE entrada_servicio (
    id_tipo_entrada BIGINT NOT NULL,
    id_servicio BIGINT NOT NULL,
    condiciones TEXT,
    PRIMARY KEY (id_tipo_entrada, id_servicio),
    CONSTRAINT fk_entrada_servicio_tipo FOREIGN KEY (id_tipo_entrada) REFERENCES tipo_entrada (id_tipo_entrada),
    CONSTRAINT fk_entrada_servicio_servicio FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio)
) ENGINE = InnoDB;

CREATE TABLE pago (
    id_pago BIGINT NOT NULL AUTO_INCREMENT,
    id_entrada BIGINT NOT NULL,
    valor DECIMAL(12, 2) NOT NULL,
    medio_pago VARCHAR(20) NOT NULL,
    estado VARCHAR(15) NOT NULL,
    referencia VARCHAR(100) NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_pago),
    UNIQUE KEY uq_pago_referencia (referencia),
    CONSTRAINT chk_pago_valor CHECK (valor > 0),
    CONSTRAINT chk_pago_medio CHECK (medio_pago IN ('efectivo', 'tarjeta', 'transferencia', 'plataforma', 'otro')),
    CONSTRAINT chk_pago_estado CHECK (estado IN ('pendiente', 'aprobado', 'rechazado', 'reembolsado')),
    CONSTRAINT fk_pago_entrada FOREIGN KEY (id_entrada) REFERENCES entrada (id_entrada)
) ENGINE = InnoDB;

CREATE TABLE acceso (
    id_acceso BIGINT NOT NULL AUTO_INCREMENT,
    id_entrada BIGINT NOT NULL,
    id_espacio BIGINT,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resultado VARCHAR(15) NOT NULL,
    punto_control VARCHAR(100),
    id_entrada_aprobada BIGINT GENERATED ALWAYS AS (
        CASE WHEN resultado = 'aprobado' THEN id_entrada ELSE NULL END
    ) STORED,
    PRIMARY KEY (id_acceso),
    UNIQUE KEY uq_acceso_aprobado_por_entrada (id_entrada_aprobada),
    CONSTRAINT chk_acceso_resultado CHECK (resultado IN ('aprobado', 'rechazado', 'repetido')),
    CONSTRAINT fk_acceso_entrada FOREIGN KEY (id_entrada) REFERENCES entrada (id_entrada),
    CONSTRAINT fk_acceso_espacio FOREIGN KEY (id_espacio) REFERENCES espacio (id_espacio)
) ENGINE = InnoDB;

CREATE TABLE evaluacion (
    id_evaluacion BIGINT NOT NULL AUTO_INCREMENT,
    id_usuario BIGINT NOT NULL,
    id_evento BIGINT NOT NULL,
    calificacion SMALLINT NOT NULL,
    comentario TEXT,
    fecha_evaluacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_evaluacion),
    UNIQUE KEY uq_evaluacion_usuario_evento (id_usuario, id_evento),
    CONSTRAINT chk_evaluacion_calificacion CHECK (calificacion BETWEEN 1 AND 5),
    CONSTRAINT fk_evaluacion_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_evaluacion_evento FOREIGN KEY (id_evento) REFERENCES evento (id_evento)
) ENGINE = InnoDB;

DELIMITER //

CREATE TRIGGER tr_validar_evento_de_entrada_insert
BEFORE INSERT ON entrada
FOR EACH ROW
BEGIN
    DECLARE evento_inscripcion BIGINT;
    DECLARE evento_tipo BIGINT;

    SELECT id_evento INTO evento_inscripcion
    FROM inscripcion
    WHERE id_inscripcion = NEW.id_inscripcion;

    SELECT id_evento INTO evento_tipo
    FROM tipo_entrada
    WHERE id_tipo_entrada = NEW.id_tipo_entrada;

    IF evento_inscripcion <> evento_tipo THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La inscripción y el tipo de entrada deben pertenecer al mismo evento';
    END IF;
END//

CREATE TRIGGER tr_validar_evento_de_entrada_update
BEFORE UPDATE ON entrada
FOR EACH ROW
BEGIN
    DECLARE evento_inscripcion BIGINT;
    DECLARE evento_tipo BIGINT;

    SELECT id_evento INTO evento_inscripcion
    FROM inscripcion
    WHERE id_inscripcion = NEW.id_inscripcion;

    SELECT id_evento INTO evento_tipo
    FROM tipo_entrada
    WHERE id_tipo_entrada = NEW.id_tipo_entrada;

    IF evento_inscripcion <> evento_tipo THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La inscripción y el tipo de entrada deben pertenecer al mismo evento';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM acceso a
        WHERE a.id_entrada = NEW.id_entrada
          AND a.id_espacio IS NOT NULL
          AND NOT EXISTS (
              SELECT 1 FROM evento_espacio ee
              WHERE ee.id_evento = evento_tipo AND ee.id_espacio = a.id_espacio
          )
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El espacio de un acceso existente no está asignado al evento de la entrada';
    END IF;
END//

CREATE TRIGGER tr_validar_cambio_de_evento_en_inscripcion
BEFORE UPDATE ON inscripcion
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM entrada en
        JOIN tipo_entrada te ON te.id_tipo_entrada = en.id_tipo_entrada
        WHERE en.id_inscripcion = NEW.id_inscripcion
          AND te.id_evento <> NEW.id_evento
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cambio de evento dejaría una entrada asociada a eventos diferentes';
    END IF;
END//

CREATE TRIGGER tr_validar_cambio_de_evento_en_tipo_entrada
BEFORE UPDATE ON tipo_entrada
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM entrada en
        JOIN inscripcion i ON i.id_inscripcion = en.id_inscripcion
        WHERE en.id_tipo_entrada = NEW.id_tipo_entrada
          AND i.id_evento <> NEW.id_evento
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cambio de evento dejaría una entrada asociada a eventos diferentes';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM entrada en
        JOIN acceso a ON a.id_entrada = en.id_entrada
        WHERE en.id_tipo_entrada = NEW.id_tipo_entrada
          AND a.id_espacio IS NOT NULL
          AND NOT EXISTS (
              SELECT 1 FROM evento_espacio ee
              WHERE ee.id_evento = NEW.id_evento AND ee.id_espacio = a.id_espacio
          )
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cambio de evento dejaría un acceso asociado a un espacio no asignado';
    END IF;
END//

CREATE TRIGGER tr_validar_espacio_de_acceso_insert
BEFORE INSERT ON acceso
FOR EACH ROW
BEGIN
    DECLARE evento_entrada BIGINT;

    IF NEW.id_espacio IS NOT NULL THEN
        SELECT te.id_evento INTO evento_entrada
        FROM entrada en
        JOIN tipo_entrada te ON te.id_tipo_entrada = en.id_tipo_entrada
        WHERE en.id_entrada = NEW.id_entrada;

        IF NOT EXISTS (
            SELECT 1 FROM evento_espacio ee
            WHERE ee.id_evento = evento_entrada AND ee.id_espacio = NEW.id_espacio
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El espacio del acceso debe estar asignado al evento de la entrada';
        END IF;
    END IF;
END//

CREATE TRIGGER tr_validar_espacio_de_acceso_update
BEFORE UPDATE ON acceso
FOR EACH ROW
BEGIN
    DECLARE evento_entrada BIGINT;

    IF NEW.id_espacio IS NOT NULL THEN
        SELECT te.id_evento INTO evento_entrada
        FROM entrada en
        JOIN tipo_entrada te ON te.id_tipo_entrada = en.id_tipo_entrada
        WHERE en.id_entrada = NEW.id_entrada;

        IF NOT EXISTS (
            SELECT 1 FROM evento_espacio ee
            WHERE ee.id_evento = evento_entrada AND ee.id_espacio = NEW.id_espacio
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El espacio del acceso debe estar asignado al evento de la entrada';
        END IF;
    END IF;
END//

CREATE TRIGGER tr_proteger_espacio_con_accesos
BEFORE DELETE ON evento_espacio
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM acceso a
        JOIN entrada en ON en.id_entrada = a.id_entrada
        JOIN tipo_entrada te ON te.id_tipo_entrada = en.id_tipo_entrada
        WHERE te.id_evento = OLD.id_evento
          AND a.id_espacio = OLD.id_espacio
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se puede retirar un espacio con accesos registrados para el evento';
    END IF;
END//

DELIMITER ;
