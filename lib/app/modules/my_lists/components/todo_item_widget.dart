import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/pages/list_detail/list_detail_controller.dart';

class TodoItemWidget extends StatelessWidget {
  final ListItemModel item;
  final ListDetailController controller;

  const TodoItemWidget(
      {Key key, @required this.item, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
            item.checked ? Icons.check_box : Icons.check_box_outline_blank),
        onPressed: () => {controller.checkTodoItem(item.id)},
      ),
      title: Text(
        item.description,
        style: TextStyle(
            decoration: item.checked
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {
          controller.removeTodoItem(item.id);
        },
      ),
    );
  }
}
