import 'package:flutter_modular/flutter_modular.dart';

class Utils {
  void backPage() {
    Modular.to.pop();
  }
}

class Env {
  final String serverIp = "";
  final String servPort = "";
}

var env = Env();
