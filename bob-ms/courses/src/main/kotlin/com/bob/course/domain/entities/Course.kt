package com.bob.course.domain.entities

import jakarta.persistence.*

@Entity
@Table(name="course")
class Course (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long?=null,
    @Column(nullable = false)
    val description: String,
    @Column(nullable = false)
    val cover: String,
    @OneToMany
    val module: List<Module>
){
}