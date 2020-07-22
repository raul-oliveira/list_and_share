import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';

import 'my_list_item_widget.dart';

class MyListsWidget extends StatefulWidget {
  MyListsWidget({Key key, this.list}) : super(key: key);

  final List<ListModel> list;

  @override
  _MyListsWidgetState createState() => _MyListsWidgetState(list);
}

class _MyListsWidgetState extends State<MyListsWidget> {
  _MyListsWidgetState(this.list);

  final List<ListModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return MyListItemWidget(item: list[index]);
      },
    );
  }
}
