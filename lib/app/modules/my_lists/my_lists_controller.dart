import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:list_and_share/app/modules/my_lists/store/my_lists_store.dart';
import 'package:mobx/mobx.dart';

import 'models/list_model.dart';

part 'my_lists_controller.g.dart';

class MyListsController = _MyListsControllerBase with _$MyListsController;

abstract class _MyListsControllerBase with Store {
  final newlistNameController = TextEditingController();
  final ListsService _listsService;
  final MyListsStore store;

  _MyListsControllerBase(this._listsService, this.store) {
    store.getAll();
  }

  @observable
  bool loading = false;

  @action
  Future addList() async {
    var listName = newlistNameController.value.text;
    await _listsService.create(new ListModel(
        title: listName, percentConcluded: 0, briefDescription: 'Empty'));
  }

  @action
  Future delete(int id) async {
    loading = true;
    Future.delayed(Duration(seconds: 1)).then((value) async {
      _listsService.delete(id);
      loading = false;
    });
  }
}
