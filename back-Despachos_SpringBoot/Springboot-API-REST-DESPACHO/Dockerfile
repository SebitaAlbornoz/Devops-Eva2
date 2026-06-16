FROM public.ecr.aws/docker/library/maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests -q

# Stage 2: Imagen ligera de ejecución segura
FROM public.ecr.aws/docker/library/eclipse-temurin:17-jre-alpine
WORKDIR /app
EXPOSE 8081

RUN addgroup -S spring && adduser -S spring -G spring

COPY --from=build /app/target/*.jar app.jar

#Cambiar al usuario seguro
USER spring

ENTRYPOINT ["java", "-jar", "app.jar"]