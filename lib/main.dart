import 'package:book_club/Screens/Login/login.dart';
import 'package:book_club/Screens/root/root.dart';
import 'package:book_club/States/current_user.dart';
import 'package:book_club/Utils/our_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        theme: OurTheme().buildTheme(),
        debugShowCheckedModeBanner: false,
        home: const OurLogin(),
      ),
    );
  }
}
