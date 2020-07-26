import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';

abstract class IListsService {
  Stream<List<ListModel>> getAll();

  Future<ListModel> createList(ListModel value);

  Future<void> removeList(int id);

  Future<void> updateList(ListModel value);

  Future<ListItemModel> createTodoitem(ListItemModel value);

  Future<void> removeTodoItem(int parentId, int todoItemId);

  Future<void> updateTodoItem(ListItemModel value);

  Future<void> updateAccessLevel(UserAccess value);

  Future<UserAccess> addUserAccess(int listId, String email);

  Future<void> removeUserAccess(UserAccess access);
}
