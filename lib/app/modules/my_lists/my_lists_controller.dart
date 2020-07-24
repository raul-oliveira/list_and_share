import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:mobx/mobx.dart';

import 'models/list_model.dart';

part 'my_lists_controller.g.dart';

class MyListsController = _MyListsControllerBase with _$MyListsController;

abstract class _MyListsControllerBase with Store {
  _MyListsControllerBase(this._listsService) {
    getAll();
  }

  final newlistNameController = TextEditingController();

  final ListsService _listsService;

  @observable
  bool loading = false;

  @observable
  ObservableFuture<List<ListModel>> myLists;

  @action
  Future getAll() async {
    myLists = _listsService.getAll().asObservable();
  }

  @action
  Future addList() async {
    var listName = newlistNameController.value.text;
    await _listsService.create(new ListModel(
        title: listName, percentConcluded: 0, briefDescription: 'Empty'));
    await getAll();
  }

  @action
  Future delete(int id) async {
    loading = true;
    Future.delayed(Duration(seconds: 1)).then((value) async {
      _listsService.delete(id);
      await getAll();
      loading = false;
    });
  }
}
