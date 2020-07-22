import 'dart:convert';

import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';

import 'user_model.dart';

class UserAccess {
  UserModel user;
  AccessLevelEnum accessLevel;
  UserAccess({
    this.user,
    this.accessLevel,
  });

  UserAccess copyWith({
    UserModel user,
    AccessLevelEnum accessLevel,
  }) {
    return UserAccess(
      user: user ?? this.user,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'accessLevel': accessLevel.hashCode,
    };
  }

  static UserAccess fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserAccess(
      user: UserModel.fromMap(map['user']),
      accessLevel: map['accessLevel'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserAccess fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'UserAccess(user: $user, accessLevel: $accessLevel)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserAccess &&
      o.user == user &&
      o.accessLevel == accessLevel;
  }

  @override
  int get hashCode => user.hashCode ^ accessLevel.hashCode;
}
