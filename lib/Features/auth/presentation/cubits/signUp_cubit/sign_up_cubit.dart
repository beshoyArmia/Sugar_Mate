import 'package:bloc/bloc.dart';
import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/Features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignUpLoading());
    var result = await authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);
    result.fold(
      (failure) => emit(SignUpfailure(message: failure.message)),
      (UserEntity) => emit(SignUpSuccess(user: UserEntity)),
    );
  }
}
