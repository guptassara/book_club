import 'package:book_club/Screens/Signup/Localwidgets/signup_form.dart';
import 'package:flutter/material.dart';

class OurSignup extends StatelessWidget {
  const OurSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: const [
                //     Padding(
                //       padding: EdgeInsets.only(
                //         top: 50,
                //       ),
                //       child: BackButton(),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                  child: Image.asset("assets/logo.png"),
                ),

                const OurSignUpForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
