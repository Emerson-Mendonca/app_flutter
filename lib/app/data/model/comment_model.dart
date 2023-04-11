// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_flutter/app/data/model/post_model.dart';

class CommentModel {
  String body;
  String id;
  String postId;
  PostModel post;

  CommentModel({
    required this.body,
    required this.id,
    required this.postId,
    required this.post,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'id': id,
      'postId': postId,
      'post': post.toMap(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      body: map['body'] as String,
      id: map['id'] as String,
      postId: map['postId'] as String,
      post: PostModel.fromMap(map['post'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(body: $body, id: $id, postId: $postId, post: $post)';
  }
}
