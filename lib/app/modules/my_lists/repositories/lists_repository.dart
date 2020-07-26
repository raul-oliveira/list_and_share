import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_repository_interface.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';

class ListsRepository implements IListsRepository {
  final Firestore fireStore;
  final AuthController authController;
  final String listCollection = 'lists';
  final String idControlCollection = 'idControl';

  ListsRepository(this.fireStore, this.authController);

  @override
  Stream<List<ListModel>> getAll() {
    return fireStore
        .collection(listCollection)
        .where('accessHeader', arrayContains: authController.user.email)
        .snapshots()
        .map((query) => query.documents.map((doc) {
              return ListModel.fromMap(doc.data);
            }).toList());
  }

  @override
  Future<ListModel> createList(ListModel value) async {
    value.id = await _getNextListId();

    if (value.access != null && value.access.isNotEmpty) {
      for (var i in value.access) {
        i.id = await _getNextAccessId();
        i.parentId = value.id;
      }
      value.accessHeader = _generateAccessHeaderFromUserAccess(value.access);
    }

    if (value.items != null && value.items.isNotEmpty) {
      for (var i in value.items) {
        i.id = await _getNextTodoId();
        i.parentId = value.id;
      }
    }

    await fireStore
        .collection(listCollection)
        .document(value.id.toString())
        .setData(value.toMap());
    return value;
  }

  @override
  Future<void> updateList(ListModel value) async {
    await fireStore
        .collection(listCollection)
        .document(value.id.toString())
        .setData(value.toMap(), merge: true);
  }

  @override
  Future<void> removeList(int listId) async {
    await fireStore
        .collection(listCollection)
        .document(listId.toString())
        .delete();
  }

  @override
  Future<ListItemModel> createTodoItem(ListItemModel value) async {
    value.id = await _getNextTodoId();

    var doc = fireStore
        .collection(listCollection)
        .document(value.parentId.toString());
    List<dynamic> items = (await doc.get()).data['items'];
    items.add(value.toMap());

    await doc.setData({
      'items': [...items]
    }, merge: true);
    return value;
  }

  @override
  Future<void> removeTodoItem(int listId, int id) async {
    var doc = fireStore.collection(listCollection).document(listId.toString());
    List<dynamic> items = (await doc.get()).data['items'];
    items.removeWhere((element) => element['id'] == id);

    await doc.setData({
      'items': [...items]
    }, merge: true);
  }

  @override
  Future<void> updateTodoItem(ListItemModel value) async {
    var doc = fireStore
        .collection(listCollection)
        .document(value.parentId.toString());

    List<dynamic> items = (await doc.get()).data['items'];
    var index = items.indexWhere((element) => element['id'] == value.id);
    items[index] = value.toMap();

    await doc.setData({
      'items': [...items]
    }, merge: true);
  }

  @override
  Future<UserAccess> createUserAccess(UserAccess value) async {
    value.id = await _getNextAccessId();
    var doc = fireStore
        .collection(listCollection)
        .document(value.parentId.toString());

    List<dynamic> items = (await doc.get()).data['access'];
    items.add(value.toMap());

    await doc.setData({
      'accessHeader': _generateAccessHeader(items),
      'access': [...items]
    }, merge: true);
    return value;
  }

  @override
  Future<UserAccess> removeUserAccess(UserAccess value) async {
    var doc = fireStore
        .collection(listCollection)
        .document(value.parentId.toString());

    List<dynamic> items = (await doc.get()).data['access'];
    items.removeWhere((element) => element['id'] == value.id);

    await doc.setData({
      'accessHeader': _generateAccessHeader(items),
      'access': [...items]
    }, merge: true);
    return value;
  }

  @override
  Future<void> updateUserAccess(UserAccess value) async {
    var doc = fireStore
        .collection(listCollection)
        .document(value.parentId.toString());

    List<dynamic> items = (await doc.get()).data['access'];
    var index = items.indexWhere((element) => element['id'] == value.id);
    items[index] = value.toMap();

    await doc.setData({
      'accessHeader': _generateAccessHeader(items),
      'access': [...items]
    }, merge: true);
  }

  List<String> _generateAccessHeader(List<dynamic> fireBaseResult) {
    var ret = List<String>();

    for (var i in fireBaseResult) {
      ret.add(i['user']['email']);
    }
    return ret;
  }

  List<String> _generateAccessHeaderFromUserAccess(List<UserAccess> access) {
    var ret = List<String>();

    for (var i in access) {
      ret.add(i.user.email);
    }

    return ret;
  }

  Future<int> _getNextId(String paramName) async {
    var ref = fireStore.collection(idControlCollection).document(paramName);
    await ref.setData({'id': FieldValue.increment(1)}, merge: true);
    return (await ref.get()).data['id'] as int;
  }

  Future<int> _getNextListId() async {
    return await _getNextId('lists');
  }

  Future<int> _getNextTodoId() async {
    return await _getNextId('todos');
  }

  Future<int> _getNextAccessId() async {
    return await _getNextId('access');
  }
}
