package com.bob.user.repositories

import com.bob.user.domain.entities.User
import org.springframework.data.jpa.repository.JpaRepository

interface UserRepository : JpaRepository<User, Long> {
    fun findByEmail(email: String?): User?
    fun existsByEmail(email: String?): Boolean
}