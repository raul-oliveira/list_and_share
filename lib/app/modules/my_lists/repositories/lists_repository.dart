import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_and_share/app/core/auth/auth_controller.dart';
import 'package:list_and_share/app/modules/my_lists/interfaces/lists_repository_interface.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';

class ListsRepository implements IListsRepository {
  final Firestore fireStore;
  final AuthController authController;
  final String listCollection = 'lists';

  ListsRepository(this.fireStore, this.authController);

  @override
  Stream<List<ListModel>> getAll() {
    return fireStore
        .collection(listCollection)
        // .where('access', arrayContains: authController.user.email)
        .snapshots()
        .map((query) => query.documents.map((doc) {
              return ListModel.fromMap(doc.data);
            }).toList());
  }

  @override
  Stream<ListModel> getById() {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
