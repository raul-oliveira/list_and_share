import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthController _auth = Modular.get<AuthController>();
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      if (_auth.status == AuthStatus.loggedIn) {
        Modular.to.pushReplacementNamed('/myLists');
      } else if (_auth.status == AuthStatus.loggedOut) {
        Modular.to.pushReplacementNamed('/login/welcome');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
