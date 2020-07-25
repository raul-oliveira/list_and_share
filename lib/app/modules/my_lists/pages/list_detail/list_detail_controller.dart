import 'package:flutter/material.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:list_and_share/app/core/utils.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:mobx/mobx.dart';

part 'list_detail_controller.g.dart';

class ListDetailController = _ListDetailControllerBase
    with _$ListDetailController;

abstract class _ListDetailControllerBase with Store {
  final ListsService service;
  final AuthController authController;
  final Utils utils;

  TextEditingController todoItemDescriptionController = TextEditingController();

  _ListDetailControllerBase(this.service, this.authController, this.utils);

  @observable
  ObservableFuture<ListModel> selectedList;

  @computed
  List<ListItemModel> get todoItems => selectedList.value.items;

  @action
  Future<bool> onBackPressed() {
    utils.backPage();
    return new Future<bool>(() => true);
  }

  @action
  Future getSelectedList(int listId) async {
    selectedList = service.getById(listId).asObservable();
  }

  @action
  checkTodoItem(int todoItemId) {
    var el = todoItems.firstWhere((element) => element.id == todoItemId);
    el.checked = !el.checked;
    getSelectedList(selectedList.value.id);
  }

  @action
  removeTodoItem(int id) async {
    await service.removeTodoItem(selectedList.value.id, id);
    await getSelectedList(selectedList.value.id);
  }

  @action
  Future addTodoitem(ListItemModel value) async {
    var userEmail = authController.user.email ?? '';
    value.creationDate = DateTime.now();
    value.createdBy = userEmail;
    value.lastChangeDate = DateTime.now();
    value.lastChangeBy = userEmail;
    value.checked = false;

    await service.addTodoItem(selectedList.value.id, value);
    await getSelectedList(selectedList.value.id);
    todoItemDescriptionController.clear();
  }
}
