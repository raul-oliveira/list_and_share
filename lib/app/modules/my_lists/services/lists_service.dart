import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_service_interface.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_model.dart';
import 'package:uuid/uuid.dart';

class ListsService implements IListsService {
  ListsService() {
    for (var i = 0; i < 10; i++) {
      var todoitems = List<ListItemModel>();
      var access = List<UserAccess>();

      for (var j = 0; j < 6; j++) {
        todoitems.add(ListItemModel(
            description: 'Description $j', id: i + j, checked: false));
      }

      for (var j = 0; j < 2; j++) {
        access.add(
          UserAccess(
            accessLevel: AccessLevelEnum.admin,
            id: i + j,
            user: UserModel(
              email: 'mrraul65@gmail.com',
              firstName: 'Raul ${i + j}',
              id: i + j,
            ),
          ),
        );
      }
      _list.add(new ListModel(
          id: i,
          title: 'titulo $i',
          briefDescription: 'brief description $i',
          percentConcluded: i / 10 * 100,
          items: todoitems,
          access: access));
    }
  }

  List<ListModel> _list = new List<ListModel>();

  @override
  Future<ListModel> create(ListModel value) async {
    _list.add(value);
    return value;
  }

  @override
  Future<bool> delete(int id) async {
    var prevLength = _list.length;
    _list.removeWhere((element) => id == element.id);
    return prevLength > _list.length;
  }

  @override
  Future<List<ListModel>> getAll() {
    var future = new Future<List<ListModel>>(() {
      return _list;
    });
    return future;
  }

  @override
  Future<ListModel> getById(int id) async {
    var item =
        _list.firstWhere((element) => element.id == id, orElse: () => null);
    return item;
  }

  @override
  Future<bool> update(ListModel value) async {
    var index = _getListIndex(value.id);
    if (index == -1) return false;

    _list[index] = value;
    return true;
  }

  Future<bool> addTodoItem(int parentId, ListItemModel value) async {
    var index = _getListIndex(parentId);
    if (index == -1) return false;
    var sum = _list[index].items.fold<int>(0, (p, e) => p + e.id);
    value.id = sum + 1;
    _list[index].items.add(value);
    return true;
  }

  Future<bool> removeTodoItem(int parentId, int todoItemId) async {
    var index = _getListIndex(parentId);
    if (index == -1) return false;
    var prevLength = _list[index].items.length;
    _list[index].items.removeWhere((element) => todoItemId == element.id);
    return prevLength > _list[index].items.length;
  }

  Future<bool> updateTodoItem(int parentId, ListItemModel value) async {
    var index = _getListIndex(parentId);
    if (index == -1) return false;
    var lengthPrev = _list[index].items.length;
    _list[index].items.removeWhere((element) => element.id == value.id);
    return lengthPrev > _list[index].items.length;
  }

  int _getListIndex(int listId) {
    return _list.indexWhere((element) => element.id == listId);
  }

  Future<bool> updateAccessLevel(
    int listId,
    int accessId,
    AccessLevelEnum value,
  ) async {
    var index = _getListIndex(listId);
    if (index == -1) return false;

    var access =
        _list[index].access.firstWhere((element) => element.id == accessId);
    access.accessLevel = value;
    return true;
  }

  Future<bool> addUserAccess(int listId, String email) async {
    var index = _getListIndex(listId);
    if (index == -1) return false;

    _list[index].access.add(
          UserAccess(
            accessLevel: AccessLevelEnum.write,
            id: Uuid().v1().hashCode,
            user: UserModel(email: email),
          ),
        );
    return true;
  }

  Future<bool> removeUserAccess(int listId, int accessId) async {
    var index = _getListIndex(listId);
    if (index == -1) return false;

    var prevLength = _list[index].access.length;
    _list[index].access.removeWhere((element) => element.id == accessId);

    return prevLength > _list[index].access.length;
  }
}
