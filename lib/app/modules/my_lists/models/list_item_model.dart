import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ListItemModel {
  int id;
  String description;
  bool checked;
  Timestamp creationDate;
  String createdBy;
  Timestamp lastChangeDate;
  String lastChangeBy;

  ListItemModel({
    this.id,
    this.description,
    this.checked,
    this.creationDate,
    this.createdBy,
    this.lastChangeDate,
    this.lastChangeBy,
  });

  ListItemModel copyWith({
    int id,
    String description,
    bool checked,
    Timestamp creationDate,
    String createdBy,
    Timestamp lastChangeDate,
    String lastChangeBy,
  }) {
    return ListItemModel(
      id: id ?? this.id,
      description: description ?? this.description,
      checked: checked ?? this.checked,
      creationDate: creationDate ?? this.creationDate,
      createdBy: createdBy ?? this.createdBy,
      lastChangeDate: lastChangeDate ?? this.lastChangeDate,
      lastChangeBy: lastChangeBy ?? this.lastChangeBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'checked': checked,
      'creationDate': creationDate,
      'createdBy': createdBy,
      'lastChangeDate': lastChangeDate,
      'lastChangeBy': lastChangeBy,
    };
  }

  static ListItemModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ListItemModel(
      id: map['id'],
      description: map['description'],
      checked: map['checked'],
      creationDate: map['creationDate'],
      createdBy: map['createdBy'],
      lastChangeDate: map['lastChangeDate'],
      lastChangeBy: map['lastChangeBy'],
    );
  }

  String toJson() => json.encode(toMap());

  static ListItemModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListItemModel(id: $id, description: $description, checked: $checked, creationDate: $creationDate, createdBy: $createdBy, lastChangeDate: $lastChangeDate, lastChangeBy: $lastChangeBy)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListItemModel &&
        o.id == id &&
        o.description == description &&
        o.checked == checked &&
        o.creationDate == creationDate &&
        o.createdBy == createdBy &&
        o.lastChangeDate == lastChangeDate &&
        o.lastChangeBy == lastChangeBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        checked.hashCode ^
        creationDate.hashCode ^
        createdBy.hashCode ^
        lastChangeDate.hashCode ^
        lastChangeBy.hashCode;
  }
}
