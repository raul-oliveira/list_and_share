import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';
import 'package:list_and_share/app/modules/my_lists/services/lists_service.dart';
import 'package:mobx/mobx.dart';
part 'my_lists_store.g.dart';

class MyListsStore = _MyListsStoreBase with _$MyListsStore;

abstract class _MyListsStoreBase with Store {
  final ListsService _listsService;

  _MyListsStoreBase(this._listsService);

  @observable
  ObservableStream<List<ListModel>> myLists;

  @observable
  int selectedListId;

  @computed
  ListModel get selectedList =>
      myLists.value.firstWhere((element) => element.id == selectedListId);

  @computed
  List<ListItemModel> get todoItems => selectedList.items;

  @computed
  List<UserAccess> get access => selectedList.access;

  @computed
  String get selectedListTitle => selectedList.title;

  @action
  Future getAll() async {
    myLists = _listsService.getAll().asObservable();
  }

  @action
  Future setSelectedList(int listId) async {
    selectedListId = listId;
  }
}
