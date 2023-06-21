import 'package:book_club/Screens/Root/root.dart';
import 'package:book_club/States/current_user.dart';
import 'package:book_club/Widgets/our_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _signOut(BuildContext context) async {
    CurrentUser _currentUSer = Provider.of<CurrentUser>(context, listen: false);
    String? _returnString = await _currentUSer.signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OurRoot(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView(
          children: [
            OurContainer(
              child: Text("1."),
            ),
            OurContainer(
              child: Text("2."),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text("Book Club History"),
            ),
            Center(
              child: ElevatedButton(
                child: const Text("Log Out"),
                onPressed: () => _signOut(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
