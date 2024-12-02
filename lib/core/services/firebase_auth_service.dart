import 'package:e_commerce/core/Errors/exception/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(message: 'لم يتم التسجيل بنجاح حاول مرة اخرى');
      }
    } catch (e) {
      throw CustomException(message: 'لم يتم التسجيل بنجاح حاول مرة اخرى');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'البريد الالكتروني غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'الرقم السري غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(
            message: 'لم يتم تسجيل الدخول بنجاح حاول مرة اخرى');
      }
    } catch (e) {
      throw CustomException(message: 'لم يتم تسجيل الدخول بنجاح حاول مرة اخرى');
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
