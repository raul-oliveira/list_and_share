import 'package:list_and_share/app/modules/my_lists/pages/list_detail/list_detail_page.dart';

import 'pages/list_detail/list_detail_controller.dart';
import 'my_lists_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'my_lists_page.dart';

class MyListsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListDetailController()),
        Bind((i) => MyListsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MyListsPage()),
        Router('/detail', child: (_, args) => ListDetailPage()),
      ];

  static Inject get to => Inject<MyListsModule>.of();
}
