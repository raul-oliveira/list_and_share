// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_lists_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyListsController on _MyListsControllerBase, Store {
  final _$loadingAtom = Atom(name: '_MyListsControllerBase.loading');

  @override
  ObservableFuture<bool> get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(ObservableFuture<bool> value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$myListsAtom = Atom(name: '_MyListsControllerBase.myLists');

  @override
  ObservableFuture<List<ListModel>> get myLists {
    _$myListsAtom.reportRead();
    return super.myLists;
  }

  @override
  set myLists(ObservableFuture<List<ListModel>> value) {
    _$myListsAtom.reportWrite(value, super.myLists, () {
      super.myLists = value;
    });
  }

  final _$setLoadingAsyncAction =
      AsyncAction('_MyListsControllerBase.setLoading');

  @override
  Future<dynamic> setLoading(bool value) {
    return _$setLoadingAsyncAction.run(() => super.setLoading(value));
  }

  final _$getAllAsyncAction = AsyncAction('_MyListsControllerBase.getAll');

  @override
  Future<dynamic> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$addListAsyncAction = AsyncAction('_MyListsControllerBase.addList');

  @override
  Future<dynamic> addList(String listName) {
    return _$addListAsyncAction.run(() => super.addList(listName));
  }

  final _$deleteAsyncAction = AsyncAction('_MyListsControllerBase.delete');

  @override
  Future<dynamic> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
myLists: ${myLists}
    ''';
  }
}
