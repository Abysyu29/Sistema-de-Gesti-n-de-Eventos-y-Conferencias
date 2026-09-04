# Modelo gráfico entidad-relación

## Plataforma de Gestión de Eventos y Conferencias

### Información del proyecto

- **Autor:** Andrés Sebastián Pinzón Gutiérrez
- **Código:** 2221887
- **Universidad:** Universidad Industrial de Santander
- **Materia:** Base de Datos I

Este archivo contiene únicamente la representación gráfica del primer modelo entidad-relación.

```mermaid
erDiagram
    USUARIO ||--o{ USUARIO_ROL : tiene
    ROL ||--o{ USUARIO_ROL : asigna
    USUARIO ||--o{ EVENTO : organiza
    USUARIO ||--o{ INSCRIPCION : realiza
    EVENTO ||--o{ INSCRIPCION : recibe
    EVENTO ||--o{ TIPO_ENTRADA : ofrece
    INSCRIPCION ||--o{ ENTRADA : genera
    TIPO_ENTRADA ||--o{ ENTRADA : clasifica
    TIPO_ENTRADA ||--o{ ENTRADA_SERVICIO : incluye
    SERVICIO ||--o{ ENTRADA_SERVICIO : pertenece
    ENTRADA ||--o{ PAGO : registra
    ENTRADA ||--o{ ACCESO : permite
    ESPACIO ||--o{ EVENTO_ESPACIO : contiene
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

> En GitHub, el bloque anterior se visualiza como un diagrama gráfico cuando se abre este archivo.
