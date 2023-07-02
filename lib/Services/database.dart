// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:book_club/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDataBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      }).onError((error, stackTrace) {
        log(error.toString());
      });
      retVal = "success";
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }

  Future<OurUser?> getUserInfo(String uid) async {
    OurUser retVal;
    try {
      var firestore = FirebaseFirestore.instance;
      DocumentSnapshot _docSnapshot =
          await firestore.collection("users").doc(uid).get();
      log(_docSnapshot.data().toString());

      retVal = OurUser.fromMap(_docSnapshot.data() as Map<String, dynamic>);

      log("w");

      return retVal;
    } catch (e) {
      log(e.toString());
      log("messagee");
    }
    return null;
  }
}
