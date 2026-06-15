# Stage 1: Compilación de la aplicación Java
FROM maven:3.9.6-eclipse-temurin-17-jdk-alpine AS builder
WORKDIR /app

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./
RUN chmod +x mvnw && ./mvnw dependency:go-offline -q

COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests -q

# Stage 2: Imagen ligera de ejecución segura (Usuario no Root)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Crear usuario y grupo de sistema seguro
RUN addgroup -S spring && adduser -S spring -G spring
WORKDIR /app

# Copiar el jar generado
COPY --from=builder --chown=spring:spring /app/target/*.jar app.jar

USER spring:spring

EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]