import 'package:flutter/material.dart';

Widget _googleButton() {
  return OutlinedButton(
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Image(
            image: AssetImage("assets/googleIcon.png"),
            height: 27,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Sign in with google",
            ),
          ),
        ],
      ),
    ),
  );
}
