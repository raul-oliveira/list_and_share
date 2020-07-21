import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/components/list_item_widget.dart';

import 'my_list_item_widget.dart';

class MyListsWidget extends StatefulWidget {
  MyListsWidget({Key key}) : super(key: key);

  @override
  _MyListsWidgetState createState() => _MyListsWidgetState();
}

class _MyListsWidgetState extends State<MyListsWidget> {
  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];
    for (var i = 0; i < 15; i++) {
      items.add(MyListItemWidget());
    }
    return ListView(
      children: [...items],
    );
  }
}
