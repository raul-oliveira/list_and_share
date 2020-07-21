import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'list_detail_controller.dart';

class ListDetailPage extends StatefulWidget {
  final String title;
  const ListDetailPage({Key key, this.title = "ListDetail"}) : super(key: key);

  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState
    extends ModularState<ListDetailPage, ListDetailController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: controller.backToMyLists,
          ),
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
