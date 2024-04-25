package com.bob.user.repositories

import com.bob.user.domain.entities.Role
import org.springframework.data.jpa.repository.JpaRepository
import java.util.Optional

interface RoleRepository : JpaRepository<Role, Long> {
    fun findByName(name: String?): Optional<Role?>
}