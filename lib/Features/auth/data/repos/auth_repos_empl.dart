import 'package:dartz/dartz.dart';
import 'package:e_commerce/Features/auth/data/models/user_model.dart';
import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/Features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/core/Errors/exception/custom_exception.dart';
import 'package:e_commerce/core/Errors/failure.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/firestore_service.dart';
import 'package:e_commerce/core/utils/data_end_points.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthReposEmpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthReposEmpl(
      {required this.firebaseAuthService, required this.databaseService});

  @override
  Future<Either<failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntitu = UserEntity(user.uid, email: email, name: name);
      await addUserData(user: userEntitu);
      return right(userEntitu);
    } on CustomException catch (e) {
      await DeleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await DeleteUser(user);
      return left(ServerFailure("حدث خطأ ما حاول مرة اخرى"));
    }
  }

  Future<void> DeleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
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
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      addUserData(user: UserModel.fromFirebaseUser(user));
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      await DeleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await DeleteUser(user);
      return left(ServerFailure("حدث خطأ ما حاول مرة اخرى"));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: dataEndPoints.addUserData, data: user.tomap());
  }
}
