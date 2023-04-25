import 'dart:convert';

import 'package:app_flutter/app/data/model/user_model.dart';

class CommentModel {
  String body;
  String id;
  String postId;
  UserModel user;

  CommentModel({
    required this.body,
    required this.id,
    required this.postId,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'id': id,
      'postId': postId,
      'post': user.toMap(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      body: map['body'] as String,
      id: map['id'] as String,
      postId: map['postId'] as String,
      user: UserModel.fromMap(map['users'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(body: $body, id: $id, postId: $postId, post: $user)';
  }
}
