import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:mobx/mobx.dart';

import 'models/list_model.dart';

part 'my_lists_controller.g.dart';

class MyListsController = _MyListsControllerBase with _$MyListsController;

abstract class _MyListsControllerBase with Store {
  
  _MyListsControllerBase(this._listsService) {
    getAll();
  }
  
  final ListsService _listsService;

  @observable
  ObservableFuture<List<ListModel>> myLists;

  @action
  Future getAll() async {
    myLists = _listsService.getAll().asObservable();
  }

  @action
  Future addList(String listName) async {
    _listsService.create(new ListModel(
      title: listName,
      percentConcluded: 0,
      briefDescription: 'Empty'
    ));
    await getAll();
  }
}
