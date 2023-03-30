// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:book_club/Screens/Login/login.dart';
import 'package:book_club/States/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/our_container.dart';

class OurSignUpForm extends StatefulWidget {
  const OurSignUpForm({super.key});

  @override
  State<OurSignUpForm> createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _signUpUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String? _returnString = await _currentUser.signUpUser(email, password);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString!),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
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
              "Sign up",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline), hintText: "Full Name"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
            obscureText: true,
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_open_outlined),
                hintText: "Confirm Password"),
            obscureText: true,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(
                    _emailController.text, _passwordController.text, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Passwords do not match"),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Sign up",
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const OurLogin(),
                ),
              );
            },
            child: Text(
              "Already have an account? Sign in here",
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
          _googleButton(),
        ],
      ),
    );
  }
}

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
              "Sign up with google",
              style: TextStyle(
                fontSize: 20,
                color: Color(
                  (0xff151618),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
