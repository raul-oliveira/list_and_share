import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/my_lists/models/list_model.dart';

class MyListItemWidget extends StatelessWidget {
  const MyListItemWidget({Key key, this.item}) : super(key: key);
  
  final ListModel item;
  
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
      trailing: Icon(Icons.delete),
      onTap: () {
        Modular.to.pushReplacementNamed('/detail');
      },
    );
  }
}
