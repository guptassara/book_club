import 'package:book_club/Screens/Login/login.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/our_container.dart';

class OurSignUpForm extends StatelessWidget {
  const OurSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Sign up",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline), hintText: "Full Name"),
        ),
        const SizedBox(
          height: 20.0,
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
        const SizedBox(
          height: 20.0,
        ),
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_open_outlined),
              hintText: "Confirm Password"),
          obscureText: true,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {},
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
        )
      ]),
    );
  }
}
