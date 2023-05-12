// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String createdAt;
  String name;
  String avatar;
  bool online;
  String id;
  UserModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.online,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
      'online': online,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      createdAt: map['createdAt'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      online: map['online'] as bool,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(createdAt: $createdAt, name: $name, avatar: $avatar, online: $online, id: $id)';
  }
}
