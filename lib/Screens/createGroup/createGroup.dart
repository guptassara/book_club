// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter/material.dart';

class OurCreateGroup extends StatefulWidget {
  const OurCreateGroup({super.key});

  @override
  State<OurCreateGroup> createState() => _OurCreateGroupState();
}

class _OurCreateGroupState extends State<OurCreateGroup> {
  TextEditingController _groupNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [BackButton()],
            ),
          ),
          const Spacer(),
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
                    onPressed: () {},
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
