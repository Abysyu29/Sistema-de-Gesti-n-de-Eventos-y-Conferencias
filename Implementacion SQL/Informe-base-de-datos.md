# Informe de implementación de la base de datos

## Plataforma de Gestión de Eventos y Conferencias

### Información del proyecto

- **Autor:** Andrés Sebastián Pinzón Gutiérrez
- **Código:** 2221887
- **Universidad:** Universidad Industrial de Santander
- **Materia:** Base de Datos I

## 1. Objetivo y alcance

Esta fase implementa en MySQL de la plataforma. En el esquema permite gestionar usuarios, roles, eventos, espacios, inscripciones, tipos de entrada, entradas, servicios, pagos, accesos y evaluaciones. El diseño mantiene las relaciones y reglas definidas en el [modelo relacional normalizado](../Modelo%20Relacional%20Normalizado/Modelo-relacional-normalizado.md) y su [informe de normalización](../Modelo%20Relacional%20Normalizado/Informe-normalizacion.md).

La carpeta contiene:

- [`01-esquema.sql`](./01-esquema.sql): definición de las 14 tablas, claves, restricciones e integridad entre eventos, entradas y espacios.
- [`02-datos.sql`](./02-datos.sql): datos de demostración, con 10 registros en cada tabla.
- [`03-consultas.sql`](./03-consultas.sql): diez consultas de análisis relacionadas con la operación de eventos.
- [`Resultados-consultas.md`](./Resultados-consultas.md): tablas de resultados esperados de las consultas sobre los datos de demostración.
- [`captura del diagrama de la base de datos en Dbeaver.png`](./captura%20del%20diagrama%20de%20la%20base%20de%20datos%20en%20Dbeaver.png): diagrama de las tablas y sus relaciones en DBeaver.

## 2. Motor y ejecución

Los scripts usan sintaxis de MySQL 8, el motor InnoDB, restricciones `CHECK`, columnas `AUTO_INCREMENT`, disparadores y una columna generada para la unicidad del acceso aprobado. Se deben ejecutar en orden desde un cliente MySQL:

1. `01-esquema.sql`
2. `02-datos.sql`
3. `03-consultas.sql`

El script de esquema crea la base de datos `gestion_eventos` si no existe. Ejecuta el esquema una sola vez y luego la carga y las consultas, en una base vacía. Las fechas se almacenan como `DATETIME` en hora local de Colombia; la aplicación debe mantener una convención horaria coherente. Los datos son ficticios y se incluyen para validar relaciones y consultas, no representan información personal real. `02-datos.sql` ya asigna roles de asistente a varios usuarios y los eventos al usuario con rol Organizador.

## 3. Esquema y correspondencia con el modelo

La implementación contiene las mismas 14 relaciones del modelo normalizado:

`USUARIO`, `ROL`, `USUARIO_ROL`, `EVENTO`, `ESPACIO`, `EVENTO_ESPACIO`, `INSCRIPCION`, `TIPO_ENTRADA`, `ENTRADA`, `SERVICIO`, `ENTRADA_SERVICIO`, `PAGO`, `ACCESO` y `EVALUACION`.

Las claves primarias identifican filas; las claves foráneas preservan las relaciones y las claves únicas impiden duplicar correos, documentos, códigos de entrada, referencias de pago, inscripciones, evaluaciones y asociaciones. Las restricciones `CHECK` aplican dominios de estado, modalidad, rango de calificación, montos, cupos y coherencia de fechas. La clave compuesta se conserva en las tablas puente.

La implementación complementa las reglas entre relaciones con disparadores: una entrada debe relacionar una inscripción y un tipo de entrada del mismo evento; un espacio registrado en un acceso debe estar asignado a ese evento; y no se puede retirar la asignación del espacio mientras existan accesos vinculados. Una columna generada y un índice único limitan a un acceso aprobado por entrada; los intentos rechazados o repetidos no generan valor en esa columna y se conservan.

La disponibilidad se calcula con el cupo total y las entradas activas. La asistencia y los ingresos se obtienen a partir de accesos y pagos aprobados. No se almacenan contadores derivados. El control de sobreventa concurrente y la validación del aforo conjunto de varios espacios requieren una operación transaccional coordinada por la aplicación, como se contempla en las reglas del modelo.

## 4. Carga de datos

Cada una de las 14 tablas contiene diez filas de demostración. Hay un administrador, una organizadora, una conferencista y siete asistentes comunes. La usuaria con rol Organizador está asociada con los eventos; además, su inscripción a uno de ellos ilustra que organizar y participar son relaciones distintas. Los datos también incluyen modalidades presenciales, virtuales e híbridas, diferentes estados de pago y acceso, servicios asociados a tarifas y calificaciones. Las fechas representan la hora local de Colombia.

La carga incluye identificadores explícitos para que los ejemplos y consultas sean reproducibles.

## 5. Consultas

Las diez consultas incluidas responden preguntas habituales del dominio:

1. ¿Qué eventos están programados, cuándo ocurren y quién los organiza?
2. ¿Cuántas inscripciones hay por evento y estado?
3. ¿Cuántas entradas activas y cupos restantes tiene cada tarifa?
4. ¿Qué ingresos aprobados genera cada evento?
5. ¿Cuál es la calificación promedio y cuántas evaluaciones recibió cada evento?
6. ¿Cuántos accesos aprobados y asistentes únicos registra cada evento?
7. ¿Qué espacios están asignados y cuál es su capacidad?
8. ¿Cómo se distribuyen los pagos por estado y medio?
9. ¿Qué servicios incluye cada tipo de entrada y bajo qué condiciones?
10. ¿Qué usuarios se inscribieron, a qué evento y con qué entrada?

## 6. Normalización

La implementación conserva la tercera forma normal (3FN) documentada en la fase anterior y revisada frente a BCNF:

- Los atributos son atómicos y los conjuntos repetidos se resuelven con `USUARIO_ROL`, `EVENTO_ESPACIO` y `ENTRADA_SERVICIO` (1FN).
- En las tablas puente, los atributos descriptivos dependen de la clave compuesta completa (2FN).
- Los datos de usuario, rol, evento, espacio, tarifa y servicio se guardan en sus propias tablas; las asociaciones solo contienen las claves y atributos de la relación. Los indicadores y disponibilidad derivados se consultan en lugar de duplicarse (3FN).
- Las claves primarias, únicas y compuestas identifican los determinantes documentados en el modelo. Las restricciones e integridad entre relaciones no agregan dependencias funcionales transitivas dentro de las tablas; bajo las dependencias funcionales descritas, se conserva BCNF.

## 7. Conclusión

La fase materializa el modelo normalizado como un esquema ejecutable y demostrable. La carga proporciona datos enlazados para probar las reglas y las diez consultas ofrecen reportes de gestión, capacidad, venta, asistencia, pagos y satisfacción sin desnormalizar las relaciones.
