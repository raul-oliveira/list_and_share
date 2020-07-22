import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/my_lists_widget.dart';
import 'my_lists_controller.dart';

class MyListsPage extends StatefulWidget {
  final String title;
  const MyListsPage({Key key, this.title = "My Lists"}) : super(key: key);

  @override
  _MyListsPageState createState() => _MyListsPageState();
}

class _MyListsPageState extends ModularState<MyListsPage, MyListsController> {
  //use 'controller' variable to access controller

  final _listNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.myLists?.error != null) {
          return Center(
            child: Text('Erro'),
          );
        }
        if (controller.myLists?.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var list = controller.myLists?.value;
        return MyListsWidget(list: list);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text('Create new list'),
              content: TextField(
                decoration: InputDecoration(hintText: 'List name'),
                controller: _listNameController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: Text('Create'),
                  onPressed: () {
                    controller.addList(_listNameController.value.text);
                    _listNameController.value = TextEditingValue();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
