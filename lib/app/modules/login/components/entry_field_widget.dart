import 'package:flutter/material.dart';

class EntryFieldWidget extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextEditingController textEditingController;
  final Function validator;

  EntryFieldWidget({
    Key key,
    this.title,
    this.isPassword = false,
    this.textEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            key: key,
            validator: (value) {
              return validator(value);
            },
            controller: textEditingController,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }
}
