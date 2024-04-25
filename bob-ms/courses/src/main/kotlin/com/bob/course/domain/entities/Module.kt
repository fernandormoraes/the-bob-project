package com.bob.course.domain.entities

import jakarta.persistence.*

@Entity
@Table(name="module")
class Module (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long?=null,
    @Column(nullable = false)
    val description: String,
    @OneToMany
    val content: List<Content>
){
}