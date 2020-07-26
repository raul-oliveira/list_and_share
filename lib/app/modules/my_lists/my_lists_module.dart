import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:list_and_share/app/core/utils.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_repository_interface.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_service_interface.dart';
import 'package:list_and_share/app/modules/my_lists/pages/list_detail/list_detail_page.dart';
import 'package:list_and_share/app/modules/my_lists/pages/list_edit/list_edit_controller.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:list_and_share/app/modules/my_lists/store/my_lists_store.dart';

import 'pages/list_detail/list_detail_controller.dart';
import 'my_lists_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'my_lists_page.dart';
import 'pages/list_edit/list_edit_page.dart';
import 'repositories/lists_repository.dart';

class MyListsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Utils()),
        Bind((i) => AuthController()),
        Bind<Firestore>((i) => Firestore.instance),
        Bind<IListsService>((i) => ListsService(i.get(), i.get())),
        Bind<IListsRepository>((i) => ListsRepository(i.get(), i.get())),
        Bind((i) => ListDetailController(i.get(), i.get(), i.get(), i.get())),
        Bind((i) => MyListsController(i.get(), i.get())),
        Bind((i) => ListEditController(i.get(), i.get(), i.get())),
        Bind((i) => MyListsStore(i.get()))
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MyListsPage()),
        Router(
          '/detail/:listId',
          child: (_, args) => ListDetailPage(
            listId: args.params['listId'],
          ),
        ),
        Router(
          '/edit',
          child: (_, args) => ListEditPage(),
        )
      ];

  static Inject get to => Inject<MyListsModule>.of();
}
