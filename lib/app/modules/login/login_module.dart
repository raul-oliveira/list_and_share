import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/login/pages/signup_page/signup_page.dart';

import 'pages/login_page/login_controller.dart';
import 'pages/login_page/login_page.dart';
import 'pages/signup_page/signup_controller.dart';
import 'pages/welcome_page/welcome_controller.dart';
import 'pages/welcome_page/welcome_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupController()),
        Bind((i) => WelcomeController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router('/welcome', child: (_, args) => WelcomePage()),
        Router('/login', child: (_, args) => LoginPage()),
        Router('/signup', child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
