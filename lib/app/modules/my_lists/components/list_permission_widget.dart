import 'package:flutter/material.dart';
import 'package:list_and_share/app/modules/my_lists/enums/access_level_enum.dart';
import 'package:list_and_share/app/modules/my_lists/pages/list_edit/list_edit_controller.dart';

class ListPermission extends StatefulWidget {
  final ListEditController controller;

  ListPermission({Key key, @required this.controller}) : super(key: key);

  @override
  _ListPermissionState createState() => _ListPermissionState(this.controller);
}

class _ListPermissionState extends State<ListPermission> {
  final ListEditController controller;

  _ListPermissionState(this.controller);

  List<DropdownMenuItem<dynamic>> generateDropDownItens() {
    var dropDownItems = List<DropdownMenuItem<dynamic>>();

    for (var value in AccessLevelEnum.values) {
      dropDownItems.add(
        DropdownMenuItem(
          value: value.index,
          child: Text('${value.toString().split('.').last}'),
        ),
      );
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.store.access.length,
        itemBuilder: (_, index) {
          var item = controller.store.access[index];
          return ListTile(
            title: Text(item.user.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton(
                  value: item.accessLevel.index,
                  items: [...generateDropDownItens()],
                  onChanged: (value) {
                    setState(() {
                      item.accessLevel = AccessLevelEnum.values[value];
                      controller.updateUserAcess(item);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.removeUserAccess(item);
                  },
                ),
              ],
            ),
          );
        });
  }
}
