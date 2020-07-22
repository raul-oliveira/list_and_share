import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';

abstract class IListsService {
  Future<List<ListModel>> getAll();
  
  Future<ListModel> getById(int id);
  
  Future<ListModel> create(ListModel value);

  Future<bool> update(ListModel value);
  
  Future<bool> delete(int id);
}