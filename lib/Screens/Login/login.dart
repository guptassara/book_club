import 'package:book_club/Screens/Login/Localwidgets/login_form.dart';
import 'package:flutter/material.dart';

class OurLogin extends StatelessWidget {
  const OurLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Image.asset(
                    "assets/logo.png",
                    height: 150,
                  ),
                ),

                const OurLoginForm(),
                // const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
