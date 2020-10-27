import 'package:flutter/material.dart';
import 'package:list_and_share/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:io';
import 'dart:async';

import 'app/core/utils.dart';

void main() => runApp(ModularApp(module: AppModule()));

Socket socket;

void initializeSocket() {
  Socket.connect(env.serverIp, env.servPort).then((Socket sock) {
    socket = sock;
    socket.listen(dataHandler,
        onError: errorHandler, onDone: doneHandler, cancelOnError: false);
  }).catchError((AsyncError e) {
    print("Unable to connect: $e");
  });
  //Connect standard in to the socket
  stdin.listen(
      (data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
}

void dataHandler(data) {
  print(new String.fromCharCodes(data).trim());
}

void errorHandler(error, StackTrace trace) {
  print(error);
}

void doneHandler() {
  socket.destroy();
}
