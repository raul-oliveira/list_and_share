import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get<AuthController>();

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

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
  Future loginWithFacebook() async {
    setLoading(true);

    try {
      var user = await auth.loginWithFacebook();

      if (user != null)
        Modular.to.pushNamedAndRemoveUntil('/myLists', (route) => false);
    } catch (e) {
      setLoading(false);
    }
  }

  @action
  Future loginWithEmailAndPassword() async {
    var email = userEmailController.text.trim().toLowerCase();
    return auth.loginWithEmailAndPassword(
      email: email,
      password: userPasswordController.text,
    );
  }

  @action
  setLoading(bool value) {
    loading = value;
  }
}
