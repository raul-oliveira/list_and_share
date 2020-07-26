// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListDetailController on _ListDetailControllerBase, Store {
  final _$removeTodoItemAsyncAction =
      AsyncAction('_ListDetailControllerBase.removeTodoItem');

  @override
  Future<dynamic> removeTodoItem(int id) {
    return _$removeTodoItemAsyncAction.run(() => super.removeTodoItem(id));
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
  String toString() {
    return '''

    ''';
  }
}
