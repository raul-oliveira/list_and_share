import 'package:flutter/material.dart';
import 'package:list_and_share/app/core/utils.dart';
import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:list_and_share/app/modules/my_lists/store/my_lists_store.dart';
import 'package:mobx/mobx.dart';

part 'list_edit_controller.g.dart';

class ListEditController = _ListEditControllerBase with _$ListEditController;

abstract class _ListEditControllerBase with Store {
  final MyListsStore store;
  final ListsService listsService;
  final Utils utils;

  TextEditingController listNameController = new TextEditingController();
  TextEditingController newUserController = new TextEditingController();

  _ListEditControllerBase(this.listsService, this.utils, this.store) {
    listNameController.text = store.selectedListTitle;
  }

  @observable
  bool isEditing = false;

  @action
  Future<bool> toggleEditing() async {
    isEditing = !isEditing;
    return isEditing;
  }

  @action
  Future setUserAcessLevel(int accessId, AccessLevelEnum value) async {
    await listsService.updateAccessLevel(
        store.selectedList.id, accessId, value);
  }

  @action
  Future addUser() async {
    var email = newUserController.text;
    await listsService.addUserAccess(store.selectedList.id, email);
  }

  @action
  Future removeUserAccess(int accessId) async {
    await listsService.removeUserAccess(store.selectedList.id, accessId);
  }

  @action
  Future updateListName() async {
    store.selectedList.title = listNameController.text;
    await listsService.update(store.selectedList);
  }
}
