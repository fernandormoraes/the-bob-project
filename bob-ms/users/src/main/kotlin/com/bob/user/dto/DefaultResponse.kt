package com.bob.user.dto

import com.bob.user.domain.entities.User

class DefaultResponse<T>(val message: String, val data: T?) {
}