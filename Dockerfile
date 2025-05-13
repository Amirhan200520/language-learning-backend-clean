FROM openjdk:17-jdk-slim

WORKDIR /app

COPY languagelearning/build/libs/languagelearning.jar /app/app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"] 