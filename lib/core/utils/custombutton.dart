import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/mediaquery.dart';

class custombutton extends StatelessWidget {
  final String text;
  final Color buttoncolor1;
  final Color buttoncolor2;

  const custombutton(
      {super.key,
      required this.text,
      this.buttoncolor1 = buttonleftcolor,
      this.buttoncolor2 = buttonrightcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: width(0.135, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [buttoncolor1, buttoncolor2],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
          child: Text(text,
              style: TextStyle(
                  color: buttoncolor1 == Color.fromARGB(255, 202, 202, 202)
                      ? Splashbottomcolor
                      : white,
                  fontSize: height(0.021, context),
                  fontWeight: FontWeight.bold))),
    );
  }
}
