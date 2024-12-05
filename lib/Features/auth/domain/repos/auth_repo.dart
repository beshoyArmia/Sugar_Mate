import 'package:dartz/dartz.dart';
import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/core/Errors/failure.dart';

abstract class AuthRepo {
  Future<Either<failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<failure, UserEntity>> signInWithGoogle();

  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String id});
}
