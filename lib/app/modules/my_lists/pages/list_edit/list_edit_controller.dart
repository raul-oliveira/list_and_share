import 'package:flutter/material.dart';
import 'package:list_and_share/app/core/utils.dart';
import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:mobx/mobx.dart';

part 'list_edit_controller.g.dart';

class ListEditController = _ListEditControllerBase with _$ListEditController;

abstract class _ListEditControllerBase with Store {
  final ListsService listsService;
  final Utils utils;
  TextEditingController listNameController = new TextEditingController();
  TextEditingController newUserController = new TextEditingController();

  _ListEditControllerBase(this.listsService, this.utils);

  @observable
  ListModel selectedList;

  @observable
  bool isEditing = false;

  @action
  Future<bool> toggleEditing() async {
    isEditing = !isEditing;
    return isEditing;
  }

  @action
  setSelectedList(ListModel value) {
    selectedList = value;
    listNameController.text = selectedList.title;
  }

  @action
  Future setUserAcessLevel(int accessId, AccessLevelEnum value) async {
    await listsService.updateAccessLevel(selectedList.id, accessId, value);
  }

  @action
  Future addUser() async {
    var email = newUserController.text;
    await listsService.addUserAccess(selectedList.id, email);
    selectedList = await listsService.getById(selectedList.id);
  }

  @action
  Future removeUserAccess(int accessId) async {
    await listsService.removeUserAccess(selectedList.id, accessId);
    selectedList = await listsService.getById(selectedList.id);
  }

  @action
  Future updateListName() async {
    selectedList.title = listNameController.text;
    await listsService.update(selectedList);
    selectedList = await listsService.getById(selectedList.id);
  }
}
