// "//how to create a neomorphism app widget in flutter?"

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Neomorphism extends StatefulWidget {
  Neomorphism({Key? key}) : super(key: key);

  @override
  State<Neomorphism> createState() => _NeomorphismState();
}

class _NeomorphismState extends State<Neomorphism> {
  bool isTaped = false;
  double box = 100;
  double shadowsize = 10;

  @override
  Widget build(BuildContext context) {
    Offset offset = Offset(shadowsize, shadowsize);
    double blur = isTaped ? 9 : 8;

    Color dark = Colors.black;
    Color light = Colors.white;

    return GestureDetector(
      onTapDown: (details) {
        details.globalPosition;
        setState(() {
          isTaped = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTaped = false;
        });
      },
      child: Container(
        width: box + 100,
        height: box,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isTaped ? light.withOpacity(1) : light.withOpacity(0.5),
              offset: -offset,
              blurRadius: blur,
              inset: isTaped,
            ),
            BoxShadow(
              color: isTaped ? dark.withOpacity(0.3) : dark.withOpacity(0.05),
              offset: offset,
              blurRadius: blur,
              inset: isTaped,
            ),
          ],
          color: Color(0xFFEFEEEE),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

Widget lighterTheme(Offset offset) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.8),
          offset: -offset,
          blurRadius: 16.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: offset,
          blurRadius: 16.0,
        ),
      ],
      color: Color(0xFFEFEEEE),
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}

Widget darkerTheme() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          offset: Offset(-6.0, -6.0),
          blurRadius: 16.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          offset: Offset(6.0, 6.0),
          blurRadius: 16.0,
        ),
      ],
      color: Color(0xFF292D32),
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}
