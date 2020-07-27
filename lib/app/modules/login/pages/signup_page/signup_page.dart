import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/login/components/bezier_container_widget.dart';
import 'package:list_and_share/app/modules/login/components/submit_button_widget.dart';
import 'package:list_and_share/app/modules/login/components/title_widget.dart';
import '../../components/back_button_widget.dart';
import '../../components/email_password_widget.dart';
import 'components/login_account_label_widget.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "SignupPage"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainerWidget(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    TitleWidget(),
                    SizedBox(
                      height: 50,
                    ),
                    EmailPasswordWidget(
                      formKey: controller.formKey,
                      userEmailController: controller.userEmailController,
                      userNameController: controller.userNameController,
                      userPasswordController: controller.userPasswordController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SubmitButtonWidget(
                      title: 'Signup',
                      onSubmit: () {
                        _submit(context);
                      },
                    ),
                    SizedBox(height: height * .14),
                    LoginAccountLabelWidget(
                      isSignup: true,
                    ),
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

  _submit(BuildContext context) async {
    controller.signUp().then((value) {
      Modular.to.pushNamedAndRemoveUntil('myLists', (route) => false);
    }).catchError((e) {
      _showErrorDialog(context, e.message);
    });
  }
}
