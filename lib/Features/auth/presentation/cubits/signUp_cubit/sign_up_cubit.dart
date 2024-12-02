import 'package:bloc/bloc.dart';
import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/Features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  /// Creates a new user with the provided [email], [password] and [name].
  ///
  /// Emits [SignUpLoading] while the creation is in progress, and either
  /// [SignUpfailure] or [SignUpSuccess] once the creation has completed.
  ///
  /// The [SignUpfailure] state will contain the error message from the
  /// authentication repository.
  ///
  /// The [SignUpSuccess] state will contain the newly created user.
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
