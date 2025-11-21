# Use OpenJDK 17 as base image
FROM eclipse-temurin:17-jdk


# Set working directory
WORKDIR /app

# Copy the JAR file
COPY target/ws-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8082
EXPOSE 8082

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]