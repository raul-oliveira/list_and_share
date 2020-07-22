import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/my_lists_controller.dart';

class AddListDialogWidget extends StatelessWidget {
  final MyListsController controller;

  const AddListDialogWidget({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create new list'),
      content: TextField(
        decoration: InputDecoration(hintText: 'List name'),
        controller: controller.newlistNameController,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text('Create'),
          onPressed: () {
            controller.addList();
            controller.newlistNameController.value = TextEditingValue();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
