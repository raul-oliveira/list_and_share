import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/login/components/back_button_widget.dart';
import 'package:list_and_share/app/modules/login/components/bezier_container_widget.dart';
import 'package:list_and_share/app/modules/login/components/email_password_widget.dart';
import 'package:list_and_share/app/modules/login/components/submit_button_widget.dart';
import 'package:list_and_share/app/modules/login/pages/login_page/components/create_account_label_widget.dart';
import 'package:list_and_share/app/modules/login/pages/login_page/components/divider_widget.dart';
import 'package:list_and_share/app/modules/login/pages/login_page/components/google_button_widget.dart';
import 'package:list_and_share/app/modules/login/components/title_widget.dart';
import 'components/facebook_button_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainerWidget()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    TitleWidget(),
                    SizedBox(height: 50),
                    EmailPasswordWidget(
                      formKey: formKey,
                      userEmailController: controller.userEmailController,
                      userPasswordController: controller.userPasswordController,
                    ),
                    SizedBox(height: 20),
                    SubmitButtonWidget(
                      title: 'Login',
                      onSubmit: () {
                        _submit(context);
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    DividerWidget(),
                    GoogleButtonWidget(
                      onTap: controller.loginWithGoogle,
                    ),
                    FacebookButtonWidget(
                      onTap: controller.loginWithFacebook,
                    ),
                    SizedBox(height: height * .055),
                    CreateAccountLabelWidget(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: BackButtonWidget()),
          ],
        ),
      ),
    );
  }

  _submit(BuildContext context) {
    if (formKey.currentState.validate()) {
      controller.loginWithEmailAndPassword().then((value) {
        Modular.to.pushNamedAndRemoveUntil('myLists', (route) => false);
      }).catchError((e) {
        _showErrorDialog(context, e.message);
      });
    }
  }

  _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Error!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Modular.to.pop(),
          )
        ],
      ),
    );
  }
}
