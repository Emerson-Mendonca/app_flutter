class UserEntity {
  String createdAt;
  String name;
  String avatar;
  bool online;
  String id;

  UserEntity({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.online,
    required this.id,
  });

  static fromMap(Map<String, dynamic> e) {}
}
