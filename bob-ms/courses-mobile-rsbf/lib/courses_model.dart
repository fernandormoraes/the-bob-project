class CoursesResponseModel {
  final String? message;
  final String? userName;
  final List<Data>? data;

  CoursesResponseModel({this.message, this.userName, this.data});

  CoursesResponseModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        userName = '',
        data = List<Data>.from(json['data'].map((d) => Data.fromJson(d)));

  CoursesResponseModel copyWithUsername(String username) {
    return CoursesResponseModel(
      message: message,
      userName: username,
      data: data,
    );
  }
}

class Data {
  final int? id;
  final String? description;
  final String? cover;
  final List<Module>? module;

  Data({this.id, this.description, this.cover, this.module});

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'],
        cover = json['cover'],
        module = List<Module>.from(json['module'].map((d) => Data.fromJson(d)));
}

class Module {
  final int? id;
  final String? description;
  final List<Content>? content;

  Module({this.id, this.description, this.content});

  Module.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'],
        content =
            List<Content>.from(json['content'].map((d) => Data.fromJson(d)));
}

class Content {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? video;
  final String? cover;
  final String? attachment;
  final String? createdAt;
  final String? updatedAt;

  Content(
      {this.id,
      this.title,
      this.subtitle,
      this.description,
      this.video,
      this.cover,
      this.attachment,
      this.createdAt,
      this.updatedAt});

  Content.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        subtitle = json['subtitle'],
        description = json['description'],
        video = json['video'],
        cover = json['cover'],
        attachment = json['attachment'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];
}
