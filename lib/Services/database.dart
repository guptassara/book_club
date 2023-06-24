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

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();
    try {
      var firestore = FirebaseFirestore.instance;
      DocumentSnapshot _docSnapshot =
          await firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docSnapshot[0].data("fullName") as String?;
      retVal.email = _docSnapshot[0].data("email") as String?;
      retVal.accountCreated =
          _docSnapshot[0].data("accountCreated") as Timestamp?;
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }
}
