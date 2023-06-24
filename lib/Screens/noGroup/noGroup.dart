import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OurNoGroup extends StatelessWidget {
  const OurNoGroup({super.key});

  @override
  Widget build(BuildContext context) {
    void _goToJoin() {}
    void _goToCreate() {}
    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.all(
              80.0,
            ),
            child: Image.asset("assets/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "WELCOME TO BOOK CLUB",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Since you are not in a book club, you can select either to join a club or create a club",
              style: TextStyle(
                fontSize: 19,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Spacer(
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
                      BorderSide(color: Colors.black),
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
                  child: Text(
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
                  child: Text(
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
