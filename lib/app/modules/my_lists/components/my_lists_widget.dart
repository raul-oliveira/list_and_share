import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/my_lists_controller.dart';

import 'my_list_item_widget.dart';

class MyListsWidget extends StatefulWidget {
  MyListsWidget({Key key, this.controller}) : super(key: key);

  final MyListsController controller;

  @override
  _MyListsWidgetState createState() => _MyListsWidgetState(controller);
}

class _MyListsWidgetState extends State<MyListsWidget> {
  _MyListsWidgetState(this.controller);

  final MyListsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.myLists?.value?.length,
      itemBuilder: (BuildContext context, int index) {
        return MyListItemWidget(item: controller.myLists?.value[index], controller: controller);
      },
    );
  }
}
