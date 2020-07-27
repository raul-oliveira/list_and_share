import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Column(
        children: <Widget>[
          Text(
            'Quick login with Touch ID',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
          Icon(Icons.fingerprint, size: 90, color: Colors.white),
          SizedBox(
            height: 20,
          ),
          Text(
            'Touch ID',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
