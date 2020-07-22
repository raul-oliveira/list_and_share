class ListModel extends LogginAttrs {
  int id;
  String title;

  List<ListItemModel> items;

  List<UserAccess> access;
}

class ListItemModel extends LogginAttrs {
  int id;
  String description;
  ListItemConcludedEnum state;
}

abstract class LogginAttrs {
  DateTime creationDate;
  String createdBy;
  DateTime lastChangeDate;
  String lastChangeBy;
}

class UserModel {
  String email;
  String firstName;
  int id;
}

class UserAccess {
  UserModel user;
  AccessLevelEnum accessLevel;
}

enum AccessLevelEnum { admin, read, write }

enum ListItemConcludedEnum { toDo, done }
