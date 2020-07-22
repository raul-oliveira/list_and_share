import 'dart:io';

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
  ObservableFuture<bool> loading;

  @observable
  ObservableFuture<List<ListModel>> myLists;

  @action
  Future setLoading(bool value) async {
    var future = Future<bool>(() => value);
    loading = future.asObservable();
  }

  @action
  Future getAll() async {
    myLists = _listsService.getAll().asObservable();
  }

  @action
  Future addList(String listName) async {
    await _listsService.create(new ListModel(
        title: listName, percentConcluded: 0, briefDescription: 'Empty'));
    await getAll();
  }

  @action
  Future delete(int id) async {
    sleep(Duration(seconds: 3));
    await _listsService.delete(id);
    await getAll();
  }
}
