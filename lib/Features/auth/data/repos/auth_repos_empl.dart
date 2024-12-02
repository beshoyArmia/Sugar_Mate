import 'package:dartz/dartz.dart';
import 'package:e_commerce/Features/auth/data/models/user_model.dart';
import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/Features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/core/Errors/exception/custom_exception.dart';
import 'package:e_commerce/core/Errors/failure.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';

class AuthReposEmpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthReposEmpl({required this.firebaseAuthService});

  @override
  Future<Either<failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure("حدث خطأ ما حاول مرة اخرى"));
    }
  }

  @override
  Future<Either<failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure("حدث خطأ ما حاول مرة اخرى"));
    }
  }

  @override
  Future<Either<failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure("حدث خطأ ما حاول مرة اخرى"));
    }
  }
}
