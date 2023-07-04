// ignore_for_file: file_names, prefer_final_fields, non_constant_identifier_names, avoid_types_as_parameter_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:developer';

import 'package:book_club/Screens/Root/root.dart';
import 'package:book_club/Services/database.dart';
import 'package:book_club/States/current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurCreateGroup extends StatefulWidget {
  const OurCreateGroup({super.key});

  @override
  State<OurCreateGroup> createState() => _OurCreateGroupState();
}

class _OurCreateGroupState extends State<OurCreateGroup> {
  Future<void> _createGroup(BuildContext context, String groupName) async {
    CurrentUser _currentUSer = Provider.of(context, listen: false);
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String _returnString =
          await OurDataBase().createGroup(groupName, user.uid.toString());
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

  TextEditingController _groupNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [BackButton()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _groupNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Name",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      _createGroup(context, _groupNameController.text);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Create",
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
