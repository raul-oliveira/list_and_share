import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/my_lists/components/list_permission_widget.dart';
import 'list_edit_controller.dart';

class ListEditPage extends StatefulWidget {
  final String title;

  const ListEditPage({Key key, this.title = "List Settings"}) : super(key: key);

  @override
  _ListEditPageState createState() => _ListEditPageState();
}

class _ListEditPageState
    extends ModularState<ListEditPage, ListEditController> {
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.utils.backPage();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: controller.utils.backPage,
          ),
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'List name: ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      focusNode: focusNode,
                      decoration:
                          InputDecoration(enabled: controller.isEditing),
                      controller: controller.listNameController,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    controller.isEditing ? Icons.check : Icons.edit,
                    color: controller.isEditing
                        ? Theme.of(context).accentColor
                        : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      if (controller.isEditing == true) {
                        controller.updateListName();
                      }
                      controller
                          .toggleEditing()
                          .then((value) => focusNode.requestFocus());
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'User control',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            new Expanded(
              child: Observer(builder: (context) {
                if (controller.store.selectedList == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListPermission(
                  controller: controller,
                );
              }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text('Add new user'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'e-mail@sample.com'),
                  controller: controller.newUserController,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () => controller.utils.backPage(),
                  ),
                  FlatButton(
                    child: Text('Add'),
                    onPressed: () {
                      controller.addUser();
                      controller.utils.backPage();
                    },
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
