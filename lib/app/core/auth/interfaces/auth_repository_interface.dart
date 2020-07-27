import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();

  Future<FirebaseUser> getGoogleLogin();

  Future getFacebookLogin();

  Future logout();

  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password);

  Future<FirebaseUser> getEmailPasswordLogin(String email, String password);
}
