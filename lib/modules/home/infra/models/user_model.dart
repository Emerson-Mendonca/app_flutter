import 'dart:convert';

import 'package:app_flutter/modules/home/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String createdAt,
    required String name,
    required String avatar,
    required bool online,
    required String id,
  }) : super(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
            online: online,
            id: id);


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'createdAt': createdAt});
    result.addAll({'name': name});
    result.addAll({'avatar': avatar});
    result.addAll({'online': online});
    result.addAll({'id': id});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      createdAt: map['createdAt'] ?? '',
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      online: map['online'] ?? false,
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
