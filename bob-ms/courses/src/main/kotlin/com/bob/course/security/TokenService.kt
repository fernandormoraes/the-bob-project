package com.bob.course.security

import org.springframework.security.oauth2.jwt.JwtDecoder
import org.springframework.stereotype.Service

@Service
class TokenService(
    private val jwtDecoder: JwtDecoder
) {
    fun parseToken(token: String): String? {
        return try {
            val jwt = jwtDecoder.decode(token)
            jwt.claims["username"] as String
        } catch (e: Exception) {
            null
        }
    }
}