// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pagescroll/widgets/neomorphism.dart';

class Pipe extends StatelessWidget {
  const Pipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEEEE),
      body: Align(
        alignment: Alignment(0, 0),
        child: Neomorphism(),
      ),
    );
  }
}
