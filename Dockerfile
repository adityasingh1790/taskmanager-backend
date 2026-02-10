FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy Maven wrapper and give permission
COPY mvnw .
COPY .mvn .mvn
RUN chmod +x mvnw

# Copy pom and download dependencies
COPY pom.xml .
RUN ./mvnw dependency:go-offline

# Copy source and build
COPY src src
RUN ./mvnw clean package -DskipTests

# Run the app
EXPOSE 8080
CMD ["java", "-jar", "target/taskmanager-backend-0.0.1-SNAPSHOT.jar"]
