import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel(super.id, {required super.email, required super.name});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      user.uid,
      email: user.email ?? "",
      name: user.displayName ?? "",
    );
  }
}
