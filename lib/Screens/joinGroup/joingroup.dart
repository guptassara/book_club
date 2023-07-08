// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:developer';

import 'package:book_club/Services/database.dart';
import 'package:book_club/States/current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Root/root.dart';

class OurJoinGroup extends StatefulWidget {
  const OurJoinGroup({super.key});

  @override
  State<OurJoinGroup> createState() => _OurJoinGroupState();
}

class _OurJoinGroupState extends State<OurJoinGroup> {
  Future<void> _joinGroup(BuildContext context, String groupID) async {
    
    CurrentUser _currentUSer = Provider.of(context, listen: false);
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String _returnString =
          await OurDataBase().joinGroup(groupID, user.uid.toString());
      log(_returnString);
      log(_currentUSer.getcurrentUser!.uid.toString());
      log(_currentUSer.getcurrentUser.toString());
      if (_returnString == "success") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const OurRoot(),
            ),
            (route) => false);
      }
    } else {
      log("No Group created");
    }
  }

  TextEditingController _groupIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: const [BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _groupIDController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Id",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      _joinGroup(context, _groupIDController.text);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Join",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
