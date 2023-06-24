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
        ],
      ),
    );
  }
}
