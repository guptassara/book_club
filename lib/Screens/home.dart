import 'package:book_club/Screens/Root/root.dart';
import 'package:book_club/States/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "This is home",
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Log Out"),
          onPressed: () async {
            CurrentUser _currentUSer =
                Provider.of<CurrentUser>(context, listen: false);
            String? _returnString = await _currentUSer.signOut();
            if(_returnString == "success"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => OurRoot(),
                ),
                (route) => false);
            }
          },
        ),
      ),
    );
  }
}
