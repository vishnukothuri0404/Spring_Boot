# Use an official Maven image with Java 17 as a build environment
FROM maven:3.8.4-eclipse-temurin-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/vishnukothuri0404/Spring_Boot.git .

# Package the application using Maven
RUN mvn clean package

# Use a new lightweight image for the runtime
FROM eclipse-temurin:17-jre

# Copy the built jar file from the Maven container and rename it
COPY --from=build /app/target/*.jar /app/Vishnu_Project_SpringBoot_Application.jar

# Set the entry point to run the renamed jar file
ENTRYPOINT ["java", "-jar", "/app/Vishnu_Project_SpringBoot_Application.jar"]

# Expose the application port (default is 8080 for Spring Boot)
EXPOSE 8080
