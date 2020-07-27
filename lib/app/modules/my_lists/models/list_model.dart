import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';
import 'list_item_model.dart';

class ListModel {
  int id;
  List<dynamic> accessHeader;
  String title;
  List<ListItemModel> items;
  List<UserAccess> access;
  Timestamp creationDate;
  String createdBy;
  Timestamp lastChangeDate;
  String lastChangeBy;

  ListModel({
    this.id,
    this.accessHeader,
    this.title,
    this.items,
    this.creationDate,
    this.createdBy,
    this.lastChangeDate,
    this.lastChangeBy,
    this.access,
  }) {
    this.access ??= new List<UserAccess>();
    this.items ??= new List<ListItemModel>();
  }

  double get percentConcluded {
    var total = items.length;
    if (total == 0) return 0;

    var checked =
        items.fold(0, (prev, element) => prev + (element.checked ? 1 : 0));
    return (checked / total) * 100;
  }

  String get briefDescription {
    if (items.isEmpty) return 'Empty';
    var todos = items.map((e) => e.description).join(', ');
    return todos.substring(0, todos.length > 50 ? 50 : todos.length);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accessHeader': accessHeader,
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
      accessHeader: map['accessHeader'],
      title: map['title'],
      items: List<ListItemModel>.from(
          map['items']?.map((x) => ListItemModel.fromMap(x))),
      access: List<UserAccess>.from(
          map['access']?.map((x) => UserAccess.fromMap(x))),
      creationDate: Timestamp.fromMillisecondsSinceEpoch(map['creationDate']),
      createdBy: map['createdBy'],
      lastChangeDate:
          Timestamp.fromMillisecondsSinceEpoch(map['lastChangeDate']),
      lastChangeBy: map['lastChangeBy'],
    );
  }

  String toJson() => json.encode(toMap());

  static ListModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListModel(id: $id, accessHeader: $accessHeader title: $title, percentConcluded: $percentConcluded, briefDescription: $briefDescription, items: $items, access: $access, creationDate: $creationDate, createdBy: $createdBy, lastChangeDate: $lastChangeDate, lastChangeBy: $lastChangeBy)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListModel &&
        o.accessHeader == accessHeader &&
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
        accessHeader.hashCode ^
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
