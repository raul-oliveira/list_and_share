import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';

abstract class IListsRepository {
  Stream<List<ListModel>> getAll();

  Future<ListModel> createList(ListModel value);

  Future<void> updateList(ListModel value);

  Future<void> removeList(int listId);

  Future<ListItemModel> createTodoItem(ListItemModel value);

  Future<void> updateTodoItem(ListItemModel value);

  Future<void> removeTodoItem(int listId, int id);

  Future<UserAccess> createUserAccess(UserAccess value);

  Future<void> removeUserAccess(UserAccess value);

  Future<void> updateUserAccess(UserAccess value);
}
