FROM maven:3.6.0-jdk-11 AS build
WORKDIR /petclinic

COPY pom.xml ./
COPY src ./src

RUN mvn clean package

FROM openjdk:11-jre-slim

COPY --from=build /petclinic/target/spring-petclinic-*.jar /petclinic.jar

CMD ["java", "-jar", "petclinic.jar"]
