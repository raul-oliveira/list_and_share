import 'package:list_and_share/app/modules/login/login_module.dart';
import 'package:list_and_share/app/splash/splash_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:list_and_share/app/app_widget.dart';

import 'core/auth/auth_controller.dart';
import 'core/auth/interfaces/auth_repository_interface.dart';
import 'core/auth/repositories/auth_repository.dart';
import 'modules/my_lists/my_lists_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/myLists', module: MyListsModule()),
        Router('/login',
            module: LoginModule(), transition: TransitionType.noTransition),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
