import 'dart:convert';

import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';

import 'user_model.dart';

class UserAccess {
  int id;
  UserModel user;
  AccessLevelEnum accessLevel;

  UserAccess({
    this.id,
    this.user,
    this.accessLevel,
  });

  UserAccess copyWith({
    int id,
    UserModel user,
    AccessLevelEnum accessLevel,
  }) {
    return UserAccess(
      id: id ?? this.id,
      user: user ?? this.user,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user?.toMap(),
      'accessLevel': accessLevel?.hashCode
    };
  }

  static UserAccess fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserAccess(
      id: map['id'],
      user: UserModel.fromMap(map['user']),
      accessLevel: AccessLevelEnum.values[map['accessLevel']],
    );
  }

  String toJson() => json.encode(toMap());

  static UserAccess fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'UserAccess(id: $id, user: $user, accessLevel: $accessLevel)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserAccess &&
        o.id == id &&
        o.user == user &&
        o.accessLevel == accessLevel;
  }

  @override
  int get hashCode => id.hashCode ^ user.hashCode ^ accessLevel.hashCode;
}
