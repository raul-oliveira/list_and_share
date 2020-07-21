import 'my_lists_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'my_lists_page.dart';

class MyListsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MyListsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MyListsPage()),
      ];

  static Inject get to => Inject<MyListsModule>.of();
}
