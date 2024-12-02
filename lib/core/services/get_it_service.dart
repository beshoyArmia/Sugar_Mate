import 'package:e_commerce/Features/auth/data/repos/auth_repos_empl.dart';
import 'package:e_commerce/Features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthReposEmpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
