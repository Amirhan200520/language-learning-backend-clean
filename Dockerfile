FROM openjdk:17-jdk-slim

WORKDIR /app

# Установка необходимых инструментов
RUN apt-get update && apt-get install -y unzip wget

# Установка Gradle
RUN wget https://services.gradle.org/distributions/gradle-7.6-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-7.6-bin.zip && \
    rm /tmp/gradle-7.6-bin.zip
ENV GRADLE_HOME=/opt/gradle/gradle-7.6
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# Копирование проекта
COPY . .

# Сборка проекта
RUN cd languagelearning && gradle bootJar --no-daemon

# Копирование JAR-файла
RUN mkdir -p /app/deploy
RUN cp languagelearning/build/libs/languagelearning.jar /app/deploy/app.jar

# Установка рабочей директории
WORKDIR /app/deploy

EXPOSE 8080

CMD ["java", "-jar", "app.jar"] 