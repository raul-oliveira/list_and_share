import 'dart:convert';

class UserModel {
  String email;
  String firstName;
  int id;
  UserModel({
    this.email,
    this.firstName,
    this.id,
  });

  UserModel copyWith({
    String email,
    String firstName,
    int id,
  }) {
    return UserModel(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'id': id,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, firstName: $firstName, id: $id)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.email == email &&
      o.firstName == firstName &&
      o.id == id;
  }

  @override
  int get hashCode => email.hashCode ^ firstName.hashCode ^ id.hashCode;
}
