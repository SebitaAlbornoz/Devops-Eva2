# Stage 1: Compilación de la aplicación Java
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Imagen ligera de ejecución segura (Usuario no Root)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Crear usuario y grupo de sistema seguro
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Copiar el jar generado
COPY --from=build --chown=spring:spring /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]