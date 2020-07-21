import 'package:list_and_share/app/core/repositories/auth_repository.dart';
import 'package:list_and_share/app/core/repositories/interfaces/auth_repository_interface.dart';
import 'package:list_and_share/app/modules/login/login_module.dart';
import 'package:list_and_share/app/splash/splash_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:list_and_share/app/app_widget.dart';

import 'core/auth/auth_controller.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
