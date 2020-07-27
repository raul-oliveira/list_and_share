import 'package:flutter/material.dart';

import 'entry_field_widget.dart';

class EmailPasswordWidget extends StatelessWidget {
  final bool username;
  final bool email;
  final bool password;

  const EmailPasswordWidget(
      {Key key, this.username = true, this.email = true, this.password = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this.username ? EntryFieldWidget(title: "Username") : Container(),
        this.email ? EntryFieldWidget(title: "Email") : Container(),
        this.password
            ? EntryFieldWidget(title: "Password", isPassword: true)
            : Container(),
      ],
    );
  }
}
