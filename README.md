# Innovatech Chile

Proyecto desarrollado para implementar una solución en la nube utilizando Docker, Docker Compose, Terraform y Amazon Web Services (AWS). La aplicación fue diseñada bajo una arquitectura Frontend y Backend, permitiendo un despliegue automatizado, escalable y de alta disponibilidad.

## Descripción del proyecto

Innovatech Chile buscó modernizar su infraestructura tecnológica mediante la implementación de una plataforma basada en servicios en la nube.

La solución desarrollada permite ejecutar la aplicación utilizando contenedores Docker, automatizar la creación de infraestructura mediante Terraform y desplegar los servicios sobre Amazon EC2, garantizando una plataforma robusta, portable y preparada para futuros requerimientos.

## Objetivos
Diseñar una arquitectura Frontend y Backend.
Implementar contenedores Docker para cada servicio.
Automatizar el despliegue mediante Docker Compose.
Crear la infraestructura utilizando Terraform (IaC).
Implementar la solución sobre AWS EC2.
Obtener una plataforma escalable y de alta disponibilidad.
Orquestar la aplicación a escala empresarial utilizando Kubernetes (AWS EKS).
Implementar autoescalado horizontal (HPA) para responder dinámicamente a la demanda.
Configurar un pipeline de Integración y Despliegue Continuo (CI/CD) completamente automatizado.
Garantizar la persistencia de datos aislando los módulos en bases de datos MySQL independientes.

## Arquitectura del proyecto

La solución está compuesta por varias capas principales:

La solución evolucionó hacia una arquitectura multi-capa totalmente contenerizada y distribuida:

* **Frontend:** Interfaz gráfica para los usuarios que interactúa con las APIs del Backend.
* **Backend Despachos:** Servicio encargado de procesar la lógica de negocio de entregas y despachos.
* **Backend Ventas:** Servicio que gestiona las transacciones y flujos comerciales de la empresa.
* **Bases de Datos:** Dos instancias independientes de MySQL dedicadas a resguardar la persistencia de datos de cada backend de forma aislada.


## Infraestructura en la nube

Toda la infraestructura fue desplegada en AWS utilizando:

EC2 para alojar la aplicación.
Docker para ejecutar los servicios.
Docker Compose para administrar los contenedores.
Terraform para crear automáticamente los recursos necesarios.

## Docker
Cada componente del sistema fue empaquetado en un contenedor independiente.

Esto permitió:

Portabilidad.
Consistencia entre ambientes.
Fácil mantenimiento.
Despliegue rápido.

## Docker Compose

Docker Compose permite levantar todos los servicios de la aplicación mediante un único comando.

Entre sus ventajas destacan:

Administración centralizada.
Comunicación entre contenedores.
Configuración sencilla.
Inicio y detención automática de todos los servicios.

## Terraform

Terraform fue utilizado como herramienta de Infraestructura como Código (IaC).

Gracias a ello fue posible:

Automatizar el despliegue.
Versionar la infraestructura.
Evitar configuraciones manuales.
Reproducir el entorno cuando sea necesario.

## Amazon Web Services (AWS)

La infraestructura fue implementada utilizando instancias EC2.

Estas instancias proporcionan:

Recursos de procesamiento.
Escalabilidad.
Disponibilidad.
Flexibilidad para futuras ampliaciones.

## Orquestación con Amazon EKS y Kubernetes

Para llevar la plataforma a un nivel de producción empresarial, migramos la ejecución desde instancias EC2 individuales hacia un clúster administrado **Amazon EKS (Elastic Kubernetes Service)**. 

Toda la aplicación se despliega de forma aislada dentro del namespace `innovatech-app`, utilizando los siguientes recursos:
* **Deployments y Services:** Configurados para el Frontend, Backend Ventas, Backend Despachos y sus respectivas bases de datos MySQL.
* **Kubernetes Secrets:** Utilizados para resguardar de forma segura las credenciales de los motores de datos y el token de acceso al registro privado de AWS ECR.
* **Horizontal Pod Autoscaler (HPA):** Configurado en cada microservicio para escalar automáticamente la cantidad de Pods en función del consumo de CPU y memoria, garantizando la alta disponibilidad.

##  Pipeline de CI/CD (GitHub Actions)

El proyecto cuenta con un flujo de integración y despliegue continuo automatizado en `.github/workflows/deploy-eks.yml`. Cada vez que se realiza un cambio en la rama principal, el pipeline realiza lo siguiente:
1. Autentica de forma segura las credenciales de AWS mediante GitHub Secrets.
2. Construye, etiqueta y sube las imágenes actualizadas hacia **Amazon ECR (Elastic Container Registry)**.
3. Actualiza el clúster en **Amazon EKS** gatillando un despliegue inmediato sin tiempo de inactividad.

##  Configuración Requerida en AWS (Redes)

Para el correcto funcionamiento de los balanceadores de carga externos (ELB) expuestos por Kubernetes, es mandatorio agregar los siguientes tags a las subredes públicas creadas por Terraform en la consola de AWS:
`kubernetes.io/role/elb` -> `1`
`kubernetes.io/cluster/innovatech-eks` -> `shared`

## Estructura del proyecto
Innovatech-Chile/
│
├── frontend/
├── backend/
├── terraform/
├── docker-compose.yml
├── Dockerfile
└── README.md

## Tecnologías utilizadas
Java / Spring Boot
Docker / Docker Compose
Terraform (Infraestructura como Código)
Amazon Web Services (AWS EC2, EKS, ECR, ELB)
Kubernetes (kubectl, HPA, Namespaces, Secrets)
GitHub Actions (CI/CD)
MySQL (Bases de datos relacionales)

## Beneficios obtenidos
Despliegue automatizado.
Infraestructura reproducible.
Arquitectura escalable.
Portabilidad de los servicios.
Mejor administración de la infraestructura.
Mayor disponibilidad de la aplicación.
Facilidad para futuras ampliaciones.

## Mejoras futuras
Implementar un balanceador de carga.
Incorporar una base de datos administrada.
Agregar monitoreo mediante CloudWatch.
Integrar un pipeline CI/CD.
Desplegar múltiples instancias para alta disponibilidad.

## Instrucciones de Despliegue (Kubernetes)

Si deseas aplicar los manifiestos de forma manual en el clúster configurado, ejecuta:

# 1. Crear el entorno aislado
kubectl apply -f k8s/namespace.yaml

# 2. Registrar las credenciales de AWS ECR en el clúster
kubectl create secret docker-registry ecr-secret \
  --docker-server=12880683448.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=<AWS_TOKEN> \
  --namespace=innovatech-app

# 3. Desplegar todos los componentes (deployments, services, hpa)
kubectl apply -f k8s/

## Integrantes
Sebastias Albornoz
Maximiliano Araos
