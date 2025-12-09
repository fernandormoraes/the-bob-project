package com.bob.course.controllers

import com.bob.course.domain.entities.Course
import com.bob.course.dto.DefaultResponse
import com.bob.course.repositories.CourseRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.PathVariable


@RestController
@RequestMapping("/api/courses")
class CoursesController {
    @Autowired
    private val authenticationManager: AuthenticationManager? = null

    @Autowired
    private val courseRepository: CourseRepository? = null

    @GetMapping("/")
    fun findAll(): ResponseEntity<DefaultResponse<List<Course>>> {
        val courses: List<Course> = courseRepository!!.findAll()

        return ResponseEntity(DefaultResponse("", courses), HttpStatus.OK)
    }

    @GetMapping("/{id}")
    fun findById(@PathVariable id: Long): ResponseEntity<DefaultResponse<Course?>> {
        val opt = courseRepository!!.findById(id)
        return if (opt.isPresent) {
            val course = opt.get()
            ResponseEntity(DefaultResponse("", course), HttpStatus.OK)
        } else {
            ResponseEntity(DefaultResponse("Course not found", null), HttpStatus.NOT_FOUND)
        }
    }    
}