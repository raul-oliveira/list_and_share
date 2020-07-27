import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_and_share/app/modules/my_lists/components/add_todo_item_widget.dart';
import 'package:list_and_share/app/modules/my_lists/components/todo_list_component.dart';
import 'list_detail_controller.dart';

class ListDetailPage extends StatefulWidget {
  final String title;
  final String listId;
  const ListDetailPage(
      {Key key, this.title = "List Detail", @required this.listId})
      : super(key: key);

  @override
  _ListDetailPageState createState() => _ListDetailPageState(int.parse(listId));
}

class _ListDetailPageState
    extends ModularState<ListDetailPage, ListDetailController> {
  _ListDetailPageState(int listId) {
    controller.store.setSelectedList(listId);
  }
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onBackPressed,
      child: Scaffold(
        appBar: AppBar(
            leading: BackButton(
              onPressed: controller.onBackPressed,
            ),
            title: Text(widget.title),
            actions: [
              Observer(builder: (_) {
                if (controller?.store?.isAdmin == null ||
                    !controller.store.isAdmin) {
                  return Container();
                }

                return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Modular.to.pushNamed('myLists/edit');
                  },
                );
              })
            ]),
        body: Observer(
          builder: (_) {
            debugPrint(controller?.store?.contador.toString());
            if (controller?.store?.selectedList == null) {
              return Center(child: CircularProgressIndicator());
            }
            if (controller?.store?.todoItems == null) {
              return Center(child: CircularProgressIndicator());
            }

            return TodoListWidget(
                controller: controller, list: controller.store.todoItems);
          },
        ),
        bottomSheet: AddTodoItemWidget(controller),
      ),
    );
  }
}
