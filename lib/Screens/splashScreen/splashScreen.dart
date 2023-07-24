// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OurSplashScreen extends StatelessWidget {
  const OurSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
              height: 20,
            ),
            Text("loading...")
          ],
        ),
      ),
    );
  }
}
