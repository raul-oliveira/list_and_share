import 'package:list_and_share/app/modules/my_lists/interfaces/lists_service_interface.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';

class ListsService implements IListsService {
  ListsService() {
    for (var i = 0; i < 10; i++) {
      _list.add(
        new ListModel(
            id: i,
            title: 'titulo $i',
            briefDescription: 'brief description $i',
            percentConcluded: i / 10 * 100),
      );
    }
  }

  List<ListModel> _list = new List<ListModel>();

  @override
  Future<ListModel> create(ListModel value) {
    _list.add(value);
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ListModel>> getAll() {
    var future = new Future<List<ListModel>>(() {
      return _list;
    });
    return future;
  }

  @override
  Future<ListModel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<bool> update(ListModel value) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
