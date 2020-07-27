import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get<AuthController>();

  @observable
  bool loading = false;

  @action
  Future loginWithGoogle() async {
    setLoading(true);

    try {
      await auth.loginWithGoogle();
      Modular.to.pushNamedAndRemoveUntil('/myLists', (route) => false);
    } catch (e) {
      setLoading(false);
    }
  }

  @action
  setLoading(bool value) {
    loading = value;
  }
}
