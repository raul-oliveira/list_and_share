import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';
import 'list_item_model.dart';

class ListModel {
  int id;
  String title;
  double percentConcluded;
  String briefDescription;
  List<ListItemModel> items;
  List<UserAccess> access;
  Timestamp creationDate;
  String createdBy;
  Timestamp lastChangeDate;
  String lastChangeBy;

  ListModel({
    this.id,
    this.title,
    this.percentConcluded,
    this.briefDescription,
    this.items,
    this.access,
    this.creationDate,
    this.createdBy,
    this.lastChangeDate,
    this.lastChangeBy,
  });

  ListModel copyWith({
    int id,
    String title,
    double percentConcluded,
    String briefDescription,
    List<ListItemModel> items,
    List<UserAccess> access,
    Timestamp creationDate,
    String createdBy,
    Timestamp lastChangeDate,
    String lastChangeBy,
  }) {
    return ListModel(
      id: id ?? this.id,
      title: title ?? this.title,
      percentConcluded: percentConcluded ?? this.percentConcluded,
      briefDescription: briefDescription ?? this.briefDescription,
      items: items ?? this.items,
      access: access ?? this.access,
      creationDate: creationDate ?? this.creationDate,
      createdBy: createdBy ?? this.createdBy,
      lastChangeDate: lastChangeDate ?? this.lastChangeDate,
      lastChangeBy: lastChangeBy ?? this.lastChangeBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'percentConcluded': percentConcluded,
      'briefDescription': briefDescription,
      'items': items?.map((x) => x?.toMap())?.toList(),
      'access': access?.map((x) => x?.toMap())?.toList(),
      'creationDate': creationDate?.millisecondsSinceEpoch,
      'createdBy': createdBy,
      'lastChangeDate': lastChangeDate?.millisecondsSinceEpoch,
      'lastChangeBy': lastChangeBy,
    };
  }

  static ListModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ListModel(
      id: map['id'],
      title: map['title'],
      percentConcluded: map['percentConcluded'],
      briefDescription: map['briefDescription'],
      items: List<ListItemModel>.from(
          map['items']?.map((x) => ListItemModel.fromMap(x))),
      access: List<UserAccess>.from(
          map['access']?.map((x) => UserAccess.fromMap(x))),
      creationDate: map['creationDate'],
      createdBy: map['createdBy'],
      lastChangeDate: map['lastChangeDate'],
      lastChangeBy: map['lastChangeBy'],
    );
  }

  String toJson() => json.encode(toMap());

  static ListModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListModel(id: $id, title: $title, percentConcluded: $percentConcluded, briefDescription: $briefDescription, items: $items, access: $access, creationDate: $creationDate, createdBy: $createdBy, lastChangeDate: $lastChangeDate, lastChangeBy: $lastChangeBy)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListModel &&
        o.id == id &&
        o.title == title &&
        o.percentConcluded == percentConcluded &&
        o.briefDescription == briefDescription &&
        listEquals(o.items, items) &&
        listEquals(o.access, access) &&
        o.creationDate == creationDate &&
        o.createdBy == createdBy &&
        o.lastChangeDate == lastChangeDate &&
        o.lastChangeBy == lastChangeBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        percentConcluded.hashCode ^
        briefDescription.hashCode ^
        items.hashCode ^
        access.hashCode ^
        creationDate.hashCode ^
        createdBy.hashCode ^
        lastChangeDate.hashCode ^
        lastChangeBy.hashCode;
  }
}
