// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_flutter/app/data/model/user_model.dart';

class PostModel {
  String createdAt;
  String title;
  String body;
  String image;
  bool imagePost;
  String username;
  String id;
  String userId;
  UserModel? users;

  PostModel({
    required this.createdAt,
    required this.title,
    required this.body,
    required this.image,
    required this.imagePost,
    required this.username,
    required this.id,
    required this.userId,
    this.users,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'title': title,
      'body': body,
      'image': image,
      'imagePost': imagePost,
      'username': username,
      'id': id,
      'userId': userId,
      'users': users?.toMap(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      createdAt: map['createdAt'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      image: map['image'] as String,
      imagePost: map['imagePost'] as bool,
      username: map['username'] as String,
      id: map['id'] as String,
      userId: map['userId'] as String,
      users: map['users'] != null
          ? UserModel.fromMap(map['users'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(createdAt: $createdAt, title: $title, body: $body, image: $image, imagePost: $imagePost, username: $username, id: $id, userId: $userId, users: $users)';
  }
}
