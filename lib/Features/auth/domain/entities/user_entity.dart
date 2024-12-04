class UserEntity {
  final String email;
  final String name;
  final String id;
  UserEntity(this.id, {required this.email, required this.name});

  tomap() => {'email': email, 'name': name, 'id': id};
}
