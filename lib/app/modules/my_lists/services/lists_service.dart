import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_repository_interface.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_service_interface.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_model.dart';

class ListsService implements IListsService {
  final IListsRepository listsRepository;
  final AuthController authController;

  ListsService(this.listsRepository, this.authController);

  @override
  Future<ListModel> createList(ListModel value) async {
    value.access.add(UserAccess(
        accessLevel: AccessLevelEnum.admin,
        user: UserModel(email: authController.user.email)));
    value.creationDate = Timestamp.now();
    value.createdBy = authController.user.email;
    value.lastChangeBy = authController.user.email;
    value.lastChangeDate = Timestamp.now();
    return await listsRepository.createList(value);
  }

  @override
  Future<void> removeList(int id) async {
    return await listsRepository.removeList(id);
  }

  @override
  Stream<List<ListModel>> getAll() {
    return listsRepository.getAll();
  }

  @override
  Future<void> updateList(ListModel value) async {
    await listsRepository.updateList(value);
  }

  @override
  Future<ListItemModel> createTodoitem(ListItemModel value) async {
    var userEmail = authController.user.email ?? '';
    value.creationDate = Timestamp.now();
    value.createdBy = userEmail;
    value.lastChangeDate = Timestamp.now();
    value.lastChangeBy = userEmail;
    value.checked = false;

    return await listsRepository.createTodoItem(value);
  }

  @override
  Future<void> removeTodoItem(int parentId, int todoItemId) async {
    await listsRepository.removeTodoItem(parentId, todoItemId);
  }

  @override
  Future<void> updateTodoItem(ListItemModel value) async {
    value.lastChangeBy = authController.user.email;
    value.lastChangeDate = Timestamp.now();
    await listsRepository.updateTodoItem(value);
  }

  @override
  Future<void> updateAccessLevel(UserAccess value) async {
    await listsRepository.updateUserAccess(value);
  }

  @override
  Future<UserAccess> addUserAccess(int listId, String email) async {
    return await listsRepository.createUserAccess(UserAccess(
      accessLevel: AccessLevelEnum.write,
      parentId: listId,
      user: UserModel(email: email),
    ));
  }

  @override
  Future<void> removeUserAccess(UserAccess access) async {
    await listsRepository.removeUserAccess(access);
  }
}
