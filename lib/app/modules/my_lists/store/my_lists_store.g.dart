// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_lists_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyListsStore on _MyListsStoreBase, Store {
  Computed<ListModel> _$selectedListComputed;

  @override
  ListModel get selectedList =>
      (_$selectedListComputed ??= Computed<ListModel>(() => super.selectedList,
              name: '_MyListsStoreBase.selectedList'))
          .value;
  Computed<List<ListItemModel>> _$todoItemsComputed;

  @override
  List<ListItemModel> get todoItems => (_$todoItemsComputed ??=
          Computed<List<ListItemModel>>(() => super.todoItems,
              name: '_MyListsStoreBase.todoItems'))
      .value;
  Computed<List<UserAccess>> _$accessComputed;

  @override
  List<UserAccess> get access =>
      (_$accessComputed ??= Computed<List<UserAccess>>(() => super.access,
              name: '_MyListsStoreBase.access'))
          .value;
  Computed<String> _$selectedListTitleComputed;

  @override
  String get selectedListTitle => (_$selectedListTitleComputed ??=
          Computed<String>(() => super.selectedListTitle,
              name: '_MyListsStoreBase.selectedListTitle'))
      .value;

  final _$myListsAtom = Atom(name: '_MyListsStoreBase.myLists');

  @override
  ObservableStream<List<ListModel>> get myLists {
    _$myListsAtom.reportRead();
    return super.myLists;
  }

  @override
  set myLists(ObservableStream<List<ListModel>> value) {
    _$myListsAtom.reportWrite(value, super.myLists, () {
      super.myLists = value;
    });
  }

  final _$selectedListIdAtom = Atom(name: '_MyListsStoreBase.selectedListId');

  @override
  int get selectedListId {
    _$selectedListIdAtom.reportRead();
    return super.selectedListId;
  }

  @override
  set selectedListId(int value) {
    _$selectedListIdAtom.reportWrite(value, super.selectedListId, () {
      super.selectedListId = value;
    });
  }

  final _$getAllAsyncAction = AsyncAction('_MyListsStoreBase.getAll');

  @override
  Future<dynamic> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$setSelectedListAsyncAction =
      AsyncAction('_MyListsStoreBase.setSelectedList');

  @override
  Future<dynamic> setSelectedList(int listId) {
    return _$setSelectedListAsyncAction
        .run(() => super.setSelectedList(listId));
  }

  @override
  String toString() {
    return '''
myLists: ${myLists},
selectedListId: ${selectedListId},
selectedList: ${selectedList},
todoItems: ${todoItems},
access: ${access},
selectedListTitle: ${selectedListTitle}
    ''';
  }
}
