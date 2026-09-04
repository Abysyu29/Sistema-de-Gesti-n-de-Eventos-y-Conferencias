# Primer modelo entidad-relación

## Plataforma de Gestión de Eventos y Conferencias

### Información del proyecto

- **Autor:** Andrés Sebastián Pinzón Gutiérrez
- **Código:** 2221887
- **Universidad:** Universidad Industrial de Santander
- **Materia:** Base de Datos I

### Propósito

Este es el primer modelo entidad-relación de la plataforma. Muestra, de forma inicial, cómo se relacionan los usuarios, los eventos, las entradas, los pagos, los ingresos y las evaluaciones.

El modelo es inicial y se puede ampliar después. En otra versión se podrían agregar sesiones, agenda, conferencistas, patrocinadores, facturación, modalidad virtual y notificaciones.

## Diagrama entidad-relación

```mermaid
erDiagram
    USUARIO ||--o{ USUARIO_ROL : tiene
    ROL ||--o{ USUARIO_ROL : asigna
    USUARIO ||--o{ INSCRIPCION : realiza
    USUARIO ||--o{ EVENTO : organiza
    EVENTO ||--o{ INSCRIPCION : recibe
    EVENTO ||--o{ TIPO_ENTRADA : ofrece
    TIPO_ENTRADA ||--o{ ENTRADA : clasifica
    INSCRIPCION ||--o{ ENTRADA : genera
    TIPO_ENTRADA ||--o{ ENTRADA_SERVICIO : incluye
    SERVICIO ||--o{ ENTRADA_SERVICIO : pertenece
    ENTRADA ||--o{ PAGO : se_cancela_con
    ENTRADA ||--o{ ACCESO : registra
    ESPACIO ||--o{ EVENTO_ESPACIO : alberga
    EVENTO ||--o{ EVENTO_ESPACIO : utiliza
    ESPACIO ||--o{ ACCESO : controla
    USUARIO ||--o{ EVALUACION : realiza
    EVENTO ||--o{ EVALUACION : recibe

    USUARIO {
        int id_usuario PK
        string nombres
        string apellidos
        string correo UK
        string documento UK
        string telefono
        string estado
        datetime fecha_registro
    }

    ROL {
        int id_rol PK
        string nombre UK
        string descripcion
    }

    USUARIO_ROL {
        int id_usuario PK, FK
        int id_rol PK, FK
        datetime fecha_asignacion
    }

    EVENTO {
        int id_evento PK
        string nombre
        string descripcion
        string tipo_evento
        string modalidad
        date fecha_inicio
        date fecha_fin
        string estado
        int capacidad_maxima
        int id_organizador FK
    }

    ESPACIO {
        int id_espacio PK
        string nombre
        string ubicacion
        int capacidad
        string tipo_espacio
        string estado
    }

    EVENTO_ESPACIO {
        int id_evento PK, FK
        int id_espacio PK, FK
        datetime fecha_asignacion
    }

    INSCRIPCION {
        int id_inscripcion PK
        int id_usuario FK
        int id_evento FK
        datetime fecha_inscripcion
        string estado
    }

    TIPO_ENTRADA {
        int id_tipo_entrada PK
        int id_evento FK
        string nombre
        string descripcion
        decimal precio
        int cupo_disponible
        datetime fecha_inicio_venta
        datetime fecha_fin_venta
        string estado
    }

    ENTRADA {
        int id_entrada PK
        int id_inscripcion FK
        int id_tipo_entrada FK
        string codigo_acceso UK
        datetime fecha_emision
        string estado
    }

    SERVICIO {
        int id_servicio PK
        string nombre
        string descripcion
        string estado
    }

    ENTRADA_SERVICIO {
        int id_tipo_entrada PK, FK
        int id_servicio PK, FK
        string condiciones
    }

    PAGO {
        int id_pago PK
        int id_entrada FK
        decimal valor
        string medio_pago
        string estado
        string referencia UK
        datetime fecha_pago
    }

    ACCESO {
        int id_acceso PK
        int id_entrada FK
        int id_espacio FK
        datetime fecha_hora
        string resultado
        string punto_control
    }

    EVALUACION {
        int id_evaluacion PK
        int id_usuario FK
        int id_evento FK
        int calificacion
        string comentario
        datetime fecha_evaluacion
    }
```

## Descripción de las entidades

| Entidad | Responsabilidad |
| --- | --- |
| `USUARIO` | Almacena las personas que utilizan la plataforma. |
| `ROL` | Define permisos o perfiles, como asistente, organizador y administrador. |
| `USUARIO_ROL` | Une a los usuarios con los roles que tienen. |
| `EVENTO` | Contiene la información general del evento o conferencia y su organizador. |
| `ESPACIO` | Registra salones, auditorios u otros lugares disponibles. |
| `EVENTO_ESPACIO` | Relaciona los eventos con uno o varios espacios. |
| `INSCRIPCION` | Relaciona a una persona con un evento y registra su estado. |
| `TIPO_ENTRADA` | Define una tarifa, cupo y periodo de venta para un evento. |
| `ENTRADA` | Representa el acceso individual y su código de validación. |
| `SERVICIO` | Catálogo de beneficios ofrecidos por la plataforma. |
| `ENTRADA_SERVICIO` | Indica qué servicios incluye cada tipo de entrada. Es necesaria porque una entrada puede tener varios servicios. |
| `PAGO` | Registra las transacciones y su estado. |
| `ACCESO` | Guarda cada intento de ingreso y permite calcular asistencia y aforo. |
| `EVALUACION` | Guarda la calificación y comentarios de un asistente sobre un evento. |

## Reglas de negocio iniciales

1. No deben existir dos usuarios con el mismo correo o documento.
2. Un usuario puede tener uno o varios roles, según sus responsabilidades.
3. La fecha de inicio de un evento debe ser anterior o igual a la fecha de finalización.
4. Un evento puede usar uno o varios espacios. Un espacio no debería estar reservado para dos eventos al mismo tiempo.
5. Cada inscripción pertenece a un usuario y a un evento.
6. Cada tipo de entrada pertenece a un evento y guarda el precio que tenía cuando se ofreció.
7. El `codigo_acceso` de cada entrada debe ser diferente.
8. Una entrada puede tener varios registros de pago, pero solo los pagos aprobados se deben contar como ingresos.
9. Cada acceso debe indicar si fue aprobado, rechazado o repetido.
10. La cantidad de personas esperada no debe superar la capacidad de los espacios asignados.
11. La calificación de una evaluación debe estar dentro de una escala, por ejemplo, de 1 a 5.
12. Los accesos aprobados permiten saber cuántas personas asistieron y comparar ese número con la capacidad del espacio.

## Posibles ampliaciones

- `SESION` y `CONFERENCISTA` para administrar la agenda detallada.
- `EVENTO_SESION` o una relación equivalente para asignar sesiones a eventos.
- `NOTIFICACION` para recordatorios y confirmaciones.
- `CUPON` o `DESCUENTO` para campañas de venta.
- `CERTIFICADO` para emitir constancias de participación.
- Integración con pasarelas de pago y plataformas de videoconferencia.
