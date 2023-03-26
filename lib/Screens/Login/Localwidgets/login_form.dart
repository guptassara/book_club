import 'package:book_club/Screens/Signup/signup.dart';
import 'package:book_club/Widgets/our_container.dart';
import 'package:flutter/material.dart';

class OurLoginForm extends StatelessWidget {
  const OurLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {},
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const OurSignup(),
              ),
            );
          },
          child: Text(
            "Don't have an account? Sign up here",
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          ),
        )
      ]),
    );
  }
}
