import 'package:flutter/material.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:list_and_share/app/core/utils.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:list_and_share/app/modules/my_lists/store/my_lists_store.dart';
import 'package:mobx/mobx.dart';

part 'list_detail_controller.g.dart';

class ListDetailController = _ListDetailControllerBase
    with _$ListDetailController;

abstract class _ListDetailControllerBase with Store {
  final MyListsStore store;
  final ListsService service;
  final AuthController authController;
  final Utils utils;

  TextEditingController todoItemDescriptionController = TextEditingController();
  FocusNode todoItemDescriptionFocus = FocusNode();

  _ListDetailControllerBase(
      this.service, this.authController, this.utils, this.store);

  @action
  Future<bool> onBackPressed() {
    utils.backPage();
    return new Future<bool>(() => true);
  }

  @action
  Future removeTodoItem(int id) async {
    await service.removeTodoItem(store.selectedList.id, id);
  }

  @action
  Future addTodoitem(ListItemModel value) async {
    value.parentId = store.selectedList.id;
    await service.createTodoitem(value);
    todoItemDescriptionController.clear();
  }
}
