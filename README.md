## Innovatech Chile

Proyecto desarrollado para implementar una solución en la nube utilizando Docker, Docker Compose, Terraform y Amazon Web Services (AWS). La aplicación fue diseñada bajo una arquitectura Frontend y Backend, permitiendo un despliegue automatizado, escalable y de alta disponibilidad.

# Descripción del proyecto

Innovatech Chile buscó modernizar su infraestructura tecnológica mediante la implementación de una plataforma basada en servicios en la nube.

La solución desarrollada permite ejecutar la aplicación utilizando contenedores Docker, automatizar la creación de infraestructura mediante Terraform y desplegar los servicios sobre Amazon EC2, garantizando una plataforma robusta, portable y preparada para futuros requerimientos.

# Objetivos
Diseñar una arquitectura Frontend y Backend.
Implementar contenedores Docker para cada servicio.
Automatizar el despliegue mediante Docker Compose.
Crear la infraestructura utilizando Terraform (IaC).
Implementar la solución sobre AWS EC2.
Obtener una plataforma escalable y de alta disponibilidad.

# Arquitectura del proyecto

La solución está compuesta por dos capas principales:

# Frontend
Interfaz gráfica para los usuarios.
Envía solicitudes HTTP al Backend.
Presenta la información recibida.
# Backend
Implementa la lógica de negocio.
Procesa las solicitudes del Frontend.
Gestiona el acceso a la base de datos y demás servicios.

# Infraestructura en la nube

Toda la infraestructura fue desplegada en AWS utilizando:

EC2 para alojar la aplicación.
Docker para ejecutar los servicios.
Docker Compose para administrar los contenedores.
Terraform para crear automáticamente los recursos necesarios.

# Docker
Cada componente del sistema fue empaquetado en un contenedor independiente.

Esto permitió:

Portabilidad.
Consistencia entre ambientes.
Fácil mantenimiento.
Despliegue rápido.

# Docker Compose

Docker Compose permite levantar todos los servicios de la aplicación mediante un único comando.

Entre sus ventajas destacan:

Administración centralizada.
Comunicación entre contenedores.
Configuración sencilla.
Inicio y detención automática de todos los servicios.

# Terraform

Terraform fue utilizado como herramienta de Infraestructura como Código (IaC).

Gracias a ello fue posible:

Automatizar el despliegue.
Versionar la infraestructura.
Evitar configuraciones manuales.
Reproducir el entorno cuando sea necesario.

# Amazon Web Services (AWS)

La infraestructura fue implementada utilizando instancias EC2.

Estas instancias proporcionan:

Recursos de procesamiento.
Escalabilidad.
Disponibilidad.
Flexibilidad para futuras ampliaciones.

# Estructura del proyecto
Innovatech-Chile/
│
├── frontend/
├── backend/
├── terraform/
├── docker-compose.yml
├── Dockerfile
└── README.md

# Tecnologías utilizadas
Java
Spring Boot
Docker
Docker Compose
Terraform
AWS EC2
Git
GitHub

# Beneficios obtenidos
Despliegue automatizado.
Infraestructura reproducible.
Arquitectura escalable.
Portabilidad de los servicios.
Mejor administración de la infraestructura.
Mayor disponibilidad de la aplicación.
Facilidad para futuras ampliaciones.

# Mejoras futuras
Implementar un balanceador de carga.
Incorporar una base de datos administrada.
Agregar monitoreo mediante CloudWatch.
Integrar un pipeline CI/CD.
Desplegar múltiples instancias para alta disponibilidad.

# Integrantes
Sebastias Albornoz
Maximiliano Araos
