import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_detail_controller.g.dart';

class ListDetailController = _ListDetailControllerBase
    with _$ListDetailController;

abstract class _ListDetailControllerBase with Store {
  @action
  Future<bool> onBackPressed() {
    backToMyLists();
    return new Future<bool>(() => true);
  }

  @action
  backToMyLists() {
    Modular.to.popAndPushNamed('/');
  }
}
