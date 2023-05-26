// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:book_club/Screens/Signup/signup.dart';
import 'package:book_club/Screens/home.dart';
import 'package:book_club/States/current_user.dart';
import 'package:book_club/Widgets/google_button.dart';
import 'package:book_club/Widgets/our_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    @required LoginType type,
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
            builder: (context) => const HomeScreen(),
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
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
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
