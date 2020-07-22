import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/add_list_dialog_widget.dart';
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
        if (controller.loading || controller.myLists?.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return MyListsWidget(
          controller: controller,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AddListDialogWidget(
              controller: controller,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
