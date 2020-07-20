import 'package:list_and_share/app/core/repositories/auth_repository.dart';
import 'package:list_and_share/app/core/repositories/interfaces/auth_repository_interface.dart';
import 'package:list_and_share/app/core/store/auth_store.dart';
import 'package:list_and_share/app/modules/login/login_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:list_and_share/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthStore()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        // Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
