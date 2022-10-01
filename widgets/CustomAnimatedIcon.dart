// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animated_Icon extends StatelessWidget {
  const Animated_Icon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currIndex = 0;

    return StatefulBuilder(
      builder: (context, setState) => IconButton(
        color: Colors.red[900],
        icon: AnimatedSwitcher(
            switchInCurve: Curves.easeIn,
            reverseDuration: const Duration(microseconds: 500),
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, anim) => ScaleTransition(
                  scale: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 1.5, end: 1).animate(anim)
                      : Tween<double>(begin: 1.5, end: 1).animate(anim),
                  child: FadeTransition(opacity: anim, child: child),
                ),
            child: currIndex == 0
                ? const Icon(CupertinoIcons.heart, key: ValueKey('icon1'))
                : const Icon(
                    CupertinoIcons.heart_fill,
                    key: ValueKey('icon2'),
                  )),
        onPressed: () {
          setState(() {
            currIndex = currIndex == 0 ? 1 : 0;
          });
        },
      ),
    );
  }
}
