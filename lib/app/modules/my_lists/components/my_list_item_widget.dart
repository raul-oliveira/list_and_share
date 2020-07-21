import 'package:flutter/material.dart';

class MyListItemWidget extends StatelessWidget {
  const MyListItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          'List one',
          style: TextStyle(fontSize: 16),
        ),
      ),
      subtitle: Text('70% - Item 1, Item 2, Item 3, Item 4, Item 5...'),
      trailing: Icon(Icons.delete),
      onTap: () {},
    );
  }
}
