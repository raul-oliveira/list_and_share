import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_item_model.dart';
import 'package:list_and_share/app/modules/my_lists/pages/list_detail/list_detail_controller.dart';

class AddTodoItemWidget extends StatelessWidget {
  final ListDetailController _controller;

  const AddTodoItemWidget(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBarTextColor = Theme.of(context).primaryTextTheme.headline6.color;
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextField(
                cursorColor: appBarTextColor,
                focusNode: _controller.todoItemDescriptionFocus,
                controller: _controller.todoItemDescriptionController,
                onSubmitted: (text) async {
                  await _controller
                      .addTodoitem(ListItemModel(description: text));
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Add new item',
                    hintStyle: TextStyle(
                        color: Theme.of(context)
                            .appBarTheme
                            .textTheme
                            ?.headline4
                            ?.color)),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: appBarTextColor,
            ),
            onPressed: () async {
              if (_controller.todoItemDescriptionController.text.length < 0)
                await _controller.addTodoitem(ListItemModel(
                    description:
                        _controller.todoItemDescriptionController.text));
              if (!_controller.todoItemDescriptionFocus.hasFocus) {
                _controller.todoItemDescriptionFocus.requestFocus();
              }
            },
          )
        ],
      ),
    );
  }
}
