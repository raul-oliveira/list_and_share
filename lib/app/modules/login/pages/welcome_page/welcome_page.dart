import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/login/pages/welcome_page/components/label_widget.dart';
import 'package:list_and_share/app/modules/login/pages/welcome_page/components/signup_button_widget.dart';
import 'package:list_and_share/app/modules/login/components/title_widget.dart';
import 'components/welcome_page_submit_button_widget.dart';
import 'welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  const WelcomePage({Key key, this.title = "WelcomePage"}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends ModularState<WelcomePage, WelcomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleWidget(useSecondColor: false),
              SizedBox(
                height: 80,
              ),
              WelcomePageSubmitButtonWidget(),
              SizedBox(
                height: 20,
              ),
              SignupButtonWidget(),
              SizedBox(
                height: 20,
              ),
              // LabelWidget()
            ],
          ),
        ),
      ),
    );
  }
}
