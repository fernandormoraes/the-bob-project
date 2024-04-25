package com.bob.course.domain.entities

import jakarta.persistence.*
import java.sql.Date

@Entity
@Table(name="content")
class Content (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long?=null,
    @Column(nullable = false)
    val title: String,
    @Column(nullable = false)
    val subtitle: String,
    @Column(nullable = false)
    val description: String,
    @Column(nullable = false)
    val video: String,
    @Column(nullable = false)
    val cover: String,
    @Column(nullable = false)
    val attachment: String,
    @Column(nullable = false)
    val createdAt: Date,
    @Column(nullable = false)
    val updatedAt: Date,
){
}