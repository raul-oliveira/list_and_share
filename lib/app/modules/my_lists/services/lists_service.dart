import 'package:list_and_share/app/modules/my_lists/interfaces/lists_service_interface.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';

class ListsService implements IListsService {
  ListsService() {
    for (var i = 0; i < 10; i++) {
      var todoitems = List<ListItemModel>();
      for (var j = 0; j < 6; j++) {
        todoitems.add(ListItemModel(
            description: 'Description $j', id: i + j, checked: false));
      }

      _list.add(new ListModel(
          id: i,
          title: 'titulo $i',
          briefDescription: 'brief description $i',
          percentConcluded: i / 10 * 100,
          items: todoitems));
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
  Future<bool> update(ListModel value) {
    // TODO: implement update
    throw UnimplementedError();
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
}
