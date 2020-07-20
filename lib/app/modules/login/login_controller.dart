import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/core/store/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthStore auth = Modular.get<AuthStore>();

  @observable
  bool loading = false;

  @action
  Future loginWithGoogle() async {
    setLoading(true);

    try {
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      setLoading(false);
    }

  }

  @action setLoading(bool value) {
    loading = value;
  }
}
