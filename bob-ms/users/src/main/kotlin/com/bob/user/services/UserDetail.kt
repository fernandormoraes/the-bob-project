package com.bob.user.services

import com.bob.user.domain.entities.Role
import com.bob.user.domain.entities.User
import com.bob.user.repositories.UserRepository
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service
import java.util.stream.Collectors

@Service
class UserDetail(
    val userRepo: UserRepository,
) : UserDetailsService {
    override fun loadUserByUsername(username: String?): UserDetails {
        val user: User = userRepo.findByEmail(username)
            ?: throw UsernameNotFoundException("User not exists by Username");

        val authorities = user.roles.stream()
            .map { role: Role ->
                SimpleGrantedAuthority(
                    role.name
                )
            }
            .collect(Collectors.toSet())

        return org.springframework.security.core.userdetails.User(
            username,
            user.password,
            authorities
        )
    }
}