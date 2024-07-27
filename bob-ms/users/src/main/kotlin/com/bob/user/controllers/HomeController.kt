package com.bob.user.controllers

import com.bob.user.domain.entities.Role
import com.bob.user.domain.entities.User
import com.bob.user.dto.ApiException
import com.bob.user.dto.DefaultResponse
import com.bob.user.dto.LoginDto
import com.bob.user.dto.SignUpDto
import com.bob.user.repositories.RoleRepository
import com.bob.user.repositories.UserRepository
import com.bob.user.services.HashService
import com.bob.user.services.TokenService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/api/users")
class HomeController {
    @Autowired
    private val userRepository: UserRepository? = null

    @Autowired
    private val roleRepository: RoleRepository? = null

    @Autowired
    private val passwordEncoder: PasswordEncoder? = null

    @Autowired
    private val hashService: HashService? = null

    @Autowired
    private val tokenService: TokenService? = null

    @PostMapping("/login")
    fun authenticateUser(@RequestBody loginDto: LoginDto): ResponseEntity<DefaultResponse<String>> {
        val user = userRepository!!.findByEmail(loginDto.username) ?: throw ApiException(404, "User not found")

        if (!hashService!!.checkBcrypt(loginDto.password, user.password)) {
            throw ApiException(400, "Credentials are invalid")
        }

        val token = tokenService!!.createToken(user)

        val defaultResponse = DefaultResponse<String>(message = "", data = token);

        return ResponseEntity<DefaultResponse<String>>(defaultResponse, HttpStatus.OK)
    }

    @PostMapping("/signup")
    fun registerUser(@RequestBody signUpDto: SignUpDto): ResponseEntity<*> {            // checking for username exists in a database
        if (userRepository!!.existsByEmail(signUpDto.username)) {
            return ResponseEntity("Username already exists!", HttpStatus.BAD_REQUEST)
        } // checking for email exists in a database eating user object

        val roles: Role = roleRepository!!.findByName("USER").get()

        val user = User(
            null,
            signUpDto.name,
            signUpDto.username,
            signUpDto.email,
            passwordEncoder!!.encode(signUpDto.password),
            setOf(roles));

        userRepository.save<User>(user)
        return ResponseEntity("User is registered successfully!", HttpStatus.OK)
    }

    @GetMapping("/testusers")
    fun get(): ResponseEntity<DefaultResponse<String>> {
        val defaultResponse = DefaultResponse(message = "", data = "");

        return ResponseEntity<DefaultResponse<String>>(defaultResponse, HttpStatus.OK)
    }
}