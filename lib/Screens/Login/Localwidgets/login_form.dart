// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:developer';

import 'package:book_club/Screens/Signup/signup.dart';
import 'package:book_club/States/current_user.dart';
import 'package:book_club/Widgets/our_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import '../../Root/root.dart';

enum LoginType {
  email,
  google,
}

class OurLoginForm extends StatefulWidget {
  const OurLoginForm({super.key});

  @override
  State<OurLoginForm> createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser(
    LoginType type,
    String? email,
    String? password,
    BuildContext context,
  ) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String? _returnString;
      switch (type) {
        case LoginType.email:
          _returnString =
              await _currentUser.logInUserWithEmail(email!, password!);

          break;
        case LoginType.google:
          _returnString = await _currentUser.logInUserWithGoogle();

          break;
        default:
      }

      if (_returnString == "success") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OurRoot(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString!),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Widget _googleButton() {
    return ElevatedButton(
      onPressed: () {
        _loginUser(LoginType.google, null, null, context);
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage("assets/googleIcon.png"),
              height: 27,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Sign In With Google",
                // style: TextStyle(
                //    color: Color(0xffc0c0c5),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                prefixIcon: Icon(Icons.alternate_email),
                hintText: "Email"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Password"),
            obscureText: true,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _loginUser(LoginType.email, _emailController.text,
                  _passwordController.text, context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // fontSize: 20.0,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                TurnPageRoute(
                  animationTransitionPoint: null,
                  transitionDuration: const Duration(milliseconds: 300),
                  reverseTransitionDuration: const Duration(milliseconds: 300),
                  builder: (context) => const OurSignup(),
                ),
              );
            },
            child: Text(
              "Don't have an account? Sign up",
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
          _googleButton(),
          // GoogleButton(
          //     "Sign in with Google",
          //     _loginUser(
          //         LoginType.google, null, null, context as BuildContext)),
        ],
      ),
    );
  }
}
