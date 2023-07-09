

import 'dart:developer';

import 'package:book_club/Models/book.dart';
import 'package:book_club/Models/group.dart';
import 'package:flutter/material.dart';

class CurrentGroup extends ChangeNotifier {
  late OurGroup? _currentGroup = OurGroup();
  late OurBook? _currentBook = OurBook();

  OurGroup? get getCurrentGroup => _currentGroup;
  OurBook? get getCurrentBook => _currentBook;

  void updateStateFromDatabase(String groupID) async {
    try {
      //get the groupInfo from firebase

      //get the current book info from firebase
    } catch (e) {
      log(e.toString());
    }
  }
}
