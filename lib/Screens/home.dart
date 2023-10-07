// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_print

import 'package:book_club/Screens/Root/root.dart';
import 'package:book_club/Screens/noGroup/noGroup.dart';
import 'package:book_club/States/currentGroup.dart';
import 'package:book_club/States/current_user.dart';
import 'package:book_club/Widgets/our_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // implement initState
    super.initState();
    CurrentUser _currentUser =
        CurrentUser(); //Provider.of<CurrentUser>(context, listen: false);
    CurrentGroup _currentGroup = CurrentGroup();
    // Provider.of<CurrentGroup>(context, listen: false);
    _currentGroup.updateStateFromDatabase(_currentUser.getcurrentUser?.groupID);
  }

  void _goToNoGroup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OurNoGroup(),
      ),
    );
  }

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

//   void _showBookName(BuildContext context) async {
// Navigator.push(context, MaterialPageRoute(builder: (context){
//   Consumer<>(),
// }));
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Center(
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: OurContainer(
                  child: Column(
                    children: [
                      const Text(
                        'Harry Potter and the philosopher\'s stone',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Due In: ",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Text(
                              "8 days",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Finished Book"),
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 40.0),
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                child: OurContainer(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Next book reveal in:",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "22 days",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  onPressed: () => _goToNoGroup(context),
                  child: const Text("Book Club History"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: OutlinedButton(
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(darkBrown),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.black),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          40.0,
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    if (await confirm(context)) {
                      _signOut(context);
                    }
                    return print('pressedCancel');
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
