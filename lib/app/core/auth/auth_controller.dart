import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'interfaces/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final _authRepository = Modular.get<IAuthRepository>();

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.loggedOut : AuthStatus.loggedIn;
  }

  @action
  Future<FirebaseUser> loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
    return user;
  }

  @action
  Future<FirebaseUser> loginWithFacebook() async {
    user = await _authRepository.getFacebookLogin();
    return user;
  }

  @action
  Future<FirebaseUser> loginWithEmailAndPassword(
      {String email, String password}) async {
    user = await _authRepository.getEmailPasswordLogin(email, password);
    return user;
  }

  @action
  Future logout() async {
    await _authRepository.logout();
  }

  @action
  Future createUserWithEmailAndPassword(String email, String password) async {
    user =
        await _authRepository.createUserWithEmailAndPassword(email, password);
  }
}

enum AuthStatus { loading, loggedIn, loggedOut }
