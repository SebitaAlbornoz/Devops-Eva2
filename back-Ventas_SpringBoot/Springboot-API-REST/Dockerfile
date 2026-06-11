# Stage 1: Compilación de la aplicación Java
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Imagen ligera de ejecución segura (Usuario no Root)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Crear usuario y grupo de sistema sin privilegios lógicos
RUN addgroup -S spring && adduser -S spring -G spring
RUN mkdir -p /app/data && chown -R spring:spring /app

# Mínimo privilegio activo
USER spring:spring

# Copiar el binario compilado manteniendo los permisos seguros
COPY --from=build --chown=spring:spring /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]