Arquitectura e Implementación

El proyecto Innovatech Chile fue desarrollado utilizando una arquitectura basada en servicios en la nube, permitiendo que la aplicación sea más flexible,
escalable y fácil de administrar. Para lograrlo, se implementaron tecnologías como Docker, Docker Compose, Terraform y Amazon Web Services (AWS).

Contenedorización con Docker
Se utilizaron Docker y Docker Compose para contenerizar todos los componentes de la aplicación. 
Esto permite que cada servicio se ejecute en un entorno aislado, asegurando que el sistema funcione de la misma manera en cualquier computador o servidor.

Los beneficios de usar Docker son: 
Entornos de desarrollo y producción consistentes.
Mayor portabilidad entre diferentes sistemas operativos.
Simplificación de la administración de dependencias.

Infraestructura como Código con Terraform
La infraestructura fue creada mediante Terraform, permitiendo definir todos los recursos de AWS mediante archivos de configuración.

Con esta herramienta es posible:
Automatizar la creación de la infraestructura.
Reproducir el mismo entorno en cualquier momento.

Reducir errores de configuración manual.
Facilitar el mantenimiento y futuras modificaciones.

Implementación en AWS

La aplicación fue desplegada en Amazon Web Services (AWS) utilizando instancias EC2, donde se ejecutan los contenedores Docker que conforman el sistema.

Esta implementación ofrece:
Infraestructura en la nube.
Alta disponibilidad de los servicios.

El sistema fue desarrollado siguiendo una arquitectura cliente-servidor, separando la aplicación en dos capas principales: Frontend Y Backend

Gracias a Docker, Docker Compose y Terraform, el proceso de despliegue puede realizarse de forma automatizada, reduciendo significativamente el tiempo de configuración del entorno y minimizando errores humanos.

La solución implementada deja una base tecnológica preparada para futuras mejoras, como la incorporación de nuevos microservicios, balanceadores de carga, bases de datos administradas, 
monitoreo y procesos de integración y despliegue continuo (CI/CD).
