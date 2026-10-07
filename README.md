## Plataforma de Gestión de Eventos y Conferencias

### Información del proyecto

- **Autor:** Andrés Sebastián Pinzón Gutiérrez
- **Código:** 2221887
- **Universidad:** Universidad Industrial de Santander
- **Materia:** Base de Datos I

## Estructura del contenido

### [`Modelo E-R/`](./Modelo%20E-R/)

Contiene el material de la primera entrega:

- [`Primer-modelo-e-r.md`](./Modelo%20E-R/Primer-modelo-e-r.md): modelo entidad-relación inicial, entidades, relaciones y reglas de negocio.
- [`Actividad-Exploratoria.md`](./Modelo%20E-R/Actividad-Exploratoria.md): conceptos, alcance, tendencias y fuentes de consulta del proyecto.

### [`Modelo Relacional Normalizado/`](./Modelo%20Relacional%20Normalizado/)

Contiene la propuesta relacional normalizada:

- [`Modelo-relacional-normalizado.md`](./Modelo%20Relacional%20Normalizado/Modelo-relacional-normalizado.md): tablas, atributos, dominios o tipos de datos, claves, restricciones y relaciones.
- [`Informe-normalizacion.md`](./Modelo%20Relacional%20Normalizado/Informe-normalizacion.md): dependencias funcionales y proceso de normalización hasta 3FN, con revisión de BCNF.

## Descripción y alcance actual

El modelo contempla usuarios y roles; eventos y espacios; inscripciones y tipos de entrada; entradas emitidas; servicios incluidos en las tarifas; pagos; registros de acceso; y evaluaciones de eventos. Las tablas puente representan las relaciones muchos a muchos, y las claves y restricciones descritas buscan preservar la integridad de la información.

El modelo relacional presenta la disponibilidad de entradas y los indicadores de asistencia e ingresos se plantean como valores que se pueden obtener mediante consultas, evitando almacenar contadores derivados. Las sesiones, conferencistas, integraciones externas y funciones avanzadas de eventos virtuales quedan fuera del alcance inicial y se consideran posibles ampliaciones.

## Estado de la entrega

El repositorio organiza los documentos en las dos carpetas anteriores: el modelo E-R de la primera entrega y el modelo relacional normalizado con su informe. El esquema propuesto alcanza tercera forma normal (3FN) y revisa BCNF según las dependencias funcionales documentadas en el informe.
