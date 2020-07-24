import 'dart:convert';

import 'loggin_attrs_model.dart';

class ListItemModel extends LogginAttrsModel {
  int id;
  String description;
  bool checked;

  ListItemModel({
    this.id,
    this.description,
    this.checked,
  });

  ListItemModel copyWith({
    int id,
    String description,
    bool checked,
  }) {
    return ListItemModel(
      id: id ?? this.id,
      description: description ?? this.description,
      checked: checked ?? this.checked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'checked': checked,
    };
  }

  static ListItemModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ListItemModel(
      id: map['id'],
      description: map['description'],
      checked: map['checked'],
    );
  }

  String toJson() => json.encode(toMap());

  static ListItemModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'ListItemModel(id: $id, description: $description, checked: $checked)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListItemModel &&
        o.id == id &&
        o.description == description &&
        o.checked == checked;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ checked.hashCode;
}
