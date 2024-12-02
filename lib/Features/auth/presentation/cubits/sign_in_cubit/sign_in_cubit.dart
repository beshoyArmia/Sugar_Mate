import 'package:bloc/bloc.dart';
import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/Features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (UserEntity) => emit(SignInSuccess(user: UserEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (UserEntity) => emit(SignInSuccess(user: UserEntity)),
    );
  }
}
