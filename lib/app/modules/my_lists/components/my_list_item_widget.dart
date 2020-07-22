import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';
import 'package:list_and_share/app/modules/my_lists/my_lists_controller.dart';

class MyListItemWidget extends StatelessWidget {
  const MyListItemWidget({Key key, this.item, this.controller})
      : super(key: key);

  final ListModel item;
  final MyListsController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          item.title,
          style: TextStyle(fontSize: 16),
        ),
      ),
      subtitle: Text('${item.percentConcluded}% - ${item.briefDescription}...'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          controller.delete(item.id);
        },
      ),
      onTap: () {
        Modular.to.pushReplacementNamed('/detail');
      },
    );
  }
}
