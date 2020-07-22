import 'dart:convert';

import 'package:list_and_share/app/modules/my_lists/enums/list_item_state_enum.dart';

import 'loggin_attrs_model.dart';

class ListItemModel extends LogginAttrsModel {
  int id;
  String description;
  ListItemStateEnum state;
  ListItemModel({
    this.id,
    this.description,
    this.state,
  });

  ListItemModel copyWith({
    int id,
    String description,
    ListItemStateEnum state,
  }) {
    return ListItemModel(
      id: id ?? this.id,
      description: description ?? this.description,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'state': state.hashCode,
    };
  }

  static ListItemModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ListItemModel(
      id: map['id'],
      description: map['description'],
      state: map['state'],
    );
  }

  String toJson() => json.encode(toMap());

  static ListItemModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ListItemModel(id: $id, description: $description, state: $state)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ListItemModel &&
      o.id == id &&
      o.description == description &&
      o.state == state;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ state.hashCode;
}
