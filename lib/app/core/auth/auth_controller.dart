import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/core/repositories/interfaces/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';

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
  Future logout() async {
    await _authRepository.logout();
  }
}

enum AuthStatus { loading, loggedIn, loggedOut }
