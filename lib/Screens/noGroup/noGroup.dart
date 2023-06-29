// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class OurNoGroup extends StatelessWidget {
  const OurNoGroup({super.key});

  @override
  Widget build(BuildContext context) {
    void _goToJoin() {}
    void _goToCreate() {}
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(
              80.0,
            ),
            child: Image.asset("assets/logo.png"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "WELCOME TO BOOK CLUB",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Since, you are not in a book club, you can select either to join a club or create a club",
              style: TextStyle(
                fontSize: 19,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(180, 43)),
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
                  onPressed: () {
                    _goToCreate();
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _goToJoin();
                  },
                  child: const Text(
                    "Join",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
