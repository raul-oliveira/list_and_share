import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/core/repositories/interfaces/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final _authRepository = Modular.get<IAuthRepository>();

  _AuthStoreBase() {
    _authRepository.getUser().then(setUser);
  }

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) => user = value;

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