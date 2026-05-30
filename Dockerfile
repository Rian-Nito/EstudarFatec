# ===== BUILD =====
FROM eclipse-temurin:21-jdk-jammy AS build

WORKDIR /app

# Copia tudo
COPY . .

# Instala utilitário
RUN apt-get update && apt-get install -y dos2unix

# Corrige quebra de linha e permissão
RUN dos2unix mvnw
RUN chmod +x mvnw

# Compila o projeto
RUN ./mvnw clean package -DskipTests


# ===== RUNTIME =====
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Copia o jar gerado
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-Djava.net.preferIPv4Stack=true", "-jar", "app.jar"]