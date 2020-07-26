import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';

abstract class IListsRepository {
  Stream<List<ListModel>> getAll();

  Stream<ListModel> getById();
}
