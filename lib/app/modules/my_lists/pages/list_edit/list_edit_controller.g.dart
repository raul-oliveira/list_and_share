// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListEditController on _ListEditControllerBase, Store {
  final _$selectedListAtom = Atom(name: '_ListEditControllerBase.selectedList');

  @override
  ListModel get selectedList {
    _$selectedListAtom.reportRead();
    return super.selectedList;
  }

  @override
  set selectedList(ListModel value) {
    _$selectedListAtom.reportWrite(value, super.selectedList, () {
      super.selectedList = value;
    });
  }

  final _$isEditingAtom = Atom(name: '_ListEditControllerBase.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$toggleEditingAsyncAction =
      AsyncAction('_ListEditControllerBase.toggleEditing');

  @override
  Future<bool> toggleEditing() {
    return _$toggleEditingAsyncAction.run(() => super.toggleEditing());
  }

  final _$setUserAcessLevelAsyncAction =
      AsyncAction('_ListEditControllerBase.setUserAcessLevel');

  @override
  Future<dynamic> setUserAcessLevel(int accessId, AccessLevelEnum value) {
    return _$setUserAcessLevelAsyncAction
        .run(() => super.setUserAcessLevel(accessId, value));
  }

  final _$addUserAsyncAction = AsyncAction('_ListEditControllerBase.addUser');

  @override
  Future<dynamic> addUser() {
    return _$addUserAsyncAction.run(() => super.addUser());
  }

  final _$removeUserAccessAsyncAction =
      AsyncAction('_ListEditControllerBase.removeUserAccess');

  @override
  Future<dynamic> removeUserAccess(int accessId) {
    return _$removeUserAccessAsyncAction
        .run(() => super.removeUserAccess(accessId));
  }

  final _$updateListNameAsyncAction =
      AsyncAction('_ListEditControllerBase.updateListName');

  @override
  Future<dynamic> updateListName() {
    return _$updateListNameAsyncAction.run(() => super.updateListName());
  }

  final _$_ListEditControllerBaseActionController =
      ActionController(name: '_ListEditControllerBase');

  @override
  dynamic setSelectedList(ListModel value) {
    final _$actionInfo = _$_ListEditControllerBaseActionController.startAction(
        name: '_ListEditControllerBase.setSelectedList');
    try {
      return super.setSelectedList(value);
    } finally {
      _$_ListEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedList: ${selectedList},
isEditing: ${isEditing}
    ''';
  }
}
