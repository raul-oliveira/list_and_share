import 'dart:async';

import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_service_interface.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';
import 'package:mobx/mobx.dart';
part 'my_lists_store.g.dart';

class MyListsStore = _MyListsStoreBase with _$MyListsStore;

abstract class _MyListsStoreBase with Store {
  final IListsService _listsService;
  final AuthController _authController;

  _MyListsStoreBase(this._listsService, this._authController);

  @observable
  ObservableStream<List<ListModel>> myLists;

  @observable
  int selectedListId;

  @observable
  int contador = 0;

  @computed
  ListModel get selectedList =>
      myLists.value.firstWhere((element) => element.id == selectedListId);

  @computed
  List<ListItemModel> get todoItems => selectedList.items;

  @computed
  List<UserAccess> get access => selectedList.access;

  @computed
  String get selectedListTitle => selectedList.title;

  @computed
  bool get canEdit {
    return access.any((element) =>
        element.accessLevel != AccessLevelEnum.read &&
        element.user.email == _authController.user.email);
  }

  @computed
  bool get isAdmin {
    return access.any((element) =>
        element.accessLevel == AccessLevelEnum.admin &&
        element.user.email == _authController.user.email);
  }

  @action
  Future getAll() async {
    myLists = _listsService.getAll().asObservable();
  }

  @action
  Future setSelectedList(int listId) async {
    selectedListId = listId;
  }

  @action
  Future toggleCheckTodoItem(ListItemModel todoItem) async {
    if (!canEdit) return;

    todoItem.checked = !todoItem.checked;
    await _listsService.updateTodoItem(todoItem);
    await incrementCount();
  }

  @action
  Future incrementCount() async {
    contador++;
  }

  @action
  Future removeTodoItem(int id) async {
    await _listsService.removeTodoItem(selectedList.id, id);
  }

  bool createdByUser(String email) {
    return email == _authController.user.email;
  }
}
