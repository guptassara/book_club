import 'package:flutter/material.dart';
import 'package:book_club/Utils/our_theme.dart';

Widget GoogleButton(String read, void pressFunction) {
  return OutlinedButton(
    onPressed: () {
      pressFunction;
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage("assets/googleIcon.png"),
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              read,
            ),
          ),
        ],
      ),
    ),
  );
}
