import 'package:book_club/Screens/Login/login.dart';
import 'package:book_club/Utils/our_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: const OurLogin(),
    );
  }
}
