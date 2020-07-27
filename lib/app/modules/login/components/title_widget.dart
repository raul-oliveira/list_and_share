import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final bool useSecondColor;

  const TitleWidget({Key key, this.useSecondColor = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'list',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: useSecondColor ? Colors.orange : Colors.white,
          ),
          children: [
            TextSpan(
              text: 'and',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'share',
              style: TextStyle(
                  color: useSecondColor ? Colors.orange : Colors.white,
                  fontSize: 30),
            ),
          ]),
    );
  }
}
