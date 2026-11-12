# Resultados de consultas SQL

## Plataforma de Gestión de Eventos y Conferencias

### Información del proyecto

- **Autor:** Andrés Sebastián Pinzón Gutiérrez
- **Código:** 2221887
- **Universidad:** Universidad Industrial de Santander
- **Materia:** Base de Datos I

Las siguientes tablas muestran los resultados esperados al ejecutar las diez consultas de [`03-consultas.sql`](./03-consultas.sql) sobre los datos de demostración de [`02-datos.sql`](./02-datos.sql). Son resultados de referencia, no una lectura en vivo de MySQL. Las fechas se muestran en hora local de Colombia y los valores monetarios en pesos colombianos (COP).

## 1. Eventos y organizadores

Muestra el tipo, modalidad, fechas, aforo y persona organizadora de cada evento.

| ID | Evento | Tipo | Modalidad | Inicio | Fin | Aforo | Organizador |
|---:|---|---|---|---|---|---:|---|
| 1 | Congreso de Tecnología 2026 | Congreso | presencial | 2026-11-20 08:00 | 2026-11-20 18:00 | 300 | Laura Gómez Rojas |
| 2 | Foro de Educación Digital | Foro | hibrida | 2026-11-25 09:00 | 2026-11-25 17:00 | 180 | Laura Gómez Rojas |
| 3 | Seminario de Emprendimiento | Seminario | presencial | 2026-12-02 08:30 | 2026-12-02 16:00 | 120 | Laura Gómez Rojas |
| 4 | Encuentro de Ciencia de Datos | Encuentro | virtual | 2026-12-10 10:00 | 2026-12-10 16:00 | 500 | Laura Gómez Rojas |
| 5 | Simposio de Salud Pública | Simposio | hibrida | 2027-01-15 08:00 | 2027-01-15 17:00 | 220 | Laura Gómez Rojas |
| 6 | Taller de Diseño Sostenible | Taller | presencial | 2027-02-05 09:00 | 2027-02-05 15:00 | 80 | Laura Gómez Rojas |
| 7 | Conferencia de Energías Limpias | Conferencia | presencial | 2027-02-18 08:30 | 2027-02-18 18:00 | 250 | Laura Gómez Rojas |
| 8 | Jornada de Gestión Cultural | Jornada | hibrida | 2027-03-03 09:00 | 2027-03-03 16:30 | 150 | Laura Gómez Rojas |
| 9 | Cumbre de Innovación | Cumbre | presencial | 2027-03-20 08:00 | 2027-03-20 18:00 | 400 | Laura Gómez Rojas |
| 10 | Seminario de Seguridad Digital | Seminario | virtual | 2027-04-08 10:00 | 2027-04-08 15:00 | 350 | Laura Gómez Rojas |

## 2. Inscripciones por evento y estado

Cuenta las inscripciones según su estado.

| Evento | Estado | Inscripciones |
|---|---|---:|
| Conferencia de Energías Limpias | activa | 1 |
| Congreso de Tecnología 2026 | activa | 1 |
| Cumbre de Innovación | pendiente | 1 |
| Encuentro de Ciencia de Datos | activa | 1 |
| Foro de Educación Digital | activa | 1 |
| Jornada de Gestión Cultural | activa | 1 |
| Seminario de Emprendimiento | activa | 1 |
| Seminario de Seguridad Digital | activa | 1 |
| Simposio de Salud Pública | activa | 1 |
| Taller de Diseño Sostenible | activa | 1 |

## 3. Entradas activas y cupos restantes

Compara el cupo de cada tipo de entrada con sus entradas activas.

| Evento | Tipo de entrada | Cupo | Activas | Restantes |
|---|---|---:|---:|---:|
| Conferencia de Energías Limpias | General | 250 | 1 | 249 |
| Congreso de Tecnología 2026 | General | 300 | 1 | 299 |
| Cumbre de Innovación | Preventa | 400 | 1 | 399 |
| Encuentro de Ciencia de Datos | Virtual | 500 | 1 | 499 |
| Foro de Educación Digital | General | 180 | 1 | 179 |
| Jornada de Gestión Cultural | General | 150 | 1 | 149 |
| Seminario de Emprendimiento | Estudiante | 120 | 1 | 119 |
| Seminario de Seguridad Digital | Virtual | 350 | 1 | 349 |
| Simposio de Salud Pública | General | 220 | 1 | 219 |
| Taller de Diseño Sostenible | Taller | 80 | 1 | 79 |

## 4. Ingresos aprobados por evento

Solo suma pagos aprobados. Los pagos pendientes o rechazados no se cuentan.

| Evento | Ingresos aprobados (COP) |
|---|---:|
| Congreso de Tecnología 2026 | $120.000 |
| Conferencia de Energías Limpias | $110.000 |
| Simposio de Salud Pública | $90.000 |
| Foro de Educación Digital | $80.000 |
| Taller de Diseño Sostenible | $65.000 |
| Jornada de Gestión Cultural | $50.000 |
| Seminario de Emprendimiento | $45.000 |
| Encuentro de Ciencia de Datos | $30.000 |
| Cumbre de Innovación | $0 |
| Seminario de Seguridad Digital | $0 |

## 5. Promedio de calificación

Presenta el promedio y el número de evaluaciones por evento.

| Evento | Promedio | Evaluaciones |
|---|---:|---:|
| Conferencia de Energías Limpias | 5,00 | 1 |
| Congreso de Tecnología 2026 | 5,00 | 1 |
| Seminario de Emprendimiento | 5,00 | 1 |
| Seminario de Seguridad Digital | 5,00 | 1 |
| Simposio de Salud Pública | 5,00 | 1 |
| Encuentro de Ciencia de Datos | 4,00 | 1 |
| Foro de Educación Digital | 4,00 | 1 |
| Jornada de Gestión Cultural | 4,00 | 1 |
| Taller de Diseño Sostenible | 4,00 | 1 |
| Cumbre de Innovación | 3,00 | 1 |

## 6. Asistencia aprobada

Cuenta accesos aprobados y entradas distintas con acceso aprobado.

| Evento | Accesos aprobados | Asistentes únicos |
|---|---:|---:|
| Conferencia de Energías Limpias | 1 | 1 |
| Congreso de Tecnología 2026 | 1 | 1 |
| Encuentro de Ciencia de Datos | 1 | 1 |
| Foro de Educación Digital | 1 | 1 |
| Jornada de Gestión Cultural | 1 | 1 |
| Seminario de Emprendimiento | 1 | 1 |
| Simposio de Salud Pública | 1 | 1 |
| Taller de Diseño Sostenible | 1 | 1 |
| Cumbre de Innovación | 0 | 0 |
| Seminario de Seguridad Digital | 0 | 0 |

## 7. Espacios asignados

Muestra la ubicación y capacidad del espacio asignado, junto con el aforo del evento.

| Evento | Espacio | Ubicación | Capacidad del espacio | Aforo del evento |
|---|---|---|---:|---:|
| Congreso de Tecnología 2026 | Auditorio Principal | Bucaramanga, Edificio A | 350 | 300 |
| Foro de Educación Digital | Sala de Innovación | Bucaramanga, Edificio B | 200 | 180 |
| Seminario de Emprendimiento | Auditorio Emprende | Bucaramanga, Edificio C | 150 | 120 |
| Encuentro de Ciencia de Datos | Sala Virtual Alfa | Plataforma virtual | 600 | 500 |
| Simposio de Salud Pública | Auditorio Salud | Bucaramanga, Edificio D | 250 | 220 |
| Taller de Diseño Sostenible | Laboratorio Creativo | Bucaramanga, Edificio E | 90 | 80 |
| Conferencia de Energías Limpias | Auditorio Energía | Bucaramanga, Edificio F | 280 | 250 |
| Jornada de Gestión Cultural | Sala Cultural | Bucaramanga, Edificio G | 180 | 150 |
| Cumbre de Innovación | Centro de Convenciones | Bucaramanga, Centro | 450 | 400 |
| Seminario de Seguridad Digital | Sala Virtual Beta | Plataforma virtual | 400 | 350 |

## 8. Pagos por medio y estado

Agrupa las transacciones por medio de pago y estado.

| Medio de pago | Estado | Cantidad | Valor total (COP) |
|---|---|---:|---:|
| efectivo | aprobado | 1 | $65.000 |
| plataforma | aprobado | 2 | $95.000 |
| tarjeta | aprobado | 3 | $260.000 |
| tarjeta | pendiente | 1 | $100.000 |
| transferencia | aprobado | 2 | $170.000 |
| transferencia | rechazado | 1 | $40.000 |

## 9. Servicios incluidos en las entradas

Relaciona cada servicio con el tipo de entrada y sus condiciones.

| Evento | Tipo de entrada | Servicio | Condiciones |
|---|---|---|---|
| Conferencia de Energías Limpias | General | Traducción | Sujeto a disponibilidad de idioma. |
| Congreso de Tecnología 2026 | General | Certificado digital | Se entrega al completar la asistencia. |
| Cumbre de Innovación | Preventa | Zona de networking | Acceso durante los recesos. |
| Encuentro de Ciencia de Datos | Virtual | Grabaciones | Disponible durante 30 días. |
| Foro de Educación Digital | General | Memorias | Disponible en formato digital. |
| Jornada de Gestión Cultural | General | Kit de bienvenida | Entrega al ingreso. |
| Seminario de Emprendimiento | Estudiante | Refrigerio | Un refrigerio por participante. |
| Seminario de Seguridad Digital | Virtual | Soporte virtual | Atención en la sala virtual. |
| Simposio de Salud Pública | General | Almuerzo | Requiere confirmación previa. |
| Taller de Diseño Sostenible | Taller | Material de taller | Incluido en el valor de la entrada. |

## 10. Usuarios inscritos y entradas

Muestra los datos de inscripción y el código/estado de la entrada correspondiente.

| Asistente | Evento | Inscripción | Estado inscripción | Código | Estado entrada |
|---|---|---|---|---|---|
| Isabella Castro Moreno | Seminario de Seguridad Digital | 2026-10-24 10:00 | activa | EVT-2026-0010 | activa |
| Nicolás Torres Vargas | Cumbre de Innovación | 2026-10-23 10:00 | pendiente | EVT-2026-0009 | activa |
| Mariana Pérez Silva | Jornada de Gestión Cultural | 2026-10-22 10:00 | activa | EVT-2026-0008 | activa |
| Daniel Ramírez Castro | Conferencia de Energías Limpias | 2026-10-21 10:00 | activa | EVT-2026-0007 | activa |
| Camila López Torres | Taller de Diseño Sostenible | 2026-10-20 10:00 | activa | EVT-2026-0006 | activa |
| Santiago Hernández Ruiz | Simposio de Salud Pública | 2026-10-19 10:00 | activa | EVT-2026-0005 | activa |
| Valentina Martínez León | Encuentro de Ciencia de Datos | 2026-10-18 10:00 | activa | EVT-2026-0004 | activa |
| Mateo Rodríguez Díaz | Seminario de Emprendimiento | 2026-10-17 10:00 | activa | EVT-2026-0003 | activa |
| Laura Gómez Rojas | Foro de Educación Digital | 2026-10-16 10:00 | activa | EVT-2026-0002 | activa |
| Andrés Sebastián Pinzón Gutiérrez | Congreso de Tecnología 2026 | 2026-10-15 10:00 | activa | EVT-2026-0001 | activa |
