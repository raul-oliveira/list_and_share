import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignueControllerBase with _$SignupController;

abstract class _SignueControllerBase with Store {
  final AuthController authController;
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  BuildContext context;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  _SignueControllerBase(this.authController);

  Future<dynamic> signUp() async {
    if (formKey.currentState.validate()) {
      var email = userEmailController.text.trim().toLowerCase();

      return authController.createUserWithEmailAndPassword(
          email, userPasswordController.text);
    }
  }
}
