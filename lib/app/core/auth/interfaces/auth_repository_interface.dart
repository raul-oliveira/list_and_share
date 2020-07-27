import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();

  Future<FirebaseUser> getGoogleLogin();

  Future getFacebookLogin();

  Future<String> getToken();

  Future logout();

  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password);
}
