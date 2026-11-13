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

### [`Implementacion SQL/`](./Implementacion%20SQL/)

Contiene la implementación de la siguiente fase:

- [`Informe-base-de-datos.md`](./Implementacion%20SQL/Informe-base-de-datos.md): documentación de la implementación, la carga, las consultas y su correspondencia con la normalización.
- [`01-esquema.sql`](./Implementacion%20SQL/01-esquema.sql): esquema MySQL con las 14 tablas, claves, restricciones e integridad referencial.
- [`02-datos.sql`](./Implementacion%20SQL/02-datos.sql): carga de 10 registros de demostración por tabla.
- [`03-consultas.sql`](./Implementacion%20SQL/03-consultas.sql): diez consultas pertinentes para la gestión de eventos y conferencias.
- [`Resultados-consultas.md`](./Implementacion%20SQL/Resultados-consultas.md): tablas con los resultados esperados para las diez consultas.
- [`captura del diagrama de la base de datos en Dbeaver.png`](./Implementacion%20SQL/captura%20del%20diagrama%20de%20la%20base%20de%20datos%20en%20Dbeaver.png): diagrama de las tablas y sus relaciones generado en DBeaver.

### Presentación del proyecto

- [`Presentacion_Proyecto_Gestion_Eventos.pptx`](./Presentacion_Proyecto_Gestion_Eventos.pptx): presentación del análisis de la situación, modelos E-R y relacional, normalización, esquema SQL, carga de datos, consultas y resultados.

## Descripción y alcance actual

El modelo contempla usuarios y roles; eventos y espacios; inscripciones y tipos de entrada; entradas emitidas; servicios incluidos en las tarifas; pagos; registros de acceso; y evaluaciones de eventos. Las tablas puente representan las relaciones muchos a muchos, y las claves y restricciones descritas buscan preservar la integridad de la información.

El modelo relacional presenta la disponibilidad de entradas y los indicadores de asistencia e ingresos se plantean como valores que se pueden obtener mediante consultas, evitando almacenar contadores derivados. Las sesiones, conferencistas, integraciones externas y funciones avanzadas de eventos virtuales quedan fuera del alcance inicial y se consideran posibles ampliaciones.

## Estado de la entrega

El repositorio organiza el material en tres fases: modelo E-R, modelo relacional normalizado e implementación SQL con informe, datos de prueba y consultas. El esquema corresponde al modelo normalizado, que alcanza tercera forma normal (3FN) y revisa BCNF según las dependencias funcionales documentadas en el informe.
