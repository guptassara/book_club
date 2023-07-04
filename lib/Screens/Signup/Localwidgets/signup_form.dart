// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:developer';

import 'package:book_club/Screens/Login/login.dart';
import 'package:book_club/Screens/Root/root.dart';
import 'package:book_club/States/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/our_container.dart';
import 'package:email_validator/email_validator.dart';

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

  void _signUpUser(
    String? email,
    String? password,
    BuildContext context,
    String fullName,
  ) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      // switch (type) {
      //   case LoginType.email:
      //     _returnString =
      //         await _currentUser.logInUserWithEmail(email!, password!);

      //     break;
      //   case LoginType.google:
      //     _returnString = await _currentUser.();

      //     break;
      //   default:
      // }

      String? _returnString =
          await _currentUser.signUpUser(email!, password!, fullName);
      log(_returnString!);
      if (_returnString == "success") {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const OurRoot()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: OurContainer(
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
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: "Full Name"),
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
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  _signUpUser(_emailController.text, _passwordController.text,
                      context, _fullNameController.text);
                  final bool isValid =
                      EmailValidator.validate(_emailController.text);

                  (isValid
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OurLogin(),
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("invalid email"),
                            duration: Duration(seconds: 2),
                          ),
                        ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Passwords do not match"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Sign up",
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
                Navigator.popUntil(context, (Route) => Route.isFirst);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OurLogin(),
                  ),
                );
              },
              child: Text(
                "Already have an account? Sign in",
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
            // GoogleButton(
            //     "Sign up with Google",
            //     _signUpUser(
            //         LoginType.google, null, null, context as BuildContext)),
          ],
        ),
      ),
    );
  }
}
