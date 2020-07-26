import 'package:mobx/mobx.dart';
part 'local_storage_controller.g.dart';

class LocalStorageController = _LocalStorageControllerBase
    with _$LocalStorageController;

abstract class _LocalStorageControllerBase with Store {}
