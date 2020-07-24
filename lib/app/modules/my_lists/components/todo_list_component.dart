import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/components/todo_item_widget.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/pages/list_detail/list_detail_controller.dart';

class TodoListWidget extends StatelessWidget {
  final List<ListItemModel> list;
  final ListDetailController controller;

  const TodoListWidget(
      {Key key, @required this.list, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(list.toString());
    return ListView.builder(
        itemCount: list?.length ?? 0,
        itemBuilder: (_, index) {
          return TodoItemWidget(
            item: list[index],
            controller: controller,
          );
        });
  }
}
