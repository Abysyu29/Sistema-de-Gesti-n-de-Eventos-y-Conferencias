# Informe de aplicación de normalización

### Información del proyecto

- **Autor:** Andrés Sebastián Pinzón Gutiérrez
- **Código:** 2221887
- **Universidad:** Universidad Industrial de Santander
- **Materia:** Base de Datos I

## 1. Alcance y criterio

Este informe documenta el paso del primer modelo E-R de la plataforma de gestión de eventos a relaciones normalizadas. Se toma como base el modelo y las reglas del documento de la primera entrega, conservando las entidades y relaciones necesarias para administrar usuarios, roles, eventos, espacios, inscripciones, entradas, pagos, servicios, accesos y evaluaciones.

La normalización reduce duplicidad y anomalías de inserción, actualización y eliminación. El resultado se lleva a tercera forma normal (3FN), que es adecuada para las necesidades transaccionales del proyecto. También se revisa BCNF para las relaciones resultantes. Las decisiones, relaciones, tipos y restricciones se encuentran en [`Modelo-relacional.md`](./Modelo-relacional.md).

## 2. Dependencias funcionales principales

Se identifican las siguientes dependencias (los atributos no mencionados como determinantes dependen de la clave indicada):

- **USUARIO:** `id_usuario → nombres, apellidos, correo, documento, telefono, estado, fecha_registro`; además, `correo → id_usuario` y `documento → id_usuario` cuando se informa el documento.
- **ROL:** `id_rol → nombre, descripcion`; `nombre` también identifica un rol.
- **USUARIO_ROL:** `(id_usuario, id_rol) → fecha_asignacion`.
- **EVENTO:** `id_evento → nombre, descripcion, tipo_evento, modalidad, fecha_inicio, fecha_fin, estado, capacidad_maxima, id_organizador`.
- **ESPACIO:** `id_espacio → nombre, ubicacion, capacidad, tipo_espacio, estado`.
- **EVENTO_ESPACIO:** `(id_evento, id_espacio) → fecha_asignacion`.
- **INSCRIPCION:** `id_inscripcion → id_usuario, id_evento, fecha_inscripcion, estado`; la pareja `(id_usuario, id_evento)` es única.
- **TIPO_ENTRADA:** `id_tipo_entrada → id_evento, nombre, descripcion, precio, cupo_total, fechas de venta, estado`; `(id_evento, nombre)` es única.
- **ENTRADA:** `id_entrada → id_inscripcion, id_tipo_entrada, codigo_acceso, fecha_emision, estado`; `codigo_acceso` también es único.
- **SERVICIO:** `id_servicio → nombre, descripcion, estado`; `nombre` también es único.
- **ENTRADA_SERVICIO:** `(id_tipo_entrada, id_servicio) → condiciones`.
- **PAGO:** `id_pago → id_entrada, valor, medio_pago, estado, referencia, fecha_pago`; `referencia` también es única.
- **ACCESO:** `id_acceso → id_entrada, id_espacio, fecha_hora, resultado, punto_control`.
- **EVALUACION:** `id_evaluacion → id_usuario, id_evento, calificacion, comentario, fecha_evaluacion`; `(id_usuario, id_evento)` también es única.

Los campos `id_*` son claves sustitutas para identificar registros. Las claves naturales únicas se conservan como restricciones, no se usan como claves foráneas en cascada.

## 3. Primera forma normal (1FN)

**Criterio:** cada celda contiene un valor atómico y cada fila se identifica mediante una clave; no se representan listas o grupos repetidos en una columna.

**Aplicación:**

- Nombres, correo, documento, fechas, estados y valores monetarios se guardan como atributos individuales con dominios definidos.
- Los roles de un usuario no se guardan como una lista en `USUARIO`: cada asignación se registra como una fila de `USUARIO_ROL`.
- Los espacios usados por eventos se registran en `EVENTO_ESPACIO`, y los servicios de cada tarifa en `ENTRADA_SERVICIO`.
- Los pagos y controles de acceso son filas individuales, lo que permite registrar varios por entrada.
- Los servicios, roles y espacios se representan como catálogos, no como conjuntos de valores separados por comas.

**Resultado:** todas las relaciones cumplen 1FN.

## 4. Segunda forma normal (2FN)

**Criterio:** una relación está en 1FN y cada atributo no primo depende de la clave completa, no de una parte de una clave compuesta.

En las relaciones con clave simple (`USUARIO`, `EVENTO`, `INSCRIPCION`, `ENTRADA`, `PAGO`, entre otras), la dependencia de atributos se da respecto de la clave completa. Para las claves compuestas:

- `USUARIO_ROL`: `fecha_asignacion` depende de la pareja usuario–rol.
- `EVENTO_ESPACIO`: `fecha_asignacion` depende de la pareja evento–espacio.
- `ENTRADA_SERVICIO`: `condiciones` depende de la pareja tipo de entrada–servicio.

Ninguno de esos atributos depende solo de uno de los componentes de la clave. La clave compuesta de inscripción también se protege con la restricción única `(id_usuario, id_evento)`, pero sus demás atributos dependen de `id_inscripcion`.

**Resultado:** no hay dependencias parciales; todas las relaciones cumplen 2FN.

## 5. Tercera forma normal (3FN)

**Criterio:** la relación está en 2FN y los atributos no clave no dependen transitivamente de la clave por medio de otro atributo no clave.

**Decisiones de diseño:**

- Los datos del organizador no se repiten en `EVENTO`; se guardan una sola vez en `USUARIO` y se referencian con `id_organizador`.
- Los datos descriptivos de roles y servicios están en sus catálogos. Las tablas puente guardan únicamente las claves y los atributos propios de la asociación.
- El precio de una tarifa está en `TIPO_ENTRADA`; el importe realmente cobrado se guarda en cada `PAGO`, porque representa una transacción histórica y puede diferir del precio vigente.
- Se usa `cupo_total` en vez de almacenar `cupo_disponible`: el disponible se calcula a partir del cupo total y las entradas vigentes, evitando guardar un valor derivado que podría desactualizarse.
- La asistencia, los ingresos agregados y otros indicadores se calculan desde `ACCESO`, `PAGO` y `ENTRADA`; no se guardan como contadores duplicados.
- La tabla `ENTRADA` conserva su relación con inscripción y tipo de entrada. Una regla de integridad entre relaciones exige que ambas referencias correspondan al mismo evento y que los cambios posteriores no invaliden esa correspondencia, sin duplicar `id_evento` en `ENTRADA`.

**Resultado:** los atributos no clave dependen de la clave, de toda la clave y de nada más que la clave. Las restricciones entre varias relaciones se expresan como reglas de integridad del modelo y no mediante la repetición de datos descriptivos.

## 6. Forma normal de Boyce-Codd (BCNF)

**Criterio:** para cada dependencia funcional no trivial `X → Y` de una relación, `X` debe ser superclave.

En las relaciones simples, sus determinantes son la clave primaria o una clave candidata declarada única (por ejemplo, correo y documento en `USUARIO`, referencia en `PAGO`, código en `ENTRADA`). En las relaciones puente, el determinante de sus atributos es la clave compuesta. Las demás relaciones no tienen dependencias funcionales adicionales entre atributos no clave según las reglas del dominio documentado.

**Resultado:** las relaciones descritas cumplen BCNF bajo esas dependencias funcionales. Restricciones como que un acceso corresponda a un espacio asignado al evento son reglas de integridad entre relaciones; no agregan una dependencia funcional intrarrelacional que requiera descomposición.

## 7. Cambios frente al primer modelo E-R

1. Se cambia `cupo_disponible` por `cupo_total`; la disponibilidad se calcula y no se almacena, para evitar redundancia y valores obsoletos.
2. Se añaden claves únicas para `(id_usuario, id_evento)` en `INSCRIPCION` y `EVALUACION`, `(id_evento, nombre)` en `TIPO_ENTRADA`, y las claves naturales ya previstas para usuario, entrada y pago.
3. Se definen dominios explícitos, nulabilidad, estados válidos, rangos numéricos y marcas de tiempo con zona horaria.
4. Se especifica la coherencia de evento entre inscripción y tarifa de la entrada, y entre entrada y espacio de acceso; las reglas de integridad previenen referencias inconsistentes.
5. `ACCESO.id_espacio` admite `NULL` cuando el acceso es virtual o no está asociado a un espacio físico.
6. Se mantienen las entidades y tablas puente del modelo E-R, con claves foráneas para resolver relaciones uno a muchos y muchos a muchos.

## 8. Conclusión

El modelo resultante mantiene separados los hechos que cambian de forma independiente: persona, evento, rol, tarifa, entrada, transacción, servicio, intento de acceso y evaluación. Las tablas puente resuelven las relaciones muchos a muchos, las claves y restricciones preservan la integridad y los valores calculables se obtienen mediante consultas. Con ello se alcanza 3FN y, con las dependencias funcionales identificadas, BCNF, sin impedir consultas de reportes sobre ingresos, ventas y asistencia.
