-- Datos para la demostración de la plataforma de gestión de eventos.
USE gestion_eventos;

INSERT INTO usuario (id_usuario, nombres, apellidos, correo, documento, telefono, estado, fecha_registro) VALUES
(1, 'Andrés Sebastián', 'Pinzón Gutiérrez', 'andres.pinzon@example.com', '1000000001', '3001000001', 'activo', '2026-01-05 09:00:00'),
(2, 'Laura', 'Gómez Rojas', 'laura.gomez@example.com', '1000000002', '3001000002', 'activo', '2026-01-06 09:00:00'),
(3, 'Mateo', 'Rodríguez Díaz', 'mateo.rodriguez@example.com', '1000000003', '3001000003', 'activo', '2026-01-07 09:00:00'),
(4, 'Valentina', 'Martínez León', 'valentina.martinez@example.com', '1000000004', '3001000004', 'activo', '2026-01-08 09:00:00'),
(5, 'Santiago', 'Hernández Ruiz', 'santiago.hernandez@example.com', '1000000005', '3001000005', 'activo', '2026-01-09 09:00:00'),
(6, 'Camila', 'López Torres', 'camila.lopez@example.com', '1000000006', '3001000006', 'activo', '2026-01-10 09:00:00'),
(7, 'Daniel', 'Ramírez Castro', 'daniel.ramirez@example.com', '1000000007', '3001000007', 'activo', '2026-01-11 09:00:00'),
(8, 'Mariana', 'Pérez Silva', 'mariana.perez@example.com', '1000000008', '3001000008', 'activo', '2026-01-12 09:00:00'),
(9, 'Nicolás', 'Torres Vargas', 'nicolas.torres@example.com', '1000000009', '3001000009', 'activo', '2026-01-13 09:00:00'),
(10, 'Isabella', 'Castro Moreno', 'isabella.castro@example.com', '1000000010', '3001000010', 'activo', '2026-01-14 09:00:00');

INSERT INTO rol (id_rol, nombre, descripcion) VALUES
(1, 'Administrador', 'Administra la plataforma y sus catálogos.'),
(2, 'Organizador', 'Crea y gestiona eventos.'),
(3, 'Asistente', 'Participa en eventos y puede evaluarlos.'),
(4, 'Conferencista', 'Participa como ponente en eventos.'),
(5, 'Personal de acceso', 'Valida entradas en los puntos de control.'),
(6, 'Operador de pagos', 'Gestiona la conciliación de pagos.'),
(7, 'Soporte', 'Atiende solicitudes de usuarios.'),
(8, 'Coordinador de espacio', 'Coordina espacios y recursos físicos.'),
(9, 'Analista', 'Consulta indicadores de operación.'),
(10, 'Editor', 'Actualiza la información publicada de eventos.');

INSERT INTO usuario_rol (id_usuario, id_rol, fecha_asignacion) VALUES
(1, 1, '2026-01-05 09:15:00'),
(2, 2, '2026-01-06 09:15:00'),
(3, 3, '2026-01-07 09:15:00'),
(4, 4, '2026-01-08 09:15:00'),
(5, 3, '2026-01-09 09:15:00'),
(6, 3, '2026-01-10 09:15:00'),
(7, 3, '2026-01-11 09:15:00'),
(8, 3, '2026-01-12 09:15:00'),
(9, 3, '2026-01-13 09:15:00'),
(10, 3, '2026-01-14 09:15:00');

INSERT INTO evento (id_evento, nombre, descripcion, tipo_evento, modalidad, fecha_inicio, fecha_fin, estado, capacidad_maxima, id_organizador) VALUES
(1, 'Congreso de Tecnología 2026', 'Tendencias de software e innovación.', 'Congreso', 'presencial', '2026-11-20 08:00:00', '2026-11-20 18:00:00', 'publicado', 300, 2),
(2, 'Foro de Educación Digital', 'Herramientas para la enseñanza digital.', 'Foro', 'hibrida', '2026-11-25 09:00:00', '2026-11-25 17:00:00', 'publicado', 180, 2),
(3, 'Seminario de Emprendimiento', 'Modelos de negocio y financiación.', 'Seminario', 'presencial', '2026-12-02 08:30:00', '2026-12-02 16:00:00', 'publicado', 120, 2),
(4, 'Encuentro de Ciencia de Datos', 'Aplicaciones de analítica y datos.', 'Encuentro', 'virtual', '2026-12-10 10:00:00', '2026-12-10 16:00:00', 'publicado', 500, 2),
(5, 'Simposio de Salud Pública', 'Retos actuales de salud pública.', 'Simposio', 'hibrida', '2027-01-15 08:00:00', '2027-01-15 17:00:00', 'publicado', 220, 2),
(6, 'Taller de Diseño Sostenible', 'Prácticas de diseño responsable.', 'Taller', 'presencial', '2027-02-05 09:00:00', '2027-02-05 15:00:00', 'publicado', 80, 2),
(7, 'Conferencia de Energías Limpias', 'Innovación en energía renovable.', 'Conferencia', 'presencial', '2027-02-18 08:30:00', '2027-02-18 18:00:00', 'publicado', 250, 2),
(8, 'Jornada de Gestión Cultural', 'Gestión y producción cultural.', 'Jornada', 'hibrida', '2027-03-03 09:00:00', '2027-03-03 16:30:00', 'publicado', 150, 2),
(9, 'Cumbre de Innovación', 'Proyectos de innovación regional.', 'Cumbre', 'presencial', '2027-03-20 08:00:00', '2027-03-20 18:00:00', 'borrador', 400, 2),
(10, 'Seminario de Seguridad Digital', 'Buenas prácticas de seguridad digital.', 'Seminario', 'virtual', '2027-04-08 10:00:00', '2027-04-08 15:00:00', 'publicado', 350, 2);

INSERT INTO espacio (id_espacio, nombre, ubicacion, capacidad, tipo_espacio, estado) VALUES
(1, 'Auditorio Principal', 'Bucaramanga, Edificio A', 350, 'Auditorio', 'activo'),
(2, 'Sala de Innovación', 'Bucaramanga, Edificio B', 200, 'Sala', 'activo'),
(3, 'Auditorio Emprende', 'Bucaramanga, Edificio C', 150, 'Auditorio', 'activo'),
(4, 'Sala Virtual Alfa', 'Plataforma virtual', 600, 'Virtual', 'activo'),
(5, 'Auditorio Salud', 'Bucaramanga, Edificio D', 250, 'Auditorio', 'activo'),
(6, 'Laboratorio Creativo', 'Bucaramanga, Edificio E', 90, 'Taller', 'activo'),
(7, 'Auditorio Energía', 'Bucaramanga, Edificio F', 280, 'Auditorio', 'activo'),
(8, 'Sala Cultural', 'Bucaramanga, Edificio G', 180, 'Sala', 'activo'),
(9, 'Centro de Convenciones', 'Bucaramanga, Centro', 450, 'Convenciones', 'activo'),
(10, 'Sala Virtual Beta', 'Plataforma virtual', 400, 'Virtual', 'activo');

INSERT INTO evento_espacio (id_evento, id_espacio, fecha_asignacion) VALUES
(1, 1, '2026-10-01 09:00:00'),
(2, 2, '2026-10-02 09:00:00'),
(3, 3, '2026-10-03 09:00:00'),
(4, 4, '2026-10-04 09:00:00'),
(5, 5, '2026-10-05 09:00:00'),
(6, 6, '2026-10-06 09:00:00'),
(7, 7, '2026-10-07 09:00:00'),
(8, 8, '2026-10-08 09:00:00'),
(9, 9, '2026-10-09 09:00:00'),
(10, 10, '2026-10-10 09:00:00');

INSERT INTO inscripcion (id_inscripcion, id_usuario, id_evento, fecha_inscripcion, estado) VALUES
(1, 1, 1, '2026-10-15 10:00:00', 'activa'),
(2, 2, 2, '2026-10-16 10:00:00', 'activa'),
(3, 3, 3, '2026-10-17 10:00:00', 'activa'),
(4, 4, 4, '2026-10-18 10:00:00', 'activa'),
(5, 5, 5, '2026-10-19 10:00:00', 'activa'),
(6, 6, 6, '2026-10-20 10:00:00', 'activa'),
(7, 7, 7, '2026-10-21 10:00:00', 'activa'),
(8, 8, 8, '2026-10-22 10:00:00', 'activa'),
(9, 9, 9, '2026-10-23 10:00:00', 'pendiente'),
(10, 10, 10, '2026-10-24 10:00:00', 'activa');

INSERT INTO tipo_entrada (id_tipo_entrada, id_evento, nombre, descripcion, precio, cupo_total, fecha_inicio_venta, fecha_fin_venta, estado) VALUES
(1, 1, 'General', 'Acceso general al congreso.', 120000, 300, '2026-09-01 00:00:00', '2026-11-19 23:59:59', 'activo'),
(2, 2, 'General', 'Acceso presencial o virtual.', 80000, 180, '2026-09-01 00:00:00', '2026-11-24 23:59:59', 'activo'),
(3, 3, 'Estudiante', 'Tarifa para estudiantes.', 45000, 120, '2026-09-01 00:00:00', '2026-12-01 23:59:59', 'activo'),
(4, 4, 'Virtual', 'Acceso a las sesiones virtuales.', 30000, 500, '2026-09-01 00:00:00', '2026-12-09 23:59:59', 'activo'),
(5, 5, 'General', 'Acceso al simposio.', 90000, 220, '2026-09-01 00:00:00', '2027-01-14 23:59:59', 'activo'),
(6, 6, 'Taller', 'Incluye materiales del taller.', 65000, 80, '2026-09-01 00:00:00', '2027-02-04 23:59:59', 'activo'),
(7, 7, 'General', 'Acceso a todas las conferencias.', 110000, 250, '2026-09-01 00:00:00', '2027-02-17 23:59:59', 'activo'),
(8, 8, 'General', 'Acceso a la jornada cultural.', 50000, 150, '2026-09-01 00:00:00', '2027-03-02 23:59:59', 'activo'),
(9, 9, 'Preventa', 'Tarifa de preventa.', 100000, 400, '2026-09-01 00:00:00', '2027-03-19 23:59:59', 'activo'),
(10, 10, 'Virtual', 'Acceso virtual al seminario.', 40000, 350, '2026-09-01 00:00:00', '2027-04-07 23:59:59', 'activo');

INSERT INTO entrada (id_entrada, id_inscripcion, id_tipo_entrada, codigo_acceso, fecha_emision, estado) VALUES
(1, 1, 1, 'EVT-2026-0001', '2026-10-15 10:05:00', 'activa'),
(2, 2, 2, 'EVT-2026-0002', '2026-10-16 10:05:00', 'activa'),
(3, 3, 3, 'EVT-2026-0003', '2026-10-17 10:05:00', 'activa'),
(4, 4, 4, 'EVT-2026-0004', '2026-10-18 10:05:00', 'activa'),
(5, 5, 5, 'EVT-2026-0005', '2026-10-19 10:05:00', 'activa'),
(6, 6, 6, 'EVT-2026-0006', '2026-10-20 10:05:00', 'activa'),
(7, 7, 7, 'EVT-2026-0007', '2026-10-21 10:05:00', 'activa'),
(8, 8, 8, 'EVT-2026-0008', '2026-10-22 10:05:00', 'activa'),
(9, 9, 9, 'EVT-2026-0009', '2026-10-23 10:05:00', 'activa'),
(10, 10, 10, 'EVT-2026-0010', '2026-10-24 10:05:00', 'activa');

INSERT INTO servicio (id_servicio, nombre, descripcion, estado) VALUES
(1, 'Certificado digital', 'Certificado de participación descargable.', 'activo'),
(2, 'Memorias', 'Acceso a memorias digitales.', 'activo'),
(3, 'Refrigerio', 'Refrigerio durante la jornada.', 'activo'),
(4, 'Almuerzo', 'Almuerzo para la jornada completa.', 'activo'),
(5, 'Material de taller', 'Materiales para actividades prácticas.', 'activo'),
(6, 'Grabaciones', 'Acceso posterior a las grabaciones.', 'activo'),
(7, 'Traducción', 'Servicio de traducción simultánea.', 'activo'),
(8, 'Kit de bienvenida', 'Material institucional de bienvenida.', 'activo'),
(9, 'Zona de networking', 'Acceso a espacios de relacionamiento.', 'activo'),
(10, 'Soporte virtual', 'Asistencia técnica durante el evento.', 'activo');

INSERT INTO entrada_servicio (id_tipo_entrada, id_servicio, condiciones) VALUES
(1, 1, 'Se entrega al completar la asistencia.'),
(2, 2, 'Disponible en formato digital.'),
(3, 3, 'Un refrigerio por participante.'),
(4, 6, 'Disponible durante 30 días.'),
(5, 4, 'Requiere confirmación previa.'),
(6, 5, 'Incluido en el valor de la entrada.'),
(7, 7, 'Sujeto a disponibilidad de idioma.'),
(8, 8, 'Entrega al ingreso.'),
(9, 9, 'Acceso durante los recesos.'),
(10, 10, 'Atención en la sala virtual.');

INSERT INTO pago (id_pago, id_entrada, valor, medio_pago, estado, referencia, fecha_pago) VALUES
(1, 1, 120000, 'tarjeta', 'aprobado', 'PAGO-2026-0001', '2026-10-15 10:10:00'),
(2, 2, 80000, 'transferencia', 'aprobado', 'PAGO-2026-0002', '2026-10-16 10:10:00'),
(3, 3, 45000, 'plataforma', 'aprobado', 'PAGO-2026-0003', '2026-10-17 10:10:00'),
(4, 4, 30000, 'tarjeta', 'aprobado', 'PAGO-2026-0004', '2026-10-18 10:10:00'),
(5, 5, 90000, 'transferencia', 'aprobado', 'PAGO-2026-0005', '2026-10-19 10:10:00'),
(6, 6, 65000, 'efectivo', 'aprobado', 'PAGO-2026-0006', '2026-10-20 10:10:00'),
(7, 7, 110000, 'tarjeta', 'aprobado', 'PAGO-2026-0007', '2026-10-21 10:10:00'),
(8, 8, 50000, 'plataforma', 'aprobado', 'PAGO-2026-0008', '2026-10-22 10:10:00'),
(9, 9, 100000, 'tarjeta', 'pendiente', 'PAGO-2026-0009', '2026-10-23 10:10:00'),
(10, 10, 40000, 'transferencia', 'rechazado', 'PAGO-2026-0010', '2026-10-24 10:10:00');

INSERT INTO acceso (id_acceso, id_entrada, id_espacio, fecha_hora, resultado, punto_control) VALUES
(1, 1, 1, '2026-11-20 08:05:00', 'aprobado', 'Entrada principal'),
(2, 2, 2, '2026-11-25 09:05:00', 'aprobado', 'Acceso norte'),
(3, 3, 3, '2026-12-02 08:35:00', 'aprobado', 'Recepción'),
(4, 4, 4, '2026-12-10 10:05:00', 'aprobado', 'Sala virtual'),
(5, 5, 5, '2027-01-15 08:05:00', 'aprobado', 'Entrada principal'),
(6, 6, 6, '2027-02-05 09:05:00', 'aprobado', 'Recepción del taller'),
(7, 7, 7, '2027-02-18 08:35:00', 'aprobado', 'Acceso central'),
(8, 8, 8, '2027-03-03 09:05:00', 'aprobado', 'Acceso principal'),
(9, 9, 9, '2027-03-20 08:05:00', 'rechazado', 'Entrada principal'),
(10, 10, 10, '2027-04-08 10:05:00', 'repetido', 'Sala virtual');

INSERT INTO evaluacion (id_evaluacion, id_usuario, id_evento, calificacion, comentario, fecha_evaluacion) VALUES
(1, 1, 1, 5, 'Contenido muy completo y bien organizado.', '2026-11-21 10:00:00'),
(2, 2, 2, 4, 'Buenas herramientas para aplicar en clase.', '2026-11-26 10:00:00'),
(3, 3, 3, 5, 'Excelente orientación para emprendedores.', '2026-12-03 10:00:00'),
(4, 4, 4, 4, 'La plataforma funcionó correctamente.', '2026-12-11 10:00:00'),
(5, 5, 5, 5, 'Temas relevantes y ponencias claras.', '2027-01-16 10:00:00'),
(6, 6, 6, 4, 'Actividad práctica y útil.', '2027-02-06 10:00:00'),
(7, 7, 7, 5, 'Muy buen panorama de energías limpias.', '2027-02-19 10:00:00'),
(8, 8, 8, 4, 'Intercambio cultural interesante.', '2027-03-04 10:00:00'),
(9, 9, 9, 3, 'La propuesta tiene una agenda interesante.', '2027-03-21 10:00:00'),
(10, 10, 10, 5, 'Material virtual claro y pertinente.', '2027-04-09 10:00:00');

