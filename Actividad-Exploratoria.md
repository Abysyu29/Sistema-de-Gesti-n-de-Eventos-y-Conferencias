# Actividad exploratoria

## Plataforma de Gestión de Eventos y Conferencias

### Información del proyecto

- **Autor:** Andrés Sebastián Pinzón Gutiérrez
- **Código:** 2221887
- **Universidad:** Universidad Industrial de Santander
- **Materia:** Base de Datos I

### Introducción

Una plataforma de gestión de eventos y conferencias ayuda a organizar todo lo relacionado con un evento: su creación, el registro de asistentes, la venta de entradas, el control de ingreso y la evaluación final. Para este proyecto se propone una base de datos relacional que permita guardar la información de forma ordenada y consultar datos sobre ingresos, asistencia y uso de los espacios.


## 1. Conceptos importantes y relevantes

### 1.1 Evento y conferencia

Un **evento** es una actividad organizada que tiene una fecha, un objetivo, un número máximo de asistentes y uno o varios lugares donde se realiza.

Una **conferencia** es un tipo de evento que normalmente incluye ponencias, sesiones, conferencistas y asistentes registrados. El modelo debe permitir manejar otros tipos de evento sin tener que rediseñar la base de datos.

### 1.2 Usuario, asistente y roles

El **usuario** es una persona que utiliza la plataforma. Puede ser un asistente, un organizador, un administrador o una persona encargada de controlar el ingreso. Los roles sirven para indicar qué puede hacer cada usuario y evitan guardar la misma información varias veces.

### 1.3 Organizador y planificación

El **organizador** se encarga de registrar el evento, sus fechas, los lugares, los precios y los servicios. Más adelante también se podrían agregar las sesiones y los conferencistas.

### 1.4 Espacio, capacidad y aforo

Un **espacio** es el lugar donde se realiza un evento, por ejemplo un auditorio o un salón. Su **capacidad** es el número máximo de personas que pueden entrar. El **aforo** es la cantidad de personas que están dentro o que se registraron. Con estos datos se puede saber si un lugar se está llenando demasiado.

### 1.5 Entrada, tarifa y tipo de acceso

Una **entrada** permite que una persona ingrese a un evento. Puede tener un precio diferente según el tipo de asistente o los beneficios incluidos. Algunos ejemplos son entrada general, estudiante o VIP. Es importante guardar el precio de la entrada cuando se compra, porque después el precio puede cambiar.

### 1.6 Registro e inscripción

El **registro** es el momento en que una persona crea su cuenta. La **inscripción** relaciona a esa persona con un evento y permite saber quién está interesado o tiene una entrada. Se debe evitar que la misma persona se inscriba dos veces al mismo evento por error.

### 1.7 Pago y comprobante

El **pago** guarda el valor, la fecha, el medio de pago y su estado. Puede estar pendiente, aprobado, rechazado o reembolsado. También se puede guardar un número de comprobante para identificar la compra.

### 1.8 Servicios y beneficios

Los **servicios** son beneficios que puede recibir una persona con su entrada, como alimentación, material académico, parqueadero o certificación. Una entrada puede incluir varios servicios y un mismo servicio puede estar incluido en diferentes tipos de entrada.

### 1.9 Control de ingreso

El **control de ingreso** revisa que la entrada sea válida y que no haya sido utilizada anteriormente. Puede hacerse con un código QR, un código de barras o el documento de la persona. Se debe guardar la fecha, la hora y el resultado de cada revisión.

### 1.10 Evaluación y satisfacción

La **evaluación** permite conocer la opinión del asistente sobre el evento. Puede tener una calificación, un comentario y la fecha en que se respondió. Esto ayuda a saber qué salió bien y qué se puede mejorar.

### 1.11 Estadísticas e indicadores

Los indicadores principales para la plataforma son:

- Ingresos por evento, tarifa, periodo y medio de pago.
- Número de entradas vendidas, canceladas y reembolsadas.
- Porcentaje de asistencia respecto a las entradas vendidas.
- Aforo por espacio y por franja horaria.
- Uso de servicios incluidos en cada tipo de entrada.
- Calificación promedio y cantidad de evaluaciones.
- Tasa de conversión entre usuarios registrados e inscritos.

Estas estadísticas se pueden obtener usando consultas sobre la base de datos. Para empezar, lo importante es guardar bien la información original y luego hacer consultas para obtener los resultados.

## 2. Tendencias actuales

### 2.1 Eventos híbridos y multiformato

Los eventos presenciales, virtuales e híbridos se gestionan cada vez más desde una misma plataforma. Esto exige distinguir la modalidad del evento, controlar espacios físicos y permitir accesos virtuales, sesiones en línea y contenidos bajo demanda.

### 2.2 Registro digital y acceso sin contacto

El registro previo, las entradas digitales y los códigos QR reducen filas y facilitan la validación. La tendencia también requiere que el sistema pueda trabajar temporalmente sin conexión y sincronizar los ingresos cuando vuelva a estar disponible, evitando registrar dos veces a la misma persona.

### 2.3 Reportes y analítica

Los organizadores necesitan saber cuántas entradas se vendieron, cuántas personas asistieron y qué espacios se utilizaron. En esta primera versión esos datos se pueden obtener con consultas y reportes sencillos. Más adelante se podrían mostrar en un tablero.

### 2.4 Personalización mediante datos

El historial de inscripciones y evaluaciones podría servir en el futuro para recomendar actividades. En ese caso se debe cuidar la información personal y pedir autorización cuando sea necesario.

### 2.5 Automatización e inteligencia artificial

En plataformas actuales se automatizan confirmaciones, recordatorios, certificados, encuestas y alertas de capacidad. La inteligencia artificial también puede apoyar recomendaciones y análisis de comentarios. Para el alcance inicial del proyecto, estos temas se dejan como posibilidades futuras y no forman parte del primer modelo.

### 2.6 Integración entre plataformas

Las plataformas modernas suelen integrarse con pasarelas de pago, correo electrónico, calendarios, videoconferencia, lectores QR y herramientas de analítica. En este primer ejercicio basta con modelar el pago y el control de ingreso como información de la base de datos; las integraciones externas pueden estudiarse en una etapa posterior.

### 2.7 Privacidad, seguridad y cumplimiento

La información de los usuarios y los pagos debe manejarse con cuidado. Para comenzar, se deben guardar solo los datos necesarios, permitir el acceso según el rol y no almacenar directamente los datos de las tarjetas. La seguridad más avanzada se puede estudiar en otra etapa.

### 2.8 Diseño accesible y sostenible

Como tendencia, los formularios y entradas digitales deben ser utilizables por personas con diferentes capacidades y dispositivos. También se busca reducir el uso de papel mediante credenciales digitales y comprobantes electrónicos. Estos aspectos corresponden principalmente a la interfaz y a la operación del sistema, no al diseño relacional inicial.

## 3. Relación de los conceptos con el proyecto

La base de datos inicial debe relacionar al usuario con el evento por medio de una inscripción y una entrada. La entrada debe mostrar su precio y los servicios incluidos. El pago debe guardar la compra, el control de ingreso debe registrar la asistencia y la evaluación debe guardar la opinión del participante. Así se pueden obtener las estadísticas solicitadas de una forma organizada.

El primer modelo entidad-relación se plantea de forma extensible, pero conserva un alcance apropiado para Bases de Datos I: incorpora usuarios, eventos, espacios, entradas, servicios, pagos, accesos y evaluaciones. Las sesiones, conferencistas, modalidades virtuales y nuevos métodos de pago se dejan para etapas posteriores.

## 4. Fuentes de consulta y verificación

Las siguientes fuentes son organizaciones o entidades oficiales y sus enlaces corresponden a sus páginas institucionales.

- ISO. [ISO 20121:2024, sistemas de gestión de la sostenibilidad de eventos](https://www.iso.org/standard/86389.html). La página oficial identifica la norma, su edición 2024 y su aplicación a la gestión sostenible de eventos.
- ISO/IEC. [ISO/IEC 27001:2022, sistemas de gestión de seguridad de la información](https://www.iso.org/isoiec-27001-information-security.html). La página oficial describe los requisitos de un sistema de gestión de seguridad de la información.
- W3C. [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/). Especificación oficial del World Wide Web Consortium sobre accesibilidad del contenido web.
- OWASP. [Application Security Verification Standard (ASVS)](https://owasp.org/www-project-application-security-verification-standard/). Proyecto oficial de OWASP que proporciona requisitos para verificar controles de seguridad en aplicaciones web.
- PCI Security Standards Council. [PCI Data Security Standard (PCI DSS)](https://www.pcisecuritystandards.org/standards/pci-dss/). Sitio oficial del consejo que publica requisitos para proteger datos de pago con tarjeta.

## Conclusión

La plataforma debe tratar el evento como el centro de la operación, pero mantener separadas las personas, las entradas, los pagos, los servicios, los accesos y las evaluaciones. Esta separación favorece la integridad de los datos y permite generar estadísticas mediante consultas. El modelo inicial deja una base comprensible para que, en cursos o etapas posteriores, se agreguen eventos híbridos, integraciones externas y analítica más avanzada.
