-- Consultas
USE gestion_eventos;

-- 1. Eventos con organizador, modalidad, fechas y aforo.
SELECT e.id_evento, e.nombre, e.tipo_evento, e.modalidad,
       e.fecha_inicio, e.fecha_fin, e.capacidad_maxima,
       CONCAT(u.nombres, ' ', u.apellidos) AS organizador
FROM evento e
JOIN usuario u ON u.id_usuario = e.id_organizador
ORDER BY e.fecha_inicio;

-- 2. Cantidad de inscripciones por evento y estado.
SELECT e.nombre AS evento, i.estado, COUNT(i.id_inscripcion) AS total_inscripciones
FROM evento e
LEFT JOIN inscripcion i ON i.id_evento = e.id_evento
GROUP BY e.id_evento, e.nombre, i.estado
ORDER BY e.nombre, i.estado;

-- 3. Entradas activas y cupos restantes por tipo de entrada.
SELECT e.nombre AS evento, te.nombre AS tipo_entrada, te.cupo_total,
       COUNT(CASE WHEN en.estado = 'activa' THEN en.id_entrada END) AS entradas_activas,
       GREATEST(
           te.cupo_total - COUNT(CASE WHEN en.estado = 'activa' THEN en.id_entrada END),
           0
       ) AS cupos_restantes
FROM tipo_entrada te
JOIN evento e ON e.id_evento = te.id_evento
LEFT JOIN entrada en ON en.id_tipo_entrada = te.id_tipo_entrada
GROUP BY e.id_evento, e.nombre, te.id_tipo_entrada, te.nombre, te.cupo_total
ORDER BY e.nombre, te.nombre;

-- 4. Ingresos aprobados por evento (pagos pendientes/rechazados no se cuentan).
SELECT e.nombre AS evento,
       COALESCE(SUM(CASE WHEN p.estado = 'aprobado' THEN p.valor ELSE 0 END), 0) AS ingresos_aprobados
FROM evento e
LEFT JOIN tipo_entrada te ON te.id_evento = e.id_evento
LEFT JOIN entrada en ON en.id_tipo_entrada = te.id_tipo_entrada
LEFT JOIN pago p ON p.id_entrada = en.id_entrada
GROUP BY e.id_evento, e.nombre
ORDER BY ingresos_aprobados DESC, e.nombre;

-- 5. Promedio de calificación y número de evaluaciones por evento.
SELECT e.nombre AS evento, ROUND(AVG(ev.calificacion), 2) AS promedio,
       COUNT(ev.id_evaluacion) AS total_evaluaciones
FROM evento e
LEFT JOIN evaluacion ev ON ev.id_evento = e.id_evento
GROUP BY e.id_evento, e.nombre
ORDER BY (promedio IS NULL), promedio DESC, e.nombre;

-- 6. Asistencia aprobada registrada en cada evento.
SELECT e.nombre AS evento,
       SUM(CASE WHEN a.resultado = 'aprobado' THEN 1 ELSE 0 END) AS accesos_aprobados,
       COUNT(DISTINCT CASE WHEN a.resultado = 'aprobado' THEN a.id_entrada END) AS asistentes_unicos
FROM evento e
LEFT JOIN tipo_entrada te ON te.id_evento = e.id_evento
LEFT JOIN entrada en ON en.id_tipo_entrada = te.id_tipo_entrada
LEFT JOIN acceso a ON a.id_entrada = en.id_entrada
GROUP BY e.id_evento, e.nombre
ORDER BY asistentes_unicos DESC, e.nombre;

-- 7. Espacios asignados a cada evento y capacidades registradas.
SELECT e.nombre AS evento, es.nombre AS espacio, es.ubicacion,
       es.capacidad AS capacidad_espacio, e.capacidad_maxima AS aforo_evento
FROM evento_espacio ee
JOIN evento e ON e.id_evento = ee.id_evento
JOIN espacio es ON es.id_espacio = ee.id_espacio
ORDER BY e.fecha_inicio, es.nombre;

-- 8. Pagos por estado y medio de pago.
SELECT medio_pago, estado, COUNT(*) AS cantidad, SUM(valor) AS valor_total
FROM pago
GROUP BY medio_pago, estado
ORDER BY medio_pago, estado;

-- 9. Servicios incluidos en cada tipo de entrada.
SELECT e.nombre AS evento, te.nombre AS tipo_entrada, s.nombre AS servicio,
       es.condiciones
FROM entrada_servicio es
JOIN tipo_entrada te ON te.id_tipo_entrada = es.id_tipo_entrada
JOIN evento e ON e.id_evento = te.id_evento
JOIN servicio s ON s.id_servicio = es.id_servicio
ORDER BY e.nombre, te.nombre, s.nombre;

-- 10. Usuarios inscritos con su evento, estado de inscripción y código de entrada.
SELECT CONCAT(u.nombres, ' ', u.apellidos) AS asistente, e.nombre AS evento,
       i.fecha_inscripcion, i.estado AS estado_inscripcion,
       en.codigo_acceso, en.estado AS estado_entrada
FROM inscripcion i
JOIN usuario u ON u.id_usuario = i.id_usuario
JOIN evento e ON e.id_evento = i.id_evento
LEFT JOIN entrada en ON en.id_inscripcion = i.id_inscripcion
ORDER BY i.fecha_inscripcion DESC;
