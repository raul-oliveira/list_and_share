import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/store/my_lists_store.dart';
import 'package:mobx/mobx.dart';

import 'interfaces/lists_service_interface.dart';
import 'models/list_model.dart';

part 'my_lists_controller.g.dart';

class MyListsController = _MyListsControllerBase with _$MyListsController;

abstract class _MyListsControllerBase with Store {
  final newlistNameController = TextEditingController();
  final IListsService _listsService;
  final MyListsStore store;

  _MyListsControllerBase(this._listsService, this.store) {
    store.getAll();
  }

  @observable
  bool loading = false;

  @action
  Future addList() async {
    var listName = newlistNameController.value.text;
    await _listsService.createList(new ListModel(title: listName));
  }

  @action
  Future delete(int id) async {
    await _listsService.removeList(id);
  }
}
