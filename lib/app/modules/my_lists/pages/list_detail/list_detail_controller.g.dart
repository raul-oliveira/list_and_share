// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListDetailController on _ListDetailControllerBase, Store {
  Computed<List<ListItemModel>> _$todoItemsComputed;

  @override
  List<ListItemModel> get todoItems => (_$todoItemsComputed ??=
          Computed<List<ListItemModel>>(() => super.todoItems,
              name: '_ListDetailControllerBase.todoItems'))
      .value;

  final _$selectedListAtom =
      Atom(name: '_ListDetailControllerBase.selectedList');

  @override
  ObservableFuture<ListModel> get selectedList {
    _$selectedListAtom.reportRead();
    return super.selectedList;
  }

  @override
  set selectedList(ObservableFuture<ListModel> value) {
    _$selectedListAtom.reportWrite(value, super.selectedList, () {
      super.selectedList = value;
    });
  }

  final _$getSelectedListAsyncAction =
      AsyncAction('_ListDetailControllerBase.getSelectedList');

  @override
  Future<dynamic> getSelectedList(int listId) {
    return _$getSelectedListAsyncAction
        .run(() => super.getSelectedList(listId));
  }

  final _$addTodoitemAsyncAction =
      AsyncAction('_ListDetailControllerBase.addTodoitem');

  @override
  Future<dynamic> addTodoitem(ListItemModel value) {
    return _$addTodoitemAsyncAction.run(() => super.addTodoitem(value));
  }

  final _$_ListDetailControllerBaseActionController =
      ActionController(name: '_ListDetailControllerBase');

  @override
  Future<bool> onBackPressed() {
    final _$actionInfo = _$_ListDetailControllerBaseActionController
        .startAction(name: '_ListDetailControllerBase.onBackPressed');
    try {
      return super.onBackPressed();
    } finally {
      _$_ListDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backToMyLists() {
    final _$actionInfo = _$_ListDetailControllerBaseActionController
        .startAction(name: '_ListDetailControllerBase.backToMyLists');
    try {
      return super.backToMyLists();
    } finally {
      _$_ListDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkTodoItem(int todoItemId) {
    final _$actionInfo = _$_ListDetailControllerBaseActionController
        .startAction(name: '_ListDetailControllerBase.checkTodoItem');
    try {
      return super.checkTodoItem(todoItemId);
    } finally {
      _$_ListDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedList: ${selectedList},
todoItems: ${todoItems}
    ''';
  }
}
