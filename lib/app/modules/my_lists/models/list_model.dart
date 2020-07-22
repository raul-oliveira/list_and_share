import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:list_and_share/app/modules/my_lists/models/user_access.dart';

import 'list_item_model.dart';
import 'loggin_attrs_model.dart';

class ListModel extends LogginAttrsModel {
  int id;
  String title;
  double percentConcluded;
  String briefDescription;

  List<ListItemModel> items;

  List<UserAccess> access;
  ListModel({
    this.id,
    this.title,
    this.percentConcluded,
    this.briefDescription,
    this.items,
    this.access,
  });

  ListModel copyWith({
    int id,
    String title,
    double percentConcluded,
    String briefDescription,
    List<ListItemModel> items,
    List<UserAccess> access,
  }) {
    return ListModel(
      id: id ?? this.id,
      title: title ?? this.title,
      percentConcluded: percentConcluded ?? this.percentConcluded,
      briefDescription: briefDescription ?? this.briefDescription,
      items: items ?? this.items,
      access: access ?? this.access,
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
    };
  }

  static ListModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ListModel(
      id: map['id'],
      title: map['title'],
      percentConcluded: map['percentConcluded'],
      briefDescription: map['briefDescription'],
      items: List<ListItemModel>.from(map['items']?.map((x) => ListItemModel.fromMap(x))),
      access: List<UserAccess>.from(map['access']?.map((x) => UserAccess.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static ListModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListModel(id: $id, title: $title, percentConcluded: $percentConcluded, briefDescription: $briefDescription, items: $items, access: $access)';
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
      listEquals(o.access, access);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      percentConcluded.hashCode ^
      briefDescription.hashCode ^
      items.hashCode ^
      access.hashCode;
  }
}
