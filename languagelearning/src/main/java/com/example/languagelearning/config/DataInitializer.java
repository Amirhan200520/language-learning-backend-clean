package com.example.languagelearning.config;

import com.example.languagelearning.model.Course;
import com.example.languagelearning.repository.CourseRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataInitializer {
    @Bean
    public CommandLineRunner initCourses(CourseRepository courseRepository) {
        return args -> {
            if (courseRepository.count() == 0) {
                courseRepository.save(new Course(
                    "en",
                    "Английский язык",
                    "Изучайте английский язык с нуля",
                    "beginner",
                    "https://example.com/english.jpg"
                ));
                courseRepository.save(new Course(
                    "fr",
                    "Французский язык",
                    "Французский для начинающих",
                    "beginner",
                    "https://example.com/french.jpg"
                ));
                courseRepository.save(new Course(
                    "de",
                    "Немецкий язык",
                    "Базовый курс немецкого языка",
                    "beginner",
                    "https://example.com/german.jpg"
                ));
            }
        };
    }
} 
 