package com.bob.course.repositories

import com.bob.course.domain.entities.Course
import org.springframework.data.jpa.repository.JpaRepository

interface CourseRepository : JpaRepository<Course, Long> {}