import 'package:flutter/material.dart';

import 'entry_field_widget.dart';

class EmailPasswordWidget extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;

  final GlobalKey<FormState> formKey;

  const EmailPasswordWidget(
      {Key key,
      this.userNameController,
      this.userEmailController,
      this.userPasswordController,
      this.formKey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          this.userNameController != null
              ? EntryFieldWidget(
                  title: "Username",
                  textEditingController: userNameController,
                  validator: _userNameValidation,
                )
              : Container(),
          this.userEmailController != null
              ? EntryFieldWidget(
                  title: "Email",
                  textEditingController: userEmailController,
                  validator: _userEmailValidation,
                )
              : Container(),
          this.userPasswordController != null
              ? EntryFieldWidget(
                  title: "Password",
                  isPassword: true,
                  textEditingController: userPasswordController,
                  validator: _userPasswordValidation,
                )
              : Container(),
        ],
      ),
    );
  }

  _userNameValidation(String value) {
    return value.isEmpty ? '*Enter a valid username' : null;
  }

  _userPasswordValidation(String value) {
    return value.length < 6
        ? '*Passwords must have at least six chracters'
        : null;
  }

  _userEmailValidation(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return emailValid ? null : 'Enter a valid email';
  }
}
