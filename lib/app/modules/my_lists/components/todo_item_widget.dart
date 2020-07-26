import 'package:flutter/material.dart';
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
      onTap: () {
        controller.store.toggleCheckTodoItem(item);
      },
      leading: IconButton(
        icon: Icon(item?.checked == true
            ? Icons.check_box
            : Icons.check_box_outline_blank),
        onPressed: () => {controller.store.toggleCheckTodoItem(item)},
      ),
      title: Text(
        item.description,
        style: TextStyle(
            decoration: item?.checked == true
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
